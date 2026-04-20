# Figure 1: Clean CSTR simulation (2-panel multiplot)
# Panel 1 (top): state x1 + reference r1, full x-range
# Panel 2 (bottom): control u, zoomed to startup transient

if (!exists("csv_state")) csv_state = "cstr_state_tracking_cpp_output.csv"
if (!exists("csv_ctrl"))  csv_ctrl  = "cstr_control_input_cpp_output.csv"
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
set ylabel "x_1, r_1"
set yrange [0:0.8]
set ytics 0,0.2,0.8
unset key
plot csv_state using ($1/0.001):2 with lines lw 3 lc rgb "#0072BD" notitle, \
     csv_state using ($1/0.001):4 with lines lw 3 dt 2 lc rgb "#000000" notitle

# Panel 2: control input, zoomed
set tmargin at screen 0.44
set bmargin at screen 0.12
set xlabel "k"
set xrange [0:100]
set xtics 0,20,100
set ylabel "u"
set yrange [-350:400]
set ytics -300,100,400
unset key
plot csv_ctrl using ($1/0.001):2 with lines lw 3 lc rgb "#0072BD" notitle

unset multiplot
