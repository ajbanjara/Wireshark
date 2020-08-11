# Wireshark source movie

The rich history of the Wireshark source code is a story recorded in its repository. What better way to tell this story than in a movie? This page contains the information you need to generate this movie yourself.

The movie creator used is [Gource](http://gource.io/), which reads the log and generates the movie elements. To get an appealing movie a lot of parameters need to be tweaked and data provided. These are all attached to this page.

Here is a sample of what you can get: ![wireshark\_source\_movie.png](uploads/__moin_import__/attachments/Development/SourceMovie/wireshark_source_movie.png "wireshark_source_movie.png")

## Setup

To generate the movie go into the Wireshark Git workarea and make sure these files are added to it:

  - [wireshark\_source\_movie.caption](uploads/__moin_import__/attachments/Development/SourceMovie/wireshark_source_movie.caption)

  - [wireshark\_source\_logo.png](uploads/__moin_import__/attachments/Development/SourceMovie/wireshark_source_logo.png)

Then use the following command line to get the show started:

    gource --fullscreen --viewport 1280x720 --background-colour 2583AE \
     --seconds-per-day 0.01 --file-idle-time 0 --hide mouse,filenames,progress \
     --highlight-user "Gerald Combs" --highlight-user "Guy Harris" --max-user-speed 100 \
     --caption-file wireshark_source_movie.caption --caption-duration 2 --caption-offset 250 \
     --bloom-intensity 0.5 --logo wireshark_source_movie_logo.png --date-format "%F" --stop-at-end

Note that these parameters are applicable for gource v0.44, you may have to modify them when using a different version. Also if you want to modify the performance go ahead a tweak these, you're the director.

---

Imported from https://wiki.wireshark.org/Development/SourceMovie on 2020-08-11 23:13:07 UTC
