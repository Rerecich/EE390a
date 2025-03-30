############################################################
## This file is generated automatically by Vitis HLS.
## Please DO NOT edit it.
## Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
############################################################
open_project Vitis_Legacy
set_top Conv2D_HW
add_files HLS_Legacy/conv2d.h
add_files HLS_Legacy/conv2d.cpp
add_files -tb HLS_Legacy/conv2DTestbench.cpp -cflags "-Wno-unknown-pragmas" -csimflags "-Wno-unknown-pragmas"
open_solution "solution1" -flow_target vivado
set_part {xc7z020-clg400-1}
create_clock -period 10 -name default
config_export -display_name Legacy -output /home/rerecich/EE-390a/CNN/Midterm/IP-catalog
#source "./Vitis_Legacy/solution1/directives.tcl"
csim_design -O
csynth_design
cosim_design
export_design -rtl verilog -format ip_catalog -output /home/rerecich/EE-390a/CNN/Midterm/IP-catalog
