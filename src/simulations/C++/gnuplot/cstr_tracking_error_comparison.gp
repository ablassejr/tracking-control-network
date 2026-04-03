if (!exists("csv")) csv = "cstr_tracking_error_cpp_output.csv"
if (!exists("outdir")) outdir = "`echo $IMAGES_DIR`"

set datafile separator ","
set grid

set lmargin at screen 0.14
set rmargin at screen 0.96
set tmargin at screen 0.96
set bmargin at screen 0.18

set xlabel "k (time steps)                          {/Symbol \264}10^{4}"
set xrange [0:4.5]
set xtics 0,1,4

set terminal pngcairo size 2414,1544 enhanced font "Arial,64"
set output outdir."/cxxplot_fig2c_e1_comparison.png"
set ylabel "e_1"
set yrange [-0.5:0.4]
set ytics -0.4,0.2,0.4
plot csv using ($1/0.001/10000):2 with lines lw 2 lc rgb "#7E2F8E" notitle

set terminal pngcairo size 2338,1516 enhanced font "Arial,64"
set output outdir."/cxxplot_fig2c_e2_comparison.png"
set ylabel "e_2"
set yrange [-3:2.5]
set ytics -3,1,2
plot csv using ($1/0.001/10000):3 with lines lw 2 lc rgb "#7E2F8E" notitle
