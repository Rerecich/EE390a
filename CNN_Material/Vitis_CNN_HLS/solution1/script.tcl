############################################################
## This file is generated automatically by Vitis HLS.
## Please DO NOT edit it.
## Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
############################################################
open_project Vitis_CNN_HLS
set_top Conv2D_HW
add_files HLS/conv2d.cpp
add_files HLS/conv2d.h
add_files -tb HLS/conv2DTestbench.cpp
open_solution "solution1" -flow_target vivado
set_part {xc7z020clg400-1}
create_clock -period 10 -name default
config_export -format ip_catalog -output /home/rerecich/EE-390a/CNN/Conv2D_HW_InitVersion_Examples/Conv2D_HW_InitVersion_Students/CNN_Material/IP-catalog -rtl verilog
source "./Vitis_CNN_HLS/solution1/directives.tcl"
csim_design
csynth_design
cosim_design
export_design -rtl verilog -format ip_catalog -output /home/rerecich/EE-390a/CNN/Conv2D_HW_InitVersion_Examples/Conv2D_HW_InitVersion_Students/CNN_Material/IP-catalog
