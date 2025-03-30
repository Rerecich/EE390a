############################################################
## This file is generated automatically by Vitis HLS.
## Please DO NOT edit it.
## Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
############################################################
open_project Vitis_Midterm
add_files HLS_Optimized/conv2d.cpp
add_files HLS_Optimized/conv2d.h
add_files -tb HLS_Optimized/conv2DTestbench.cpp
open_solution "solution1" -flow_target vivado
set_part {xc7z020clg400-1}
create_clock -period 10 -name default
#source "./Vitis_Midterm/solution1/directives.tcl"
csim_design
csynth_design
cosim_design
export_design -format ip_catalog
