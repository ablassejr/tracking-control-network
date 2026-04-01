if (!exists("csv")) csv = "cstr_state_tracking_cpp_output.csv"
if (!exists("outdir")) outdir = "."

set datafile separator ","
set grid

set lmargin at screen 0.14
set rmargin at screen 0.96
set tmargin at screen 0.96
set bmargin at screen 0.18

set xlabel "k (time steps)                          {/Symbol \264}10^{4}"
set xrange [0:4.5]
set xtics 0,1,4

set terminal pngcairo size 2384,1544 enhanced font "Arial,64"
set output outdir."/cxxplot_time_vs_x1_r1_comparison.png"
set ylabel "x_1, r_1"
set yrange [0:0.8]
set ytics 0,0.2,0.8
set key top right
plot csv using ($1/0.001/10000):2 with lines lw 2 lc rgb "#0072BD" title "x_1", \
     csv using ($1/0.001/10000):4 with lines lw 2 lc rgb "#EDB120" title "r_1"

set terminal pngcairo size 2307,1543 enhanced font "Arial,64"
set output outdir."/cxxplot_time_vs_x2_r2_comparison.png"
set ylabel "x_2, r_2"
set yrange [0:5]
set ytics 0,1,5
set key top right
plot csv using ($1/0.001/10000):3 with lines lw 2 lc rgb "#0072BD" title "x_2", \
     csv using ($1/0.001/10000):5 with lines lw 2 lc rgb "#EDB120" title "r_2"
