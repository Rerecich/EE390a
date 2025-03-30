create_debug_core u_ila_0 ila
set_property ALL_PROBE_SAME_MU true [get_debug_cores u_ila_0]
set_property ALL_PROBE_SAME_MU_CNT 4 [get_debug_cores u_ila_0]
set_property C_ADV_TRIGGER true [get_debug_cores u_ila_0]
set_property C_DATA_DEPTH 1024 [get_debug_cores u_ila_0]
set_property C_EN_STRG_QUAL true [get_debug_cores u_ila_0]
set_property C_INPUT_PIPE_STAGES 0 [get_debug_cores u_ila_0]
set_property C_TRIGIN_EN false [get_debug_cores u_ila_0]
set_property C_TRIGOUT_EN false [get_debug_cores u_ila_0]
set_property port_width 1 [get_debug_ports u_ila_0/clk]
connect_debug_port u_ila_0/clk [get_nets [list design_1_i/processing_system7_0/inst/FCLK_CLK0]]
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe0]
set_property port_width 4 [get_debug_ports u_ila_0/probe0]
connect_debug_port u_ila_0/probe0 [get_nets [list {design_1_i/ps7_0_axi_periph_M00_AXI_WSTRB[0]} {design_1_i/ps7_0_axi_periph_M00_AXI_WSTRB[1]} {design_1_i/ps7_0_axi_periph_M00_AXI_WSTRB[2]} {design_1_i/ps7_0_axi_periph_M00_AXI_WSTRB[3]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe1]
set_property port_width 32 [get_debug_ports u_ila_0/probe1]
connect_debug_port u_ila_0/probe1 [get_nets [list {design_1_i/ps7_0_axi_periph_M00_AXI_WDATA[0]} {design_1_i/ps7_0_axi_periph_M00_AXI_WDATA[1]} {design_1_i/ps7_0_axi_periph_M00_AXI_WDATA[2]} {design_1_i/ps7_0_axi_periph_M00_AXI_WDATA[3]} {design_1_i/ps7_0_axi_periph_M00_AXI_WDATA[4]} {design_1_i/ps7_0_axi_periph_M00_AXI_WDATA[5]} {design_1_i/ps7_0_axi_periph_M00_AXI_WDATA[6]} {design_1_i/ps7_0_axi_periph_M00_AXI_WDATA[7]} {design_1_i/ps7_0_axi_periph_M00_AXI_WDATA[8]} {design_1_i/ps7_0_axi_periph_M00_AXI_WDATA[9]} {design_1_i/ps7_0_axi_periph_M00_AXI_WDATA[10]} {design_1_i/ps7_0_axi_periph_M00_AXI_WDATA[11]} {design_1_i/ps7_0_axi_periph_M00_AXI_WDATA[12]} {design_1_i/ps7_0_axi_periph_M00_AXI_WDATA[13]} {design_1_i/ps7_0_axi_periph_M00_AXI_WDATA[14]} {design_1_i/ps7_0_axi_periph_M00_AXI_WDATA[15]} {design_1_i/ps7_0_axi_periph_M00_AXI_WDATA[16]} {design_1_i/ps7_0_axi_periph_M00_AXI_WDATA[17]} {design_1_i/ps7_0_axi_periph_M00_AXI_WDATA[18]} {design_1_i/ps7_0_axi_periph_M00_AXI_WDATA[19]} {design_1_i/ps7_0_axi_periph_M00_AXI_WDATA[20]} {design_1_i/ps7_0_axi_periph_M00_AXI_WDATA[21]} {design_1_i/ps7_0_axi_periph_M00_AXI_WDATA[22]} {design_1_i/ps7_0_axi_periph_M00_AXI_WDATA[23]} {design_1_i/ps7_0_axi_periph_M00_AXI_WDATA[24]} {design_1_i/ps7_0_axi_periph_M00_AXI_WDATA[25]} {design_1_i/ps7_0_axi_periph_M00_AXI_WDATA[26]} {design_1_i/ps7_0_axi_periph_M00_AXI_WDATA[27]} {design_1_i/ps7_0_axi_periph_M00_AXI_WDATA[28]} {design_1_i/ps7_0_axi_periph_M00_AXI_WDATA[29]} {design_1_i/ps7_0_axi_periph_M00_AXI_WDATA[30]} {design_1_i/ps7_0_axi_periph_M00_AXI_WDATA[31]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe2]
set_property port_width 32 [get_debug_ports u_ila_0/probe2]
connect_debug_port u_ila_0/probe2 [get_nets [list {design_1_i/ps7_0_axi_periph_M00_AXI_RDATA[0]} {design_1_i/ps7_0_axi_periph_M00_AXI_RDATA[1]} {design_1_i/ps7_0_axi_periph_M00_AXI_RDATA[2]} {design_1_i/ps7_0_axi_periph_M00_AXI_RDATA[3]} {design_1_i/ps7_0_axi_periph_M00_AXI_RDATA[4]} {design_1_i/ps7_0_axi_periph_M00_AXI_RDATA[5]} {design_1_i/ps7_0_axi_periph_M00_AXI_RDATA[6]} {design_1_i/ps7_0_axi_periph_M00_AXI_RDATA[7]} {design_1_i/ps7_0_axi_periph_M00_AXI_RDATA[8]} {design_1_i/ps7_0_axi_periph_M00_AXI_RDATA[9]} {design_1_i/ps7_0_axi_periph_M00_AXI_RDATA[10]} {design_1_i/ps7_0_axi_periph_M00_AXI_RDATA[11]} {design_1_i/ps7_0_axi_periph_M00_AXI_RDATA[12]} {design_1_i/ps7_0_axi_periph_M00_AXI_RDATA[13]} {design_1_i/ps7_0_axi_periph_M00_AXI_RDATA[14]} {design_1_i/ps7_0_axi_periph_M00_AXI_RDATA[15]} {design_1_i/ps7_0_axi_periph_M00_AXI_RDATA[16]} {design_1_i/ps7_0_axi_periph_M00_AXI_RDATA[17]} {design_1_i/ps7_0_axi_periph_M00_AXI_RDATA[18]} {design_1_i/ps7_0_axi_periph_M00_AXI_RDATA[19]} {design_1_i/ps7_0_axi_periph_M00_AXI_RDATA[20]} {design_1_i/ps7_0_axi_periph_M00_AXI_RDATA[21]} {design_1_i/ps7_0_axi_periph_M00_AXI_RDATA[22]} {design_1_i/ps7_0_axi_periph_M00_AXI_RDATA[23]} {design_1_i/ps7_0_axi_periph_M00_AXI_RDATA[24]} {design_1_i/ps7_0_axi_periph_M00_AXI_RDATA[25]} {design_1_i/ps7_0_axi_periph_M00_AXI_RDATA[26]} {design_1_i/ps7_0_axi_periph_M00_AXI_RDATA[27]} {design_1_i/ps7_0_axi_periph_M00_AXI_RDATA[28]} {design_1_i/ps7_0_axi_periph_M00_AXI_RDATA[29]} {design_1_i/ps7_0_axi_periph_M00_AXI_RDATA[30]} {design_1_i/ps7_0_axi_periph_M00_AXI_RDATA[31]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe3]
set_property port_width 7 [get_debug_ports u_ila_0/probe3]
connect_debug_port u_ila_0/probe3 [get_nets [list {design_1_i/ps7_0_axi_periph_M00_AXI_AWADDR[0]} {design_1_i/ps7_0_axi_periph_M00_AXI_AWADDR[1]} {design_1_i/ps7_0_axi_periph_M00_AXI_AWADDR[2]} {design_1_i/ps7_0_axi_periph_M00_AXI_AWADDR[3]} {design_1_i/ps7_0_axi_periph_M00_AXI_AWADDR[4]} {design_1_i/ps7_0_axi_periph_M00_AXI_AWADDR[5]} {design_1_i/ps7_0_axi_periph_M00_AXI_AWADDR[6]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe4]
set_property port_width 7 [get_debug_ports u_ila_0/probe4]
connect_debug_port u_ila_0/probe4 [get_nets [list {design_1_i/ps7_0_axi_periph_M00_AXI_ARADDR[0]} {design_1_i/ps7_0_axi_periph_M00_AXI_ARADDR[1]} {design_1_i/ps7_0_axi_periph_M00_AXI_ARADDR[2]} {design_1_i/ps7_0_axi_periph_M00_AXI_ARADDR[3]} {design_1_i/ps7_0_axi_periph_M00_AXI_ARADDR[4]} {design_1_i/ps7_0_axi_periph_M00_AXI_ARADDR[5]} {design_1_i/ps7_0_axi_periph_M00_AXI_ARADDR[6]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe5]
set_property port_width 1 [get_debug_ports u_ila_0/probe5]
connect_debug_port u_ila_0/probe5 [get_nets [list design_1_i/ps7_0_axi_periph_M00_AXI_ARREADY]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe6]
set_property port_width 1 [get_debug_ports u_ila_0/probe6]
connect_debug_port u_ila_0/probe6 [get_nets [list design_1_i/ps7_0_axi_periph_M00_AXI_ARVALID]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe7]
set_property port_width 1 [get_debug_ports u_ila_0/probe7]
connect_debug_port u_ila_0/probe7 [get_nets [list design_1_i/ps7_0_axi_periph_M00_AXI_AWREADY]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe8]
set_property port_width 1 [get_debug_ports u_ila_0/probe8]
connect_debug_port u_ila_0/probe8 [get_nets [list design_1_i/ps7_0_axi_periph_M00_AXI_AWVALID]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe9]
set_property port_width 1 [get_debug_ports u_ila_0/probe9]
connect_debug_port u_ila_0/probe9 [get_nets [list design_1_i/ps7_0_axi_periph_M00_AXI_BREADY]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe10]
set_property port_width 1 [get_debug_ports u_ila_0/probe10]
connect_debug_port u_ila_0/probe10 [get_nets [list design_1_i/ps7_0_axi_periph_M00_AXI_BVALID]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe11]
set_property port_width 1 [get_debug_ports u_ila_0/probe11]
connect_debug_port u_ila_0/probe11 [get_nets [list design_1_i/ps7_0_axi_periph_M00_AXI_RREADY]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe12]
set_property port_width 1 [get_debug_ports u_ila_0/probe12]
connect_debug_port u_ila_0/probe12 [get_nets [list design_1_i/ps7_0_axi_periph_M00_AXI_RVALID]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe13]
set_property port_width 1 [get_debug_ports u_ila_0/probe13]
connect_debug_port u_ila_0/probe13 [get_nets [list design_1_i/ps7_0_axi_periph_M00_AXI_WREADY]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe14]
set_property port_width 1 [get_debug_ports u_ila_0/probe14]
connect_debug_port u_ila_0/probe14 [get_nets [list design_1_i/ps7_0_axi_periph_M00_AXI_WVALID]]
set_property C_CLK_INPUT_FREQ_HZ 300000000 [get_debug_cores dbg_hub]
set_property C_ENABLE_CLK_DIVIDER false [get_debug_cores dbg_hub]
set_property C_USER_SCAN_CHAIN 1 [get_debug_cores dbg_hub]
connect_debug_port dbg_hub/clk [get_nets clk]
