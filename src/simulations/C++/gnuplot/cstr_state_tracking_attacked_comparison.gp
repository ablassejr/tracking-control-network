if (!exists("csv_attacked")) csv_attacked = "cstr_state_tracking_attacked_cpp_output.csv"
if (!exists("outdir")) outdir = "`echo $IMAGES_DIR`"

set datafile separator ","
set grid

set lmargin at screen 0.14
set rmargin at screen 0.96
set tmargin at screen 0.96
set bmargin at screen 0.18

set xlabel "k"
set xrange [0:45000]
set xtics 0,10000,40000

set terminal pngcairo size 2384,1544 enhanced font "Arial,64"
set output outdir."/cxxplot_attacked_time_vs_x1_r1_comparison.png"
set ylabel "x_1, r_1"
set yrange [0:0.8]
set ytics 0,0.2,0.8
set key top right
plot csv_attacked using ($1/0.001):2 with lines lw 2 lc rgb "#0072BD" title "x_1", \
     csv_attacked using ($1/0.001):4 with lines lw 2 lc rgb "#EDB120" title "r_1"

set terminal pngcairo size 2307,1544 enhanced font "Arial,64"
set output outdir."/cxxplot_attacked_time_vs_x2_r2_comparison.png"
set ylabel "x_2, r_2"
set yrange [0:6]
set ytics 0,1,6
set key top right
plot csv_attacked using ($1/0.001):3 with lines lw 2 lc rgb "#0072BD" title "x_2", \
     csv_attacked using ($1/0.001):5 with lines lw 2 lc rgb "#EDB120" title "r_2"
