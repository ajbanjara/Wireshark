/* ethcellrenderertext.h
 * Copyright (C) 2000  Red Hat, Inc.,  Jonathan Blandford <jrb@redhat.com>
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Library General Public
 * License as published by the Free Software Foundation; either
 * version 2 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Library General Public License for more details.
 *
 * You should have received a copy of the GNU Library General Public
 * License along with this library; if not, write to the
 * Free Software Foundation, Inc., 59 Temple Place - Suite 330,
 * Boston, MA 02111-1307, USA.
 */

#ifndef __ETH_CELL_RENDERER_TEXT_H__
#define __ETH_CELL_RENDERER_TEXT_H__

#include <pango/pango.h>
#include <gtk/gtkcellrenderer.h>

#ifdef __cplusplus
extern "C" {
#endif /* __cplusplus */


#define ETH_TYPE_CELL_RENDERER_TEXT		(eth_cell_renderer_text_get_type ())
#define ETH_CELL_RENDERER_TEXT(obj)		(G_TYPE_CHECK_INSTANCE_CAST ((obj), ETH_TYPE_CELL_RENDERER_TEXT, EthCellRendererText))
#define ETH_CELL_RENDERER_TEXT_CLASS(klass)	(G_TYPE_CHECK_CLASS_CAST ((klass), ETH_TYPE_CELL_RENDERER_TEXT, GtkCellRendererTextClass))
#define ETH_IS_CELL_RENDERER_TEXT(obj)		(G_TYPE_CHECK_INSTANCE_TYPE ((obj), ETH_TYPE_CELL_RENDERER_TEXT))
#define ETH_IS_CELL_RENDERER_TEXT_CLASS(klass)	(G_TYPE_CHECK_CLASS_TYPE ((klass), ETH_TYPE_CELL_RENDERER_TEXT))
#define ETH_CELL_RENDERER_TEXT_GET_CLASS(obj)   (G_TYPE_INSTANCE_GET_CLASS ((obj), ETH_TYPE_CELL_RENDERER_TEXT, GtkCellRendererTextClass))

typedef struct _EthCellRendererText      EthCellRendererText;
typedef struct _EthCellRendererTextClass EthCellRendererTextClass;

struct _EthCellRendererText
{
  GtkCellRenderer parent;

  /*< private >*/
  gchar *text;
  PangoFontDescription *font;
  gdouble font_scale;
  PangoColor foreground;
  PangoColor background;
  
  PangoAttrList *extra_attrs;

  PangoUnderline underline_style;

  gint rise;
  gint fixed_height_rows;

  guint strikethrough : 1;

  guint editable  : 1;

  guint scale_set : 1;
  
  guint foreground_set : 1;
  guint background_set : 1;
  
  guint underline_set : 1;

  guint rise_set : 1;
  
  guint strikethrough_set : 1;

  guint editable_set : 1;
  guint calc_fixed_height : 1;
};

struct _EthCellRendererTextClass
{
  GtkCellRendererClass parent_class;

  void (* edited) (EthCellRendererText *cell_renderer_text,
		   const gchar         *path,
		   const gchar         *new_text);

  /* Padding for future expansion */
  void (*_gtk_reserved1) (void);
  void (*_gtk_reserved2) (void);
  void (*_gtk_reserved3) (void);
  void (*_gtk_reserved4) (void);
};

GType            eth_cell_renderer_text_get_type (void);
GtkCellRenderer *eth_cell_renderer_text_new      (void);

void             eth_cell_renderer_text_set_fixed_height_from_font (EthCellRendererText *renderer,
								    gint                 number_of_rows);


#ifdef __cplusplus
}
#endif /* __cplusplus */


#endif /* __ETH_CELL_RENDERER_TEXT_H__ */
