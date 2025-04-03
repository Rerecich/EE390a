// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2022.2 (lin64) Build 3671981 Fri Oct 14 04:59:54 MDT 2022
// Date        : Thu Apr  3 18:04:32 2025
// Host        : diskless running 64-bit Ubuntu 22.04 LTS
// Command     : write_verilog -force -mode synth_stub
//               /home/rerecich/EE-390a/CNN/Midterm/Midterm/4-Parallelization/Vivado_Parallelization/Vivado_Parallelization.gen/sources_1/bd/design_1/ip/design_1_system_ila_0_0/design_1_system_ila_0_0_stub.v
// Design      : design_1_system_ila_0_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7z020clg400-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "bd_f60c,Vivado 2022.2" *)
module design_1_system_ila_0_0(clk, SLOT_0_AXI_awaddr, SLOT_0_AXI_awvalid, 
  SLOT_0_AXI_awready, SLOT_0_AXI_wdata, SLOT_0_AXI_wstrb, SLOT_0_AXI_wvalid, 
  SLOT_0_AXI_wready, SLOT_0_AXI_bresp, SLOT_0_AXI_bvalid, SLOT_0_AXI_bready, 
  SLOT_0_AXI_araddr, SLOT_0_AXI_arvalid, SLOT_0_AXI_arready, SLOT_0_AXI_rdata, 
  SLOT_0_AXI_rresp, SLOT_0_AXI_rvalid, SLOT_0_AXI_rready, SLOT_1_AXI_awid, 
  SLOT_1_AXI_awaddr, SLOT_1_AXI_awlen, SLOT_1_AXI_awsize, SLOT_1_AXI_awlock, 
  SLOT_1_AXI_awcache, SLOT_1_AXI_awprot, SLOT_1_AXI_awregion, SLOT_1_AXI_awqos, 
  SLOT_1_AXI_awvalid, SLOT_1_AXI_awready, SLOT_1_AXI_wdata, SLOT_1_AXI_wstrb, 
  SLOT_1_AXI_wlast, SLOT_1_AXI_wvalid, SLOT_1_AXI_wready, SLOT_1_AXI_bid, SLOT_1_AXI_bresp, 
  SLOT_1_AXI_bvalid, SLOT_1_AXI_bready, SLOT_1_AXI_arid, SLOT_1_AXI_araddr, 
  SLOT_1_AXI_arlen, SLOT_1_AXI_arsize, SLOT_1_AXI_arlock, SLOT_1_AXI_arcache, 
  SLOT_1_AXI_arprot, SLOT_1_AXI_arregion, SLOT_1_AXI_arqos, SLOT_1_AXI_arvalid, 
  SLOT_1_AXI_arready, SLOT_1_AXI_rid, SLOT_1_AXI_rdata, SLOT_1_AXI_rresp, SLOT_1_AXI_rlast, 
  SLOT_1_AXI_rvalid, SLOT_1_AXI_rready, resetn)
/* synthesis syn_black_box black_box_pad_pin="clk,SLOT_0_AXI_awaddr[6:0],SLOT_0_AXI_awvalid,SLOT_0_AXI_awready,SLOT_0_AXI_wdata[31:0],SLOT_0_AXI_wstrb[3:0],SLOT_0_AXI_wvalid,SLOT_0_AXI_wready,SLOT_0_AXI_bresp[1:0],SLOT_0_AXI_bvalid,SLOT_0_AXI_bready,SLOT_0_AXI_araddr[6:0],SLOT_0_AXI_arvalid,SLOT_0_AXI_arready,SLOT_0_AXI_rdata[31:0],SLOT_0_AXI_rresp[1:0],SLOT_0_AXI_rvalid,SLOT_0_AXI_rready,SLOT_1_AXI_awid[0:0],SLOT_1_AXI_awaddr[63:0],SLOT_1_AXI_awlen[7:0],SLOT_1_AXI_awsize[2:0],SLOT_1_AXI_awlock[0:0],SLOT_1_AXI_awcache[3:0],SLOT_1_AXI_awprot[2:0],SLOT_1_AXI_awregion[3:0],SLOT_1_AXI_awqos[3:0],SLOT_1_AXI_awvalid,SLOT_1_AXI_awready,SLOT_1_AXI_wdata[31:0],SLOT_1_AXI_wstrb[3:0],SLOT_1_AXI_wlast,SLOT_1_AXI_wvalid,SLOT_1_AXI_wready,SLOT_1_AXI_bid[0:0],SLOT_1_AXI_bresp[1:0],SLOT_1_AXI_bvalid,SLOT_1_AXI_bready,SLOT_1_AXI_arid[0:0],SLOT_1_AXI_araddr[63:0],SLOT_1_AXI_arlen[7:0],SLOT_1_AXI_arsize[2:0],SLOT_1_AXI_arlock[0:0],SLOT_1_AXI_arcache[3:0],SLOT_1_AXI_arprot[2:0],SLOT_1_AXI_arregion[3:0],SLOT_1_AXI_arqos[3:0],SLOT_1_AXI_arvalid,SLOT_1_AXI_arready,SLOT_1_AXI_rid[0:0],SLOT_1_AXI_rdata[31:0],SLOT_1_AXI_rresp[1:0],SLOT_1_AXI_rlast,SLOT_1_AXI_rvalid,SLOT_1_AXI_rready,resetn" */;
  input clk;
  input [6:0]SLOT_0_AXI_awaddr;
  input SLOT_0_AXI_awvalid;
  input SLOT_0_AXI_awready;
  input [31:0]SLOT_0_AXI_wdata;
  input [3:0]SLOT_0_AXI_wstrb;
  input SLOT_0_AXI_wvalid;
  input SLOT_0_AXI_wready;
  input [1:0]SLOT_0_AXI_bresp;
  input SLOT_0_AXI_bvalid;
  input SLOT_0_AXI_bready;
  input [6:0]SLOT_0_AXI_araddr;
  input SLOT_0_AXI_arvalid;
  input SLOT_0_AXI_arready;
  input [31:0]SLOT_0_AXI_rdata;
  input [1:0]SLOT_0_AXI_rresp;
  input SLOT_0_AXI_rvalid;
  input SLOT_0_AXI_rready;
  input [0:0]SLOT_1_AXI_awid;
  input [63:0]SLOT_1_AXI_awaddr;
  input [7:0]SLOT_1_AXI_awlen;
  input [2:0]SLOT_1_AXI_awsize;
  input [0:0]SLOT_1_AXI_awlock;
  input [3:0]SLOT_1_AXI_awcache;
  input [2:0]SLOT_1_AXI_awprot;
  input [3:0]SLOT_1_AXI_awregion;
  input [3:0]SLOT_1_AXI_awqos;
  input SLOT_1_AXI_awvalid;
  input SLOT_1_AXI_awready;
  input [31:0]SLOT_1_AXI_wdata;
  input [3:0]SLOT_1_AXI_wstrb;
  input SLOT_1_AXI_wlast;
  input SLOT_1_AXI_wvalid;
  input SLOT_1_AXI_wready;
  input [0:0]SLOT_1_AXI_bid;
  input [1:0]SLOT_1_AXI_bresp;
  input SLOT_1_AXI_bvalid;
  input SLOT_1_AXI_bready;
  input [0:0]SLOT_1_AXI_arid;
  input [63:0]SLOT_1_AXI_araddr;
  input [7:0]SLOT_1_AXI_arlen;
  input [2:0]SLOT_1_AXI_arsize;
  input [0:0]SLOT_1_AXI_arlock;
  input [3:0]SLOT_1_AXI_arcache;
  input [2:0]SLOT_1_AXI_arprot;
  input [3:0]SLOT_1_AXI_arregion;
  input [3:0]SLOT_1_AXI_arqos;
  input SLOT_1_AXI_arvalid;
  input SLOT_1_AXI_arready;
  input [0:0]SLOT_1_AXI_rid;
  input [31:0]SLOT_1_AXI_rdata;
  input [1:0]SLOT_1_AXI_rresp;
  input SLOT_1_AXI_rlast;
  input SLOT_1_AXI_rvalid;
  input SLOT_1_AXI_rready;
  input resetn;
endmodule
