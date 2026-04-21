# Figure 2: Composite perturbed vs recovered CSTR (2-panel multiplot)
# Panel 1 (top): x2 attacked + x2 defended + r2, full x-range, with legend
# Panel 2 (bottom): tracking error e_2 attacked + defended, full x-range, with legend

if (!exists("csv_state_atk")) csv_state_atk = "cstr_state_tracking_attacked_cpp_output.csv"
if (!exists("csv_state_def")) csv_state_def = "cstr_state_tracking_defended_cpp_output.csv"
if (!exists("outdir"))        outdir        = "`echo $IMAGES_DIR`"

set datafile separator ","
set terminal pngcairo size 2384,1700 enhanced font "Arial,48"
set output outdir."/cxxplot_composite_combined.png"

set multiplot layout 2,1

set grid
set lmargin at screen 0.12
set rmargin at screen 0.97

# Panel 1: state tracking, both conditions overlaid
set tmargin at screen 0.96
set bmargin at screen 0.58
set xlabel "k"
set xrange [0:45000]
set xtics 0,10000,40000
set ylabel "x_2, r_2"
set yrange [0:5]
set ytics 0,1,5
set key top right opaque box spacing 1.5 samplen 5
plot csv_state_atk using ($1/0.001):3 with lines lw 3 lc rgb "#0072BD" title "Perturbed", \
     csv_state_def using ($1/0.001):3 with lines lw 3 lc rgb "#D95319" title "Recovered", \
     csv_state_atk using ($1/0.001):5 with lines lw 3 dt 2 lc rgb "#000000" title "r_2"

# Panel 2: tracking error e_2, both conditions overlaid, full x-range
set tmargin at screen 0.44
set bmargin at screen 0.12
set xlabel "k"
set xrange [0:45000]
set xtics 0,10000,40000
set ylabel "e_2"
set yrange [-3:2.5]
set ytics -3,1,2
set key top right opaque box spacing 1.5 samplen 5
plot csv_state_atk using ($1/0.001):7 with lines lw 3 lc rgb "#0072BD" title "Perturbed", \
     csv_state_def using ($1/0.001):7 with lines lw 3 lc rgb "#D95319" title "Recovered"

unset multiplot
