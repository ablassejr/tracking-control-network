# Figure 1: Clean CSTR simulation (2-panel multiplot)
# Panel 1 (top): state x_2 + reference r_2, full x-range
# Panel 2 (bottom): tracking error e_2 = x_2 - r_2, full x-range

if (!exists("csv_state")) csv_state = "cstr_state_tracking_cpp_output.csv"
if (!exists("outdir"))    outdir    = "`echo $IMAGES_DIR`"

set datafile separator ","
set terminal pngcairo size 2384,1700 enhanced font "Arial,48"
set output outdir."/cxxplot_clean_combined.png"

set multiplot layout 2,1

set grid
set lmargin at screen 0.12
set rmargin at screen 0.97
# Panel 1: state tracking
set tmargin at screen 0.96
set bmargin at screen 0.58
set xlabel "k"
set xrange [0:45000]
set xtics 0,10000,40000
set ylabel "x_2, r_2"
set yrange [0:5]
set ytics 0,1,5
set key top right opaque box spacing 1.5 samplen 5
plot csv_state using ($1/0.001):3 with lines lw 3 lc rgb "#0072BD" title "x_2", \
     csv_state using ($1/0.001):5 with lines lw 3 dt 2 lc rgb "#000000" title "r_2"

# Panel 2: tracking error e_2, full x-range
set tmargin at screen 0.44
set bmargin at screen 0.12
set xlabel "k"
set xrange [0:45000]
set xtics 0,10000,40000
set ylabel "e_2"
set yrange [-3:2.5]
set ytics -3,1,2
unset key
plot csv_state using ($1/0.001):7 with lines lw 3 lc rgb "#0072BD" notitle

unset multiplot
