# Figure 2: Composite perturbed vs recovered CSTR (2-panel multiplot)
# Tilde (~) marks perturbed quantities, hat (^) marks defended quantities.
# Panel (a) (top):    x_tilde_2 + r_2 reference, full x-range
# Panel (b) (bottom): tracking error e_tilde_2 (attacked) and e_hat_2 (defended), y in [-2,2]
# Per-panel legends placed in white space inside each panel, oriented vertically.

if (!exists("csv_state_atk")) csv_state_atk = "cstr_state_tracking_attacked_cpp_output.csv"
if (!exists("csv_state_def")) csv_state_def = "cstr_state_tracking_defended_cpp_output.csv"
if (!exists("outdir"))        outdir        = "`echo $IMAGES_DIR`"

set datafile separator ","
set terminal pngcairo size 2384,1700 enhanced font "Arial,48"
set output outdir."/cxxplot_composite_combined.png"

set encoding utf8

set multiplot layout 2,1

set grid
set lmargin at screen 0.12
set rmargin at screen 0.97

# Panel (a): perturbed state x_tilde_2 vs reference r_2
set tmargin at screen 0.96
set bmargin at screen 0.55
unset xlabel
set format x ""
set xrange [0:45000]
set xtics 0,10000,40000
set ylabel "x̃_2, r_2"
set yrange [0:5]
set ytics 0,1,5
set key at graph 0.97,0.50 right top vertical opaque box spacing 1.4 samplen 4
set label 1 "(a)" at graph 0.025,0.92 left front font "Arial,52"
plot csv_state_atk using ($1/0.001):3 with lines lw 3 lc rgb "#0072BD" title "x̃_2", \
     csv_state_atk using ($1/0.001):5 with lines lw 3 dt 2 lc rgb "#000000" title "r_2"

unset label 1

# Panel (b): tracking error e_tilde_2 (attacked) vs e_hat_2 (defended), y in [-2,2]
set tmargin at screen 0.50
set bmargin at screen 0.14
set xlabel "k"
set format x "%g"
set xrange [0:45000]
set xtics 0,10000,40000
set ylabel "ẽ_2, ê_2"
set yrange [-2:2]
set ytics -2,1,2
set key at graph 0.97,0.97 right top vertical opaque box spacing 1.4 samplen 4
set label 2 "(b)" at graph 0.025,0.92 left front font "Arial,52"
plot csv_state_atk using ($1/0.001):7 with lines lw 3 lc rgb "#0072BD" title "ẽ_2", \
     csv_state_def using ($1/0.001):7 with lines lw 3 lc rgb "#D95319" title "ê_2"

unset label 2

unset multiplot
