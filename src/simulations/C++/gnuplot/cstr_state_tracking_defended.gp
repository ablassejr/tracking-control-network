if (!exists("csv_defended")) csv_defended = "cstr_state_tracking_defended_cpp_output.csv"
if (!exists("csv_attacked")) csv_attacked = "cstr_state_tracking_attacked_cpp_output.csv"
if (!exists("outdir")) outdir = "`echo $IMAGES_DIR`"

set datafile separator ","
set terminal pngcairo size 1400,1050 enhanced font "Arial,24"
set grid

set xlabel "k"
set xrange [0:45000]
set xtics 0,5000,45000

set output outdir."/cxxplot_defended_time_vs_x1_r1.png"
set title "State x_1"
set ylabel "x_1, r_1"
set yrange [0:0.8]
set ytics 0,0.1,0.8
set key top right
plot csv_defended using ($1/0.001):2 with lines lw 2 lc rgb "#0072BD" title "x_1", \
     csv_defended using ($1/0.001):4 with lines lw 2 lc rgb "#EDB120" title "r_1"

set output outdir."/cxxplot_defended_time_vs_x2_r2.png"
set title "State x_2"
set ylabel "x_2, r_2"
set yrange [0:6]
set ytics 0,1,6
set key top right
plot csv_defended using ($1/0.001):3 with lines lw 2 lc rgb "#0072BD" title "x_2", \
     csv_defended using ($1/0.001):5 with lines lw 2 lc rgb "#EDB120" title "r_2"
