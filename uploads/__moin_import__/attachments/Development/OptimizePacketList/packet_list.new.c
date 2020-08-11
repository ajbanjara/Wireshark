/* packet_list.c
 * packet list related functions   2002 Olivier Abad
 *
 * $Id: packet_list.c 16006 2005-09-26 07:08:42Z ulfl $
 *
 * Ethereal - Network traffic analyzer
 * By Gerald Combs <gerald@ethereal.com>
 * Copyright 1998 Gerald Combs
 *
 * This program is free software; you can redistribute it and/or
 * modify it under the terms of the GNU General Public License
 * as published by the Free Software Foundation; either version 2
 * of the License, or (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA  02111-1307, USA.
 */

#ifdef HAVE_CONFIG_H
# include "config.h"
#endif

#include <gtk/gtk.h>
#include <string.h>

#include "globals.h"
#include "gtkglobals.h"
#include "epan/epan.h"
#include "color.h"
#include "color_filters.h"
#include "../ui_util.h"
#include "gui_utils.h"
#include "main.h"
#include "menu.h"
#include "colors.h"
#include <epan/column.h>
#include "epan/column_info.h"
#include "compat_macros.h"
#include <epan/prefs.h>
#include "file_dlg.h"
#include "packet_list.h"
#include "keys.h"
#include "font_utils.h"
#include "packet_history.h"
//#include "cellrenderertext.h"

#include <epan/timestamp.h>

#include "progress_dlg.h"

#define N_PROGBAR_UPDATES 100


GtkWidget *packet_list;

/* XXX - how to get the number of rows from the model or view? */
gint rows = 0;

/* EthClist compare routine, overrides default to allow numeric comparison */

#define COMPARE_FRAME_NUM()	((fdata1->num < fdata2->num) ? -1 : \
				 (fdata1->num > fdata2->num) ? 1 : \
				 0)

#define COMPARE_NUM(f)	((fdata1->f < fdata2->f) ? -1 : \
			 (fdata1->f > fdata2->f) ? 1 : \
			 COMPARE_FRAME_NUM())

/* Compare time stamps.
   A packet whose time is a reference time is considered to have
   a lower time stamp than any frame with a non-reference time;
   if both packets' times are reference times, we compare the
   times of the packets. */
#define COMPARE_TS(ts) \
		((fdata1->flags.ref_time && !fdata2->flags.ref_time) ? -1 : \
		 (!fdata1->flags.ref_time && fdata2->flags.ref_time) ? 1 : \
		 (fdata1->ts.secs < fdata2->ts.secs) ? -1 : \
		 (fdata1->ts.secs > fdata2->ts.secs) ? 1 : \
		 (fdata1->ts.nsecs < fdata2->ts.nsecs) ? -1 :\
		 (fdata1->ts.nsecs > fdata2->ts.nsecs) ? 1 : \
		 COMPARE_FRAME_NUM())

static gint 
packet_list_compare (GtkTreeModel *model,
                                             GtkTreeIter *a,
                                             GtkTreeIter *b,
                                             gpointer user_data)
{
  gint column = GPOINTER_TO_INT(user_data);

  const char *text1;
  const char *text2;

  const frame_data *fdata1;
  const frame_data *fdata2;

  double  num1;
  double  num2;

  int ret;
  gint  col_fmt;

  //g_warning("compare");

  /* Get the frame data structures for the rows */
  gtk_tree_model_get(model, a, cfile.cinfo.num_cols, &fdata1, -1);
  gtk_tree_model_get(model, b, cfile.cinfo.num_cols, &fdata2, -1);

  /* Get row text strings */
  gtk_tree_model_get(model, a, column, &text1, -1);
  gtk_tree_model_get(model, b, column, &text2, -1);


  col_fmt = cfile.cinfo.col_fmt[column];

  switch (col_fmt) {

  case COL_NUMBER:
    return COMPARE_FRAME_NUM();

  case COL_CLS_TIME:
    switch (timestamp_get_type()) {

    case TS_ABSOLUTE:
    case TS_ABSOLUTE_WITH_DATE:
      return COMPARE_TS(abs_ts);

    case TS_RELATIVE:
      return COMPARE_TS(rel_ts);

    case TS_DELTA:
      return COMPARE_TS(del_ts);

    case TS_NOT_SET:
      return 0;
    }
    return 0;

  case COL_ABS_TIME:
  case COL_ABS_DATE_TIME:
    return COMPARE_TS(abs_ts);

  case COL_REL_TIME:
    return COMPARE_TS(rel_ts);

  case COL_DELTA_TIME:
    return COMPARE_TS(del_ts);

  case COL_PACKET_LENGTH:
    return COMPARE_NUM(pkt_len);

  case COL_CUMULATIVE_BYTES:
    return COMPARE_NUM(cum_bytes);

  default:
    num1 = atof(text1);
    num2 = atof(text2);
    if ((col_fmt == COL_UNRES_SRC_PORT) || (col_fmt == COL_UNRES_DST_PORT) ||
        ((num1 != 0) && (num2 != 0) && ((col_fmt == COL_DEF_SRC_PORT) || (col_fmt == COL_RES_SRC_PORT) ||
                                      (col_fmt == COL_DEF_DST_PORT) || (col_fmt == COL_RES_DST_PORT)))) {

      /* Compare numeric column */

      if (num1 < num2)
        return -1;
      else if (num1 > num2)
        return 1;
      else
        return COMPARE_FRAME_NUM();
    }

    else {

      /* Compare text column */
      if (!text2) {
      	if (text1)
      	  return 1;
      	else
      	  return COMPARE_FRAME_NUM();
      }

      if (!text1)
        return -1;

      ret = strcmp(text1, text2);
      if (ret == 0)
        return COMPARE_FRAME_NUM();
      else
        return ret;
    }
  }
}

/* convert row number to iterator */
/* XXX - improve this */
void
row_to_iter(gint row, GtkTreeIter *iter) {
	gboolean ret;

	ret = gtk_tree_model_iter_nth_child(
		gtk_tree_view_get_model(GTK_TREE_VIEW(packet_list)), iter, NULL, row);
	g_assert(ret);
}


/* convert iterator to row number */
/* XXX - improve this */
gint
iter_to_row(GtkTreeIter *iter) {

	gchar* path;
	gint row;

	/* XXX - only since GTK2.2! */
	path = gtk_tree_model_get_string_from_iter(gtk_tree_view_get_model(GTK_TREE_VIEW(packet_list)),
                                             iter);
	row = atoi(path);

	g_free(path);

	return row;
}

static void
tree_selection_changed_cb (GtkTreeSelection *selection, gpointer data)
{
	GtkTreeIter iter;
	GtkTreeModel *model;
	int row;

	cf_unselect_packet(&cfile);

	if (gtk_tree_selection_get_selected (selection, &model, &iter))
	{
		row = iter_to_row(&iter);

		/* Remove the hex display tabbed pages */
		while( (gtk_notebook_get_nth_page( GTK_NOTEBOOK(byte_nb_ptr), 0)))
			gtk_notebook_remove_page( GTK_NOTEBOOK(byte_nb_ptr), 0);

		cf_select_packet(&cfile, row);
		gtk_widget_grab_focus(packet_list);
		packet_history_add(row);
	}
}

/* mark packets */
static void
set_frame_mark(gboolean set, frame_data *frame, gint row) {
  GdkColor fg, bg;

  if (row == -1)
    return;
  if (set) {
    cf_mark_frame(&cfile, frame);
    color_t_to_gdkcolor(&fg, &prefs.gui_marked_fg);
    color_t_to_gdkcolor(&bg, &prefs.gui_marked_bg);
    //eth_clist_set_foreground(ETH_CLIST(packet_list), row, &fg);
    //eth_clist_set_background(ETH_CLIST(packet_list), row, &bg);
  } else {
    color_filter_t *cfilter = frame->color_filter;

    cf_unmark_frame(&cfile, frame);
    /* Restore the color from the matching color filter if any */
    if (cfilter) { /* The packet matches a color filter */
      color_t_to_gdkcolor(&fg, &cfilter->fg_color);
      color_t_to_gdkcolor(&bg, &cfilter->bg_color);
      //eth_clist_set_foreground(ETH_CLIST(packet_list), row, &fg);
      //eth_clist_set_background(ETH_CLIST(packet_list), row, &bg);
    } else { /* No color filter match */
      //eth_clist_set_foreground(ETH_CLIST(packet_list), row, NULL);
      //eth_clist_set_background(ETH_CLIST(packet_list), row, NULL);
    }
  }
}

/* call this after last set_frame_mark is done */
static void mark_frames_ready(void) {
  file_set_save_marked_sensitive();
  packets_bar_update();
}

void packet_list_mark_frame_cb(GtkWidget *w _U_, gpointer data _U_) {
  if (cfile.current_frame) {
    /* XXX hum, should better have a "cfile->current_row" here ... */
    set_frame_mark(!cfile.current_frame->flags.marked,
		   cfile.current_frame,
		   packet_list_find_row_from_data(cfile.current_frame));
    mark_frames_ready();
  }
}

static void mark_all_frames(gboolean set) {
  frame_data *fdata;
  
  /* XXX: we might need a progressbar here */
  for (fdata = cfile.plist; fdata != NULL; fdata = fdata->next) {
    set_frame_mark(set,
		   fdata,
		   packet_list_find_row_from_data(fdata));
  }
  mark_frames_ready();
}

void packet_list_update_marked_frames(void) {
  frame_data *fdata;

  if (cfile.plist == NULL) return;

  /* XXX: we might need a progressbar here */
  for (fdata = cfile.plist; fdata != NULL; fdata = fdata->next) {
    if (fdata->flags.marked)
      set_frame_mark(TRUE,
		     fdata,
		     packet_list_find_row_from_data(fdata));
  }
  mark_frames_ready();
}

void packet_list_mark_all_frames_cb(GtkWidget *w _U_, gpointer data _U_) {
  mark_all_frames(TRUE);
}

void packet_list_unmark_all_frames_cb(GtkWidget *w _U_, gpointer data _U_) {
  mark_all_frames(FALSE);
}

gboolean
packet_list_get_event_row_column(GtkWidget *w, GdkEventButton *event_button,
				 gint *row, gint *column)
{
	gboolean ret;
	GtkTreePath *path;
	GtkTreeViewColumn *tree_column;
	GtkTreeIter iter;
	GtkTreeViewColumn* tree_col_i;


	ret = gtk_tree_view_get_path_at_pos(GTK_TREE_VIEW(packet_list),
                                             (gint) event_button->x,
                                             (gint) event_button->y,
                                             &path,
                                             &tree_column,
                                             NULL /* *cell_x */,
                                             NULL /* *cell_y */);
	g_assert(ret);

	/* convert path to row */
	ret = gtk_tree_model_get_iter(GTK_TREE_MODEL(gtk_tree_view_get_model(GTK_TREE_VIEW(packet_list))),
                                             &iter,
                                             path);
	g_assert(ret);

	*row = iter_to_row(&iter);

	/* get the number of the column */
	/* XXX - improve this */
	*column = 0;
	while((tree_col_i = gtk_tree_view_get_column (GTK_TREE_VIEW(packet_list), *column)) != NULL) {

		if(tree_col_i == tree_column) {
			return TRUE;
		}

		(*column)++ ;
	}

	return FALSE;
}

static gint
packet_list_button_pressed_cb(GtkWidget *w, GdkEvent *event, gpointer data _U_)
{
    GdkEventButton *event_button = (GdkEventButton *)event;
    gint row, column;

    if (w == NULL || event == NULL)
        return FALSE;

    if (event->type == GDK_BUTTON_PRESS && event_button->button == 2 &&
        /*event_button->window == GTK_TREE_VIEW(w)->clist_window && */
        /*eth_clist_get_selection_info(ETH_CLIST(w), (gint) event_button->x,
                                     (gint) event_button->y, &row, &column) */
		packet_list_get_event_row_column(w, event_button, &row, &column)) {
        frame_data *fdata = (frame_data *)packet_list_get_row_data(row);
        set_frame_mark(!fdata->flags.marked, fdata, row);
        mark_frames_ready();
        return TRUE;
    }
    return FALSE;
}

/* Set the selection mode of the packet list window. */
void
packet_list_set_sel_browse(gboolean val)
{
	GtkTreeSelection *select;
	GtkSelectionMode new_mode;

	/* initialize with a mode we don't use, so that the mode == new_mode
	* test will fail the first time */
	static GtkSelectionMode mode = GTK_SELECTION_MULTIPLE;

	/* Yeah, GTK uses "browse" in the case where we do not, but oh well. I
	* think "browse" in Ethereal makes more sense than "SINGLE" in GTK+ */
	new_mode = val ? GTK_SELECTION_SINGLE : GTK_SELECTION_BROWSE;

	if (mode == new_mode) {
		/*
		* The mode isn't changing, so don't do anything.
		* In particular, don't gratuitiously unselect the
		* current packet.
		*
		* XXX - why do we have to unselect the current packet
		* ourselves?  The documentation for the GtkCList at
		*
		*	http://developer.gnome.org/doc/API/gtk/gtkclist.html
		*
		* says "Note that setting the widget's selection mode to
		* one of GTK_SELECTION_BROWSE or GTK_SELECTION_SINGLE will
		* cause all the items in the GtkCList to become deselected."
		*/
		return;
	}

	if (cfile.finfo_selected)
		cf_unselect_packet(&cfile);

	mode = new_mode;

	select = gtk_tree_view_get_selection (GTK_TREE_VIEW (packet_list));
	gtk_tree_selection_set_mode (select, mode);
}

/* Set the font of the packet list window. */
void
packet_list_set_font(FONT_TYPE *font)
{
	int i;
	gint col_width;
    PangoLayout *layout;
	GtkTreeViewColumn *tree_column;


    gtk_widget_modify_font(packet_list, font);

	/* Compute default column sizes. */
	for (i = 0; i < cfile.cinfo.num_cols; i++) {
                layout = gtk_widget_create_pango_layout(packet_list,
		    get_column_longest_string(get_column_format(i)));
                pango_layout_get_pixel_size(layout, &col_width, NULL);
                g_object_unref(G_OBJECT(layout));
		tree_column = gtk_tree_view_get_column (GTK_TREE_VIEW(packet_list), i);
		gtk_tree_view_column_set_min_width(tree_column, col_width);
	}
}

GtkWidget *
packet_list_new(e_prefs *prefs)
{
    GtkWidget *pkt_scrollw;
	GtkListStore *store;
	GType *types;
    int            i;
	GtkTreeSelection *select;

    /* Packet list */
    pkt_scrollw = scrolled_window_new(NULL, NULL);
    /* The usual policy for scrolled windows is to set both scrollbars to automatic,
     * meaning they'll only appear if the content doesn't fit into the window.
     *
     * As this doesn't seem to work in some cases for the vertical scrollbar
     * (see http://bugs.ethereal.com/bugzilla/show_bug.cgi?id=220),
     * we show that scrollbar always. */
    gtk_scrolled_window_set_policy(GTK_SCROLLED_WINDOW(pkt_scrollw),
                                   GTK_POLICY_AUTOMATIC, GTK_POLICY_ALWAYS);
    /* the list will have it's own GTK_SHADOW_IN, so don't use a shadow 
     * for both widgets */
    gtk_scrolled_window_set_shadow_type(GTK_SCROLLED_WINDOW(pkt_scrollw), 
                                    GTK_SHADOW_NONE);

	/* XXX - when finished, we don't need all these columns :-)
	 * we'll simply use a single column and doing display dynamically */
	types = g_malloc(sizeof(GType) * (cfile.cinfo.num_cols + 1));
    for (i = 0; i < cfile.cinfo.num_cols; i++) {
		types[i] = G_TYPE_STRING;
	}
	types[cfile.cinfo.num_cols] = G_TYPE_POINTER;

	store = gtk_list_store_newv(cfile.cinfo.num_cols + 1, types);
	packet_list = tree_view_new(GTK_TREE_MODEL(store));
	g_object_unref(G_OBJECT(store));
	gtk_tree_view_set_headers_visible(GTK_TREE_VIEW(packet_list), TRUE);
	gtk_tree_view_set_headers_clickable(GTK_TREE_VIEW(packet_list), TRUE);
	g_object_set (packet_list, "vertical-separator", 0, NULL);

    /* Column titles are filled in below */
    gtk_container_add(GTK_CONTAINER(pkt_scrollw), packet_list);

    packet_list_set_sel_browse(prefs->gui_plist_sel_browse);
    packet_list_set_font(user_font_get_regular());
    gtk_widget_set_name(packet_list, "packet list");


    for (i = 0; i < cfile.cinfo.num_cols; i++) {
#if 0
        /* Right-justify some special columns. */
        if (cfile.cinfo.col_fmt[i] == COL_NUMBER ||
            cfile.cinfo.col_fmt[i] == COL_PACKET_LENGTH ||
            cfile.cinfo.col_fmt[i] == COL_CUMULATIVE_BYTES ||
            cfile.cinfo.col_fmt[i] == COL_DCE_CALL)
            eth_clist_set_column_justification(ETH_CLIST(packet_list), i,
                                               GTK_JUSTIFY_RIGHT);
#endif
		GtkCellRenderer *renderer;
		GtkTreeViewColumn *column;
		//gint col_offset;

		//renderer = eth_cell_renderer_text_new();
		renderer = gtk_cell_renderer_text_new();
		g_object_set (renderer, "ypad", 0, NULL);
		//g_object_set (renderer, "height", 5, NULL);
		//gtk_cell_renderer_text_set_fixed_height_from_font(GTK_CELL_RENDERER_TEXT(renderer), 8);
		//gtk_cell_renderer_set_fixed_size(renderer, -1, 5);

		/* Create a column, associating the "text" attribute of the
		* cell_renderer to the first column of the model */
		column = gtk_tree_view_column_new_with_attributes (cfile.cinfo.col_title[i], renderer,
														  "text", i,
														  NULL);

		/* Add the column to the view. */
		gtk_tree_view_append_column (GTK_TREE_VIEW(packet_list), column);
		gtk_tree_view_column_set_sort_column_id(column, i);

		gtk_tree_sortable_set_sort_func (GTK_TREE_SORTABLE(store),
                                             i,
                                             packet_list_compare,
                                             GINT_TO_POINTER(i),
                                             NULL);
		if(i == 0) {
			gtk_tree_view_column_set_sort_indicator(column, TRUE);
		}

#if 0
		col_offset = gtk_tree_view_insert_column_with_attributes(GTK_TREE_VIEW(packet_list),
															   -1, cfile.cinfo.col_title[i], renderer,
															   NULL);
		column = gtk_tree_view_get_column(GTK_TREE_VIEW(packet_list),
										col_offset - 1);
		gtk_tree_view_column_set_cell_data_func(column,
												 renderer,
												 NULL /*tree_cell_renderer*/,
												 NULL,
												 NULL);
#endif

        /* For performance reasons, columns do not automatically resize, 
           but are resizeable by the user. */
		/* XXX */
		gtk_tree_view_column_set_resizable(column, TRUE);
		gtk_tree_view_column_set_sizing(GTK_TREE_VIEW_COLUMN(column),
									  GTK_TREE_VIEW_COLUMN_FIXED /*GTK_TREE_VIEW_COLUMN_AUTOSIZE*/);
    }
	//SIGNAL_CONNECT(tree_view, "key-press-event", tree_view_key_pressed_cb, NULL );
    SIGNAL_CONNECT(packet_list, "button_press_event", popup_menu_handler,
                   OBJECT_GET_DATA(popup_menu_object, PM_PACKET_LIST_KEY));
    SIGNAL_CONNECT(packet_list, "button_press_event",
                   packet_list_button_pressed_cb, NULL);

	/* Fixed height mode speeds up GtkTreeView by assuming that all rows have 
	 * the same height. Only enable this option if all rows are the same 
	 * height and all columns are of type GTK_TREE_VIEW_COLUMN_FIXED. */
#if (GTK_MAJOR_VERSION == 2 && GTK_MINOR_VERSION >= 6) || GTK_MAJOR_VERSION >= 3
	gtk_tree_view_set_fixed_height_mode(GTK_TREE_VIEW (packet_list), TRUE);
#endif

	select = gtk_tree_view_get_selection (GTK_TREE_VIEW (packet_list));
	gtk_tree_selection_set_mode (select, GTK_SELECTION_BROWSE);
	g_signal_connect (G_OBJECT (select), "changed",
					  G_CALLBACK (tree_selection_changed_cb),
					  NULL);

    gtk_widget_show_all(packet_list);

    return pkt_scrollw;
}

void
packet_list_set_column_titles(void)
{
#if 0
    GtkStyle      *win_style;
    GdkPixmap     *ascend_pm, *descend_pm;
    GdkBitmap     *ascend_bm, *descend_bm;
    column_arrows *col_arrows;
    int            i;
    GtkWidget     *column_lb;

    win_style = gtk_widget_get_style(top_level);
    ascend_pm = gdk_pixmap_create_from_xpm_d(top_level->window, &ascend_bm,
                                             &win_style->bg[GTK_STATE_NORMAL],
                                             (gchar **) clist_ascend_xpm);
    descend_pm = gdk_pixmap_create_from_xpm_d(top_level->window, &descend_bm,
                                              &win_style->bg[GTK_STATE_NORMAL],
                                              (gchar **) clist_descend_xpm);

    col_arrows = (column_arrows *) g_malloc(sizeof(column_arrows) *
                                            cfile.cinfo.num_cols);
    for (i = 0; i < cfile.cinfo.num_cols; i++) {
        col_arrows[i].table = gtk_table_new(2, 2, FALSE);
        gtk_table_set_col_spacings(GTK_TABLE(col_arrows[i].table), 5);
        column_lb = gtk_label_new(cfile.cinfo.col_title[i]);
        gtk_table_attach(GTK_TABLE(col_arrows[i].table), column_lb, 0, 1, 0, 2,
                         GTK_SHRINK, GTK_SHRINK, 0, 0);
        gtk_widget_show(column_lb);
        col_arrows[i].ascend_pm = gtk_pixmap_new(ascend_pm, ascend_bm);
        gtk_table_attach(GTK_TABLE(col_arrows[i].table),
                         col_arrows[i].ascend_pm,
                         1, 2, 1, 2, GTK_SHRINK, GTK_SHRINK, 0, 0);
        if (i == 0) {
            gtk_widget_show(col_arrows[i].ascend_pm);
        }
        col_arrows[i].descend_pm = gtk_pixmap_new(descend_pm, descend_bm);
        gtk_table_attach(GTK_TABLE(col_arrows[i].table),
                         col_arrows[i].descend_pm,
                         1, 2, 0, 1, GTK_SHRINK, GTK_SHRINK, 0, 0);
        eth_clist_set_column_widget(ETH_CLIST(packet_list), i,
                                    col_arrows[i].table);
        gtk_widget_show(col_arrows[i].table);
    }
    eth_clist_column_titles_show(ETH_CLIST(packet_list));
    SIGNAL_CONNECT(packet_list, "click-column", packet_list_click_column_cb,
                   col_arrows);
#endif
}

void
packet_list_clear(void)
{
	GtkListStore *store;


    packet_history_clear();

	store = GTK_LIST_STORE(gtk_tree_view_get_model(GTK_TREE_VIEW(packet_list)));
	gtk_list_store_clear(store);

	rows = 0;
}

void
packet_list_freeze(void)
{
	//g_warning("freeze");

	/* GTKTreeView doesn't need freeze/thaw */
}

static void
packet_list_resize_columns(void) {
    int         i;
    //int         progbar_nextstep;
    //int         progbar_quantum;
    //gboolean    stop_flag;
    //GTimeVal    start_time;
    //float       prog_val;
    //progdlg_t  *progbar = NULL;
    //gchar       status_str[100];
	GtkTreeViewColumn* column;


	//g_warning("resize_columns");

#if 0
    progbar_nextstep = 0;
    /* When we reach the value that triggers a progress bar update,
       bump that value by this amount. */
    progbar_quantum = cfile.cinfo.num_cols/N_PROGBAR_UPDATES;

    stop_flag = FALSE;
    g_get_current_time(&start_time);


    main_window_update();

    for (i = 0; i < cfile.cinfo.num_cols; i++) {
      if (i >= progbar_nextstep) {
        /* let's not divide by zero. I should never be started
         * with count == 0, so let's assert that
         */
        g_assert(cfile.cinfo.num_cols > 0);

        prog_val = (gfloat) i / cfile.cinfo.num_cols;

        /* Create the progress bar if necessary */
        if (progbar == NULL)
           progbar = delayed_create_progress_dlg("Resizing", "Resize Columns", 
             &stop_flag, &start_time, prog_val);

        if (progbar != NULL) {
          g_snprintf(status_str, sizeof(status_str),
                     "%u of %u columns (%s)", i+1, cfile.cinfo.num_cols, cfile.cinfo.col_title[i]);
          update_progress_dlg(progbar, prog_val, status_str);
        }

        progbar_nextstep += progbar_quantum;
      }

      if (stop_flag) {
        /* Well, the user decided to abort the resizing... */
        break;
      }

        /* auto resize the current column */
        column = gtk_tree_view_get_column (GTK_TREE_VIEW(packet_list), i);
		gtk_tree_view_column_set_sizing(column, GTK_TREE_VIEW_COLUMN_AUTOSIZE);

        /* the current column should be resizeable by the user again */
        /* (will turn off auto resize again) */
		//gtk_tree_view_column_set_sizing(column, GTK_TREE_VIEW_COLUMN_FIXED);
    }

    /* We're done resizing the columns; destroy the progress bar if it
       was created. */
    if (progbar != NULL)
      destroy_progress_dlg(progbar);
#endif

    main_window_update();

    for (i = 0; i < cfile.cinfo.num_cols; i++) {
        /* auto resize the current column */
        column = gtk_tree_view_get_column (GTK_TREE_VIEW(packet_list), i);
		gtk_tree_view_column_set_sizing(column, GTK_TREE_VIEW_COLUMN_AUTOSIZE);
	}

	gtk_tree_view_columns_autosize  (GTK_TREE_VIEW(packet_list));

    for (i = 0; i < cfile.cinfo.num_cols; i++) {
        /* the current column should be resizeable by the user again */
        /* (will turn off auto resize again) */
		gtk_tree_view_column_set_sizing(column, GTK_TREE_VIEW_COLUMN_FIXED);
    }

    main_window_update();
}

void packet_list_resize_columns_cb(GtkWidget *widget _U_, gpointer data _U_)
{
    packet_list_resize_columns();
}

void
packet_list_thaw(void)
{
	//g_warning("thaw");

	/* GTKTreeView doesn't need freeze/thaw */
    packets_bar_update();
}

void
packet_list_select_row(gint row)
{
	//g_warning("select_row");
	packet_list_set_selected_row(row);
}

void
packet_list_moveto_end(void)
{
	//g_warning("moveto_end");

	packet_list_set_selected_row(rows);
}

gint
packet_list_append(const gchar *text[], gpointer data)
{
	GtkListStore *store;
	GtkTreeIter iter;
	int i;

	//g_warning("append");

    store = GTK_LIST_STORE(gtk_tree_view_get_model(GTK_TREE_VIEW(packet_list)));
	gtk_list_store_append(store, &iter);

    for (i = 0; i < cfile.cinfo.num_cols; i++) {
		gtk_list_store_set(store, &iter, i, (GValue *) text[i], -1);
	}
	gtk_list_store_set(store, &iter, cfile.cinfo.num_cols, (GValue *) data, -1);

	return ++rows;
}

void
packet_list_set_colors(gint row, color_t *fg, color_t *bg)
{
#if 0
    GdkColor gdkfg, gdkbg;

    if (fg)
    {
        color_t_to_gdkcolor(&gdkfg, fg);
        eth_clist_set_foreground(ETH_CLIST(packet_list), row, &gdkfg);
    }
    if (bg)
    {
        color_t_to_gdkcolor(&gdkbg, bg);
        eth_clist_set_background(ETH_CLIST(packet_list), row, &gdkbg);
    }
#endif
}

gint
packet_list_find_row_from_data(gpointer data)
{
	//g_warning("find_row_from_data");


#if 0
    return eth_clist_find_row_from_data(ETH_CLIST(packet_list), data);
#endif
	return 0;
}

void
packet_list_set_text(gint row, gint column, const gchar *text)
{
	GtkListStore *store;
	GtkTreeIter iter;

	//g_warning("set_text");

	store = GTK_LIST_STORE(gtk_tree_view_get_model(GTK_TREE_VIEW(packet_list)));
	row_to_iter(row, &iter);

	gtk_list_store_set(store, &iter, column, (GValue *) text, -1);
}

/* Set the column widths of those columns that show the time in
 * "command-line-specified" format. */
void
packet_list_set_cls_time_width(gint column)
{
    gint      width;
    PangoLayout  *layout;
	GtkTreeViewColumn *tree_column;

    layout = gtk_widget_create_pango_layout(packet_list,
                 get_column_longest_string(COL_CLS_TIME));
    pango_layout_get_pixel_size(layout, &width, NULL);
    g_object_unref(G_OBJECT(layout));
	tree_column = gtk_tree_view_get_column (GTK_TREE_VIEW(packet_list), column);
	gtk_tree_view_column_set_min_width(tree_column, width);
}

gpointer
packet_list_get_row_data(gint row)
{
	GtkTreeIter iter;
	gpointer data;

	//g_warning("get_row_data");


	row_to_iter(row, &iter);
	gtk_tree_model_get(gtk_tree_view_get_model(GTK_TREE_VIEW(packet_list)),
                                             &iter,
                                             cfile.cinfo.num_cols, &data, -1);
	return data;
}


/* get the first fully visible row number, given row MUST be visible */
static gint
packet_list_first_full_visible_row(gint row) {
#if 0 
	g_assert(eth_clist_row_is_visible(ETH_CLIST(packet_list), row) ==
        GTK_VISIBILITY_FULL);

	while(eth_clist_row_is_visible(ETH_CLIST(packet_list), row) ==
        GTK_VISIBILITY_FULL) {
		row--;
	}

#endif
	return ++row;
}

/* get the last fully visible row number, given row MUST be visible */
static gint
packet_list_last_full_visible_row(gint row) {
#if 0
	g_assert(eth_clist_row_is_visible(ETH_CLIST(packet_list), row) ==
        GTK_VISIBILITY_FULL);

	while(eth_clist_row_is_visible(ETH_CLIST(packet_list), row) ==
        GTK_VISIBILITY_FULL) {
		row++;
	}
#endif
	return --row;
}

/* Set the selected row and the focus row of the packet list to the specified
 * row, and make it visible if it's not currently visible. */
void
packet_list_set_selected_row(gint row)
{
    GtkTreeSelection *sel;
    GtkTreeIter       iter;

	row_to_iter(row, &iter);

    sel = gtk_tree_view_get_selection(GTK_TREE_VIEW(packet_list));

	gtk_tree_selection_select_iter  (sel, &iter);
#if 0
	gint visible_rows;
	gint first_row;
	gboolean full_visible;


	full_visible = eth_clist_row_is_visible(ETH_CLIST(packet_list), row) ==
        GTK_VISIBILITY_FULL;

    /* XXX - why is there no "eth_clist_set_focus_row()", so that we
     * can make the row for the frame we found the focus row?
     *
     * See http://www.gnome.org/mailing-lists/archives/gtk-list/2000-January/0038.shtml
     */
    ETH_CLIST(packet_list)->focus_row = row;

    eth_clist_select_row(ETH_CLIST(packet_list), row, -1);

    if (!full_visible) {

        eth_clist_freeze(ETH_CLIST(packet_list));

        eth_clist_moveto(ETH_CLIST(packet_list), row, -1, 0.0, 0.0);

		/* even after move still invisible (happens with empty list) -> give up */
		if(eth_clist_row_is_visible(ETH_CLIST(packet_list), row) !=
			GTK_VISIBILITY_FULL) {
			return;
		}

		/* The now selected row will be the first visible row in the list.
		 * This is inconvenient, as the user is usually interested in some 
		 * packets *before* the currently selected one too.
		 *
		 * Try to adjust the visible rows, so the currently selected row will 
		 * be shown around the first third of the list screen.
		 * 
		 * (This won't even do any harm if the current row is the first or the 
		 * last in the list) */
		visible_rows = packet_list_last_full_visible_row(row) - packet_list_first_full_visible_row(row);
		first_row = row - visible_rows / 3;

		eth_clist_moveto(ETH_CLIST(packet_list), first_row >= 0 ? first_row : 0, -1, 0.0, 0.0);

		eth_clist_thaw(ETH_CLIST(packet_list));
	}
#endif
}

/* Return the column number that the clist is currently sorted by */
gint
packet_list_get_sort_column(void)
{
#if 0
    return ETH_CLIST(packet_list)->sort_column;
#endif
	return 0;
}
