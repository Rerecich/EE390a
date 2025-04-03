--Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Command: generate_target bd_f60c.bd
--Design : bd_f60c
--Purpose: IP block netlist
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity bd_f60c is
  port (
    SLOT_0_AXI_araddr : in STD_LOGIC_VECTOR ( 6 downto 0 );
    SLOT_0_AXI_arready : in STD_LOGIC;
    SLOT_0_AXI_arvalid : in STD_LOGIC;
    SLOT_0_AXI_awaddr : in STD_LOGIC_VECTOR ( 6 downto 0 );
    SLOT_0_AXI_awready : in STD_LOGIC;
    SLOT_0_AXI_awvalid : in STD_LOGIC;
    SLOT_0_AXI_bready : in STD_LOGIC;
    SLOT_0_AXI_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    SLOT_0_AXI_bvalid : in STD_LOGIC;
    SLOT_0_AXI_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    SLOT_0_AXI_rready : in STD_LOGIC;
    SLOT_0_AXI_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    SLOT_0_AXI_rvalid : in STD_LOGIC;
    SLOT_0_AXI_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    SLOT_0_AXI_wready : in STD_LOGIC;
    SLOT_0_AXI_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    SLOT_0_AXI_wvalid : in STD_LOGIC;
    SLOT_1_AXI_araddr : in STD_LOGIC_VECTOR ( 63 downto 0 );
    SLOT_1_AXI_arcache : in STD_LOGIC_VECTOR ( 3 downto 0 );
    SLOT_1_AXI_arid : in STD_LOGIC_VECTOR ( 0 to 0 );
    SLOT_1_AXI_arlen : in STD_LOGIC_VECTOR ( 7 downto 0 );
    SLOT_1_AXI_arlock : in STD_LOGIC_VECTOR ( 0 to 0 );
    SLOT_1_AXI_arprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    SLOT_1_AXI_arqos : in STD_LOGIC_VECTOR ( 3 downto 0 );
    SLOT_1_AXI_arready : in STD_LOGIC;
    SLOT_1_AXI_arregion : in STD_LOGIC_VECTOR ( 3 downto 0 );
    SLOT_1_AXI_arsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
    SLOT_1_AXI_arvalid : in STD_LOGIC;
    SLOT_1_AXI_awaddr : in STD_LOGIC_VECTOR ( 63 downto 0 );
    SLOT_1_AXI_awcache : in STD_LOGIC_VECTOR ( 3 downto 0 );
    SLOT_1_AXI_awid : in STD_LOGIC_VECTOR ( 0 to 0 );
    SLOT_1_AXI_awlen : in STD_LOGIC_VECTOR ( 7 downto 0 );
    SLOT_1_AXI_awlock : in STD_LOGIC_VECTOR ( 0 to 0 );
    SLOT_1_AXI_awprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    SLOT_1_AXI_awqos : in STD_LOGIC_VECTOR ( 3 downto 0 );
    SLOT_1_AXI_awready : in STD_LOGIC;
    SLOT_1_AXI_awregion : in STD_LOGIC_VECTOR ( 3 downto 0 );
    SLOT_1_AXI_awsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
    SLOT_1_AXI_awvalid : in STD_LOGIC;
    SLOT_1_AXI_bid : in STD_LOGIC_VECTOR ( 0 to 0 );
    SLOT_1_AXI_bready : in STD_LOGIC;
    SLOT_1_AXI_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    SLOT_1_AXI_bvalid : in STD_LOGIC;
    SLOT_1_AXI_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    SLOT_1_AXI_rid : in STD_LOGIC_VECTOR ( 0 to 0 );
    SLOT_1_AXI_rlast : in STD_LOGIC;
    SLOT_1_AXI_rready : in STD_LOGIC;
    SLOT_1_AXI_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    SLOT_1_AXI_rvalid : in STD_LOGIC;
    SLOT_1_AXI_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    SLOT_1_AXI_wlast : in STD_LOGIC;
    SLOT_1_AXI_wready : in STD_LOGIC;
    SLOT_1_AXI_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    SLOT_1_AXI_wvalid : in STD_LOGIC;
    clk : in STD_LOGIC;
    resetn : in STD_LOGIC
  );
  attribute core_generation_info : string;
  attribute core_generation_info of bd_f60c : entity is "bd_f60c,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=bd_f60c,x_ipVersion=1.00.a,x_ipLanguage=VHDL,numBlks=12,numReposBlks=12,numNonXlnxBlks=0,numHierBlks=0,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=0,numPkgbdBlks=0,bdsource=SBD,synth_mode=Global}";
  attribute hw_handoff : string;
  attribute hw_handoff of bd_f60c : entity is "design_1_system_ila_0_0.hwdef";
end bd_f60c;

architecture STRUCTURE of bd_f60c is
  component bd_f60c_ila_lib_0 is
  port (
    clk : in STD_LOGIC;
    probe0 : in STD_LOGIC_VECTOR ( 1 downto 0 );
    probe1 : in STD_LOGIC_VECTOR ( 6 downto 0 );
    probe2 : in STD_LOGIC_VECTOR ( 1 downto 0 );
    probe3 : in STD_LOGIC_VECTOR ( 6 downto 0 );
    probe4 : in STD_LOGIC_VECTOR ( 1 downto 0 );
    probe5 : in STD_LOGIC_VECTOR ( 1 downto 0 );
    probe6 : in STD_LOGIC_VECTOR ( 1 downto 0 );
    probe7 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    probe8 : in STD_LOGIC_VECTOR ( 1 downto 0 );
    probe9 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    probe10 : in STD_LOGIC_VECTOR ( 3 downto 0 );
    probe11 : in STD_LOGIC_VECTOR ( 1 downto 0 );
    probe12 : in STD_LOGIC_VECTOR ( 1 downto 0 );
    probe13 : in STD_LOGIC_VECTOR ( 1 downto 0 );
    probe14 : in STD_LOGIC_VECTOR ( 1 downto 0 );
    probe15 : in STD_LOGIC_VECTOR ( 1 downto 0 );
    probe16 : in STD_LOGIC_VECTOR ( 1 downto 0 );
    probe17 : in STD_LOGIC_VECTOR ( 63 downto 0 );
    probe18 : in STD_LOGIC_VECTOR ( 3 downto 0 );
    probe19 : in STD_LOGIC_VECTOR ( 0 to 0 );
    probe20 : in STD_LOGIC_VECTOR ( 7 downto 0 );
    probe21 : in STD_LOGIC_VECTOR ( 0 to 0 );
    probe22 : in STD_LOGIC_VECTOR ( 2 downto 0 );
    probe23 : in STD_LOGIC_VECTOR ( 3 downto 0 );
    probe24 : in STD_LOGIC_VECTOR ( 3 downto 0 );
    probe25 : in STD_LOGIC_VECTOR ( 2 downto 0 );
    probe26 : in STD_LOGIC_VECTOR ( 1 downto 0 );
    probe27 : in STD_LOGIC_VECTOR ( 63 downto 0 );
    probe28 : in STD_LOGIC_VECTOR ( 3 downto 0 );
    probe29 : in STD_LOGIC_VECTOR ( 0 to 0 );
    probe30 : in STD_LOGIC_VECTOR ( 7 downto 0 );
    probe31 : in STD_LOGIC_VECTOR ( 0 to 0 );
    probe32 : in STD_LOGIC_VECTOR ( 2 downto 0 );
    probe33 : in STD_LOGIC_VECTOR ( 3 downto 0 );
    probe34 : in STD_LOGIC_VECTOR ( 3 downto 0 );
    probe35 : in STD_LOGIC_VECTOR ( 2 downto 0 );
    probe36 : in STD_LOGIC_VECTOR ( 1 downto 0 );
    probe37 : in STD_LOGIC_VECTOR ( 0 to 0 );
    probe38 : in STD_LOGIC_VECTOR ( 1 downto 0 );
    probe39 : in STD_LOGIC_VECTOR ( 1 downto 0 );
    probe40 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    probe41 : in STD_LOGIC_VECTOR ( 0 to 0 );
    probe42 : in STD_LOGIC_VECTOR ( 1 downto 0 );
    probe43 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    probe44 : in STD_LOGIC_VECTOR ( 3 downto 0 );
    probe45 : in STD_LOGIC_VECTOR ( 1 downto 0 );
    probe46 : in STD_LOGIC_VECTOR ( 2 downto 0 );
    probe47 : in STD_LOGIC_VECTOR ( 1 downto 0 );
    probe48 : in STD_LOGIC_VECTOR ( 1 downto 0 );
    probe49 : in STD_LOGIC_VECTOR ( 2 downto 0 )
  );
  end component bd_f60c_ila_lib_0;
  component bd_f60c_g_inst_0 is
  port (
    aclk : in STD_LOGIC;
    aresetn : in STD_LOGIC;
    m_slot_0_axi_b_cnt : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_slot_0_axi_r_cnt : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_slot_1_axi_b_cnt : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_slot_1_axi_r_cnt : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_slot_0_axi_aw_cnt : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_slot_0_axi_ar_cnt : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_slot_1_axi_aw_cnt : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_slot_1_axi_ar_cnt : out STD_LOGIC_VECTOR ( 1 downto 0 );
    slot_0_axi_awaddr : in STD_LOGIC_VECTOR ( 6 downto 0 );
    slot_0_axi_awvalid : in STD_LOGIC;
    slot_0_axi_awready : in STD_LOGIC;
    slot_0_axi_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    slot_0_axi_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    slot_0_axi_wvalid : in STD_LOGIC;
    slot_0_axi_wready : in STD_LOGIC;
    slot_0_axi_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    slot_0_axi_bvalid : in STD_LOGIC;
    slot_0_axi_bready : in STD_LOGIC;
    slot_0_axi_araddr : in STD_LOGIC_VECTOR ( 6 downto 0 );
    slot_0_axi_arvalid : in STD_LOGIC;
    slot_0_axi_arready : in STD_LOGIC;
    slot_0_axi_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    slot_0_axi_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    slot_0_axi_rvalid : in STD_LOGIC;
    slot_0_axi_rready : in STD_LOGIC;
    slot_1_axi_awid : in STD_LOGIC_VECTOR ( 0 to 0 );
    slot_1_axi_awaddr : in STD_LOGIC_VECTOR ( 63 downto 0 );
    slot_1_axi_awprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    slot_1_axi_awlen : in STD_LOGIC_VECTOR ( 7 downto 0 );
    slot_1_axi_awsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
    slot_1_axi_awcache : in STD_LOGIC_VECTOR ( 3 downto 0 );
    slot_1_axi_awlock : in STD_LOGIC_VECTOR ( 0 to 0 );
    slot_1_axi_awvalid : in STD_LOGIC;
    slot_1_axi_awready : in STD_LOGIC;
    slot_1_axi_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    slot_1_axi_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    slot_1_axi_wlast : in STD_LOGIC;
    slot_1_axi_wvalid : in STD_LOGIC;
    slot_1_axi_wready : in STD_LOGIC;
    slot_1_axi_bid : in STD_LOGIC_VECTOR ( 0 to 0 );
    slot_1_axi_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    slot_1_axi_bvalid : in STD_LOGIC;
    slot_1_axi_bready : in STD_LOGIC;
    slot_1_axi_arid : in STD_LOGIC_VECTOR ( 0 to 0 );
    slot_1_axi_araddr : in STD_LOGIC_VECTOR ( 63 downto 0 );
    slot_1_axi_arlen : in STD_LOGIC_VECTOR ( 7 downto 0 );
    slot_1_axi_arsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
    slot_1_axi_arcache : in STD_LOGIC_VECTOR ( 3 downto 0 );
    slot_1_axi_arprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    slot_1_axi_arlock : in STD_LOGIC_VECTOR ( 0 to 0 );
    slot_1_axi_arvalid : in STD_LOGIC;
    slot_1_axi_arready : in STD_LOGIC;
    slot_1_axi_rid : in STD_LOGIC_VECTOR ( 0 to 0 );
    slot_1_axi_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    slot_1_axi_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    slot_1_axi_rlast : in STD_LOGIC;
    slot_1_axi_rvalid : in STD_LOGIC;
    slot_1_axi_rready : in STD_LOGIC;
    m_slot_0_axi_awaddr : out STD_LOGIC_VECTOR ( 6 downto 0 );
    m_slot_0_axi_awvalid : out STD_LOGIC;
    m_slot_0_axi_awready : out STD_LOGIC;
    m_slot_0_axi_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_slot_0_axi_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_slot_0_axi_wvalid : out STD_LOGIC;
    m_slot_0_axi_wready : out STD_LOGIC;
    m_slot_0_axi_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_slot_0_axi_bvalid : out STD_LOGIC;
    m_slot_0_axi_bready : out STD_LOGIC;
    m_slot_0_axi_araddr : out STD_LOGIC_VECTOR ( 6 downto 0 );
    m_slot_0_axi_arvalid : out STD_LOGIC;
    m_slot_0_axi_arready : out STD_LOGIC;
    m_slot_0_axi_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_slot_0_axi_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_slot_0_axi_rvalid : out STD_LOGIC;
    m_slot_0_axi_rready : out STD_LOGIC;
    m_slot_1_axi_awid : out STD_LOGIC_VECTOR ( 0 to 0 );
    m_slot_1_axi_awaddr : out STD_LOGIC_VECTOR ( 63 downto 0 );
    m_slot_1_axi_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_slot_1_axi_awlen : out STD_LOGIC_VECTOR ( 7 downto 0 );
    m_slot_1_axi_awsize : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_slot_1_axi_awcache : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_slot_1_axi_awlock : out STD_LOGIC_VECTOR ( 0 to 0 );
    m_slot_1_axi_awvalid : out STD_LOGIC;
    m_slot_1_axi_awready : out STD_LOGIC;
    m_slot_1_axi_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_slot_1_axi_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_slot_1_axi_wlast : out STD_LOGIC;
    m_slot_1_axi_wvalid : out STD_LOGIC;
    m_slot_1_axi_wready : out STD_LOGIC;
    m_slot_1_axi_bid : out STD_LOGIC_VECTOR ( 0 to 0 );
    m_slot_1_axi_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_slot_1_axi_bvalid : out STD_LOGIC;
    m_slot_1_axi_bready : out STD_LOGIC;
    m_slot_1_axi_arid : out STD_LOGIC_VECTOR ( 0 to 0 );
    m_slot_1_axi_araddr : out STD_LOGIC_VECTOR ( 63 downto 0 );
    m_slot_1_axi_arlen : out STD_LOGIC_VECTOR ( 7 downto 0 );
    m_slot_1_axi_arsize : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_slot_1_axi_arcache : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_slot_1_axi_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_slot_1_axi_arlock : out STD_LOGIC_VECTOR ( 0 to 0 );
    m_slot_1_axi_arvalid : out STD_LOGIC;
    m_slot_1_axi_arready : out STD_LOGIC;
    m_slot_1_axi_rid : out STD_LOGIC_VECTOR ( 0 to 0 );
    m_slot_1_axi_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_slot_1_axi_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_slot_1_axi_rlast : out STD_LOGIC;
    m_slot_1_axi_rvalid : out STD_LOGIC;
    m_slot_1_axi_rready : out STD_LOGIC;
    slot_1_axi_awregion : in STD_LOGIC_VECTOR ( 3 downto 0 );
    slot_1_axi_awqos : in STD_LOGIC_VECTOR ( 3 downto 0 );
    slot_1_axi_arregion : in STD_LOGIC_VECTOR ( 3 downto 0 );
    slot_1_axi_arqos : in STD_LOGIC_VECTOR ( 3 downto 0 );
    m_slot_1_axi_awregion : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_slot_1_axi_awqos : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_slot_1_axi_arregion : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_slot_1_axi_arqos : out STD_LOGIC_VECTOR ( 3 downto 0 )
  );
  end component bd_f60c_g_inst_0;
  component bd_f60c_slot_0_aw_0 is
  port (
    In0 : in STD_LOGIC_VECTOR ( 0 to 0 );
    In1 : in STD_LOGIC_VECTOR ( 0 to 0 );
    dout : out STD_LOGIC_VECTOR ( 1 downto 0 )
  );
  end component bd_f60c_slot_0_aw_0;
  component bd_f60c_slot_0_w_0 is
  port (
    In0 : in STD_LOGIC_VECTOR ( 0 to 0 );
    In1 : in STD_LOGIC_VECTOR ( 0 to 0 );
    dout : out STD_LOGIC_VECTOR ( 1 downto 0 )
  );
  end component bd_f60c_slot_0_w_0;
  component bd_f60c_slot_0_b_0 is
  port (
    In0 : in STD_LOGIC_VECTOR ( 0 to 0 );
    In1 : in STD_LOGIC_VECTOR ( 0 to 0 );
    dout : out STD_LOGIC_VECTOR ( 1 downto 0 )
  );
  end component bd_f60c_slot_0_b_0;
  component bd_f60c_slot_0_ar_0 is
  port (
    In0 : in STD_LOGIC_VECTOR ( 0 to 0 );
    In1 : in STD_LOGIC_VECTOR ( 0 to 0 );
    dout : out STD_LOGIC_VECTOR ( 1 downto 0 )
  );
  end component bd_f60c_slot_0_ar_0;
  component bd_f60c_slot_0_r_0 is
  port (
    In0 : in STD_LOGIC_VECTOR ( 0 to 0 );
    In1 : in STD_LOGIC_VECTOR ( 0 to 0 );
    dout : out STD_LOGIC_VECTOR ( 1 downto 0 )
  );
  end component bd_f60c_slot_0_r_0;
  component bd_f60c_slot_1_aw_0 is
  port (
    In0 : in STD_LOGIC_VECTOR ( 0 to 0 );
    In1 : in STD_LOGIC_VECTOR ( 0 to 0 );
    dout : out STD_LOGIC_VECTOR ( 1 downto 0 )
  );
  end component bd_f60c_slot_1_aw_0;
  component bd_f60c_slot_1_w_0 is
  port (
    In0 : in STD_LOGIC_VECTOR ( 0 to 0 );
    In1 : in STD_LOGIC_VECTOR ( 0 to 0 );
    In2 : in STD_LOGIC_VECTOR ( 0 to 0 );
    dout : out STD_LOGIC_VECTOR ( 2 downto 0 )
  );
  end component bd_f60c_slot_1_w_0;
  component bd_f60c_slot_1_b_0 is
  port (
    In0 : in STD_LOGIC_VECTOR ( 0 to 0 );
    In1 : in STD_LOGIC_VECTOR ( 0 to 0 );
    dout : out STD_LOGIC_VECTOR ( 1 downto 0 )
  );
  end component bd_f60c_slot_1_b_0;
  component bd_f60c_slot_1_ar_0 is
  port (
    In0 : in STD_LOGIC_VECTOR ( 0 to 0 );
    In1 : in STD_LOGIC_VECTOR ( 0 to 0 );
    dout : out STD_LOGIC_VECTOR ( 1 downto 0 )
  );
  end component bd_f60c_slot_1_ar_0;
  component bd_f60c_slot_1_r_0 is
  port (
    In0 : in STD_LOGIC_VECTOR ( 0 to 0 );
    In1 : in STD_LOGIC_VECTOR ( 0 to 0 );
    In2 : in STD_LOGIC_VECTOR ( 0 to 0 );
    dout : out STD_LOGIC_VECTOR ( 2 downto 0 )
  );
  end component bd_f60c_slot_1_r_0;
  signal Conn1_ARADDR : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal Conn1_ARCACHE : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal Conn1_ARID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal Conn1_ARLEN : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal Conn1_ARLOCK : STD_LOGIC_VECTOR ( 0 to 0 );
  signal Conn1_ARPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal Conn1_ARQOS : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal Conn1_ARREADY : STD_LOGIC;
  signal Conn1_ARREGION : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal Conn1_ARSIZE : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal Conn1_ARVALID : STD_LOGIC;
  signal Conn1_AWADDR : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal Conn1_AWCACHE : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal Conn1_AWID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal Conn1_AWLEN : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal Conn1_AWLOCK : STD_LOGIC_VECTOR ( 0 to 0 );
  signal Conn1_AWPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal Conn1_AWQOS : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal Conn1_AWREADY : STD_LOGIC;
  signal Conn1_AWREGION : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal Conn1_AWSIZE : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal Conn1_AWVALID : STD_LOGIC;
  signal Conn1_BID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal Conn1_BREADY : STD_LOGIC;
  signal Conn1_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal Conn1_BVALID : STD_LOGIC;
  signal Conn1_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal Conn1_RID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal Conn1_RLAST : STD_LOGIC;
  signal Conn1_RREADY : STD_LOGIC;
  signal Conn1_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal Conn1_RVALID : STD_LOGIC;
  signal Conn1_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal Conn1_WLAST : STD_LOGIC;
  signal Conn1_WREADY : STD_LOGIC;
  signal Conn1_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal Conn1_WVALID : STD_LOGIC;
  signal Conn_ARADDR : STD_LOGIC_VECTOR ( 6 downto 0 );
  signal Conn_ARREADY : STD_LOGIC;
  signal Conn_ARVALID : STD_LOGIC;
  signal Conn_AWADDR : STD_LOGIC_VECTOR ( 6 downto 0 );
  signal Conn_AWREADY : STD_LOGIC;
  signal Conn_AWVALID : STD_LOGIC;
  signal Conn_BREADY : STD_LOGIC;
  signal Conn_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal Conn_BVALID : STD_LOGIC;
  signal Conn_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal Conn_RREADY : STD_LOGIC;
  signal Conn_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal Conn_RVALID : STD_LOGIC;
  signal Conn_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal Conn_WREADY : STD_LOGIC;
  signal Conn_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal Conn_WVALID : STD_LOGIC;
  signal clk_1 : STD_LOGIC;
  signal net_slot_0_axi_ar_cnt : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal net_slot_0_axi_ar_ctrl : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal net_slot_0_axi_araddr : STD_LOGIC_VECTOR ( 6 downto 0 );
  signal net_slot_0_axi_arready : STD_LOGIC;
  signal net_slot_0_axi_arvalid : STD_LOGIC;
  signal net_slot_0_axi_aw_cnt : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal net_slot_0_axi_aw_ctrl : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal net_slot_0_axi_awaddr : STD_LOGIC_VECTOR ( 6 downto 0 );
  signal net_slot_0_axi_awready : STD_LOGIC;
  signal net_slot_0_axi_awvalid : STD_LOGIC;
  signal net_slot_0_axi_b_cnt : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal net_slot_0_axi_b_ctrl : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal net_slot_0_axi_bready : STD_LOGIC;
  signal net_slot_0_axi_bresp : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal net_slot_0_axi_bvalid : STD_LOGIC;
  signal net_slot_0_axi_r_cnt : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal net_slot_0_axi_r_ctrl : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal net_slot_0_axi_rdata : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal net_slot_0_axi_rready : STD_LOGIC;
  signal net_slot_0_axi_rresp : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal net_slot_0_axi_rvalid : STD_LOGIC;
  signal net_slot_0_axi_w_ctrl : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal net_slot_0_axi_wdata : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal net_slot_0_axi_wready : STD_LOGIC;
  signal net_slot_0_axi_wstrb : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal net_slot_0_axi_wvalid : STD_LOGIC;
  signal net_slot_1_axi_ar_cnt : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal net_slot_1_axi_ar_ctrl : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal net_slot_1_axi_araddr : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal net_slot_1_axi_arcache : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal net_slot_1_axi_arid : STD_LOGIC_VECTOR ( 0 to 0 );
  signal net_slot_1_axi_arlen : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal net_slot_1_axi_arlock : STD_LOGIC_VECTOR ( 0 to 0 );
  signal net_slot_1_axi_arprot : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal net_slot_1_axi_arqos : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal net_slot_1_axi_arready : STD_LOGIC;
  signal net_slot_1_axi_arregion : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal net_slot_1_axi_arsize : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal net_slot_1_axi_arvalid : STD_LOGIC;
  signal net_slot_1_axi_aw_cnt : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal net_slot_1_axi_aw_ctrl : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal net_slot_1_axi_awaddr : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal net_slot_1_axi_awcache : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal net_slot_1_axi_awid : STD_LOGIC_VECTOR ( 0 to 0 );
  signal net_slot_1_axi_awlen : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal net_slot_1_axi_awlock : STD_LOGIC_VECTOR ( 0 to 0 );
  signal net_slot_1_axi_awprot : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal net_slot_1_axi_awqos : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal net_slot_1_axi_awready : STD_LOGIC;
  signal net_slot_1_axi_awregion : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal net_slot_1_axi_awsize : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal net_slot_1_axi_awvalid : STD_LOGIC;
  signal net_slot_1_axi_b_cnt : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal net_slot_1_axi_b_ctrl : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal net_slot_1_axi_bid : STD_LOGIC_VECTOR ( 0 to 0 );
  signal net_slot_1_axi_bready : STD_LOGIC;
  signal net_slot_1_axi_bresp : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal net_slot_1_axi_bvalid : STD_LOGIC;
  signal net_slot_1_axi_r_cnt : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal net_slot_1_axi_r_ctrl : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal net_slot_1_axi_rdata : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal net_slot_1_axi_rid : STD_LOGIC_VECTOR ( 0 to 0 );
  signal net_slot_1_axi_rlast : STD_LOGIC;
  signal net_slot_1_axi_rready : STD_LOGIC;
  signal net_slot_1_axi_rresp : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal net_slot_1_axi_rvalid : STD_LOGIC;
  signal net_slot_1_axi_w_ctrl : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal net_slot_1_axi_wdata : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal net_slot_1_axi_wlast : STD_LOGIC;
  signal net_slot_1_axi_wready : STD_LOGIC;
  signal net_slot_1_axi_wstrb : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal net_slot_1_axi_wvalid : STD_LOGIC;
  signal resetn_1 : STD_LOGIC;
  attribute x_interface_info : string;
  attribute x_interface_info of SLOT_0_AXI_arready : signal is "xilinx.com:interface:aximm:1.0 SLOT_0_AXI ARREADY";
  attribute x_interface_info of SLOT_0_AXI_arvalid : signal is "xilinx.com:interface:aximm:1.0 SLOT_0_AXI ARVALID";
  attribute x_interface_info of SLOT_0_AXI_awready : signal is "xilinx.com:interface:aximm:1.0 SLOT_0_AXI AWREADY";
  attribute x_interface_info of SLOT_0_AXI_awvalid : signal is "xilinx.com:interface:aximm:1.0 SLOT_0_AXI AWVALID";
  attribute x_interface_info of SLOT_0_AXI_bready : signal is "xilinx.com:interface:aximm:1.0 SLOT_0_AXI BREADY";
  attribute x_interface_info of SLOT_0_AXI_bvalid : signal is "xilinx.com:interface:aximm:1.0 SLOT_0_AXI BVALID";
  attribute x_interface_info of SLOT_0_AXI_rready : signal is "xilinx.com:interface:aximm:1.0 SLOT_0_AXI RREADY";
  attribute x_interface_info of SLOT_0_AXI_rvalid : signal is "xilinx.com:interface:aximm:1.0 SLOT_0_AXI RVALID";
  attribute x_interface_info of SLOT_0_AXI_wready : signal is "xilinx.com:interface:aximm:1.0 SLOT_0_AXI WREADY";
  attribute x_interface_info of SLOT_0_AXI_wvalid : signal is "xilinx.com:interface:aximm:1.0 SLOT_0_AXI WVALID";
  attribute x_interface_info of SLOT_1_AXI_arready : signal is "xilinx.com:interface:aximm:1.0 SLOT_1_AXI ARREADY";
  attribute x_interface_info of SLOT_1_AXI_arvalid : signal is "xilinx.com:interface:aximm:1.0 SLOT_1_AXI ARVALID";
  attribute x_interface_info of SLOT_1_AXI_awready : signal is "xilinx.com:interface:aximm:1.0 SLOT_1_AXI AWREADY";
  attribute x_interface_info of SLOT_1_AXI_awvalid : signal is "xilinx.com:interface:aximm:1.0 SLOT_1_AXI AWVALID";
  attribute x_interface_info of SLOT_1_AXI_bready : signal is "xilinx.com:interface:aximm:1.0 SLOT_1_AXI BREADY";
  attribute x_interface_info of SLOT_1_AXI_bvalid : signal is "xilinx.com:interface:aximm:1.0 SLOT_1_AXI BVALID";
  attribute x_interface_info of SLOT_1_AXI_rlast : signal is "xilinx.com:interface:aximm:1.0 SLOT_1_AXI RLAST";
  attribute x_interface_info of SLOT_1_AXI_rready : signal is "xilinx.com:interface:aximm:1.0 SLOT_1_AXI RREADY";
  attribute x_interface_info of SLOT_1_AXI_rvalid : signal is "xilinx.com:interface:aximm:1.0 SLOT_1_AXI RVALID";
  attribute x_interface_info of SLOT_1_AXI_wlast : signal is "xilinx.com:interface:aximm:1.0 SLOT_1_AXI WLAST";
  attribute x_interface_info of SLOT_1_AXI_wready : signal is "xilinx.com:interface:aximm:1.0 SLOT_1_AXI WREADY";
  attribute x_interface_info of SLOT_1_AXI_wvalid : signal is "xilinx.com:interface:aximm:1.0 SLOT_1_AXI WVALID";
  attribute x_interface_info of clk : signal is "xilinx.com:signal:clock:1.0 CLK.CLK CLK";
  attribute x_interface_parameter : string;
  attribute x_interface_parameter of clk : signal is "XIL_INTERFACENAME CLK.CLK, ASSOCIATED_BUSIF SLOT_0_AXI:SLOT_1_AXI, ASSOCIATED_RESET resetn, CLK_DOMAIN design_1_processing_system7_0_0_FCLK_CLK0, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, INSERT_VIP 0, PHASE 0.0";
  attribute x_interface_info of resetn : signal is "xilinx.com:signal:reset:1.0 RST.RESETN RST";
  attribute x_interface_parameter of resetn : signal is "XIL_INTERFACENAME RST.RESETN, INSERT_VIP 0, POLARITY ACTIVE_LOW";
  attribute x_interface_info of SLOT_0_AXI_araddr : signal is "xilinx.com:interface:aximm:1.0 SLOT_0_AXI ARADDR";
  attribute x_interface_parameter of SLOT_0_AXI_araddr : signal is "XIL_INTERFACENAME SLOT_0_AXI, ADDR_WIDTH 7, ARUSER_WIDTH 0, AWUSER_WIDTH 0, BUSER_WIDTH 0, CLK_DOMAIN design_1_processing_system7_0_0_FCLK_CLK0, DATA_WIDTH 32, FREQ_HZ 100000000, HAS_BRESP 1, HAS_BURST 0, HAS_CACHE 0, HAS_LOCK 0, HAS_PROT 0, HAS_QOS 0, HAS_REGION 0, HAS_RRESP 1, HAS_WSTRB 1, ID_WIDTH 0, INSERT_VIP 0, MAX_BURST_LENGTH 1, NUM_READ_OUTSTANDING 8, NUM_READ_THREADS 4, NUM_WRITE_OUTSTANDING 8, NUM_WRITE_THREADS 4, PHASE 0.0, PROTOCOL AXI4LITE, READ_WRITE_MODE READ_WRITE, RUSER_BITS_PER_BYTE 0, RUSER_WIDTH 0, SUPPORTS_NARROW_BURST 0, WUSER_BITS_PER_BYTE 0, WUSER_WIDTH 0";
  attribute x_interface_info of SLOT_0_AXI_awaddr : signal is "xilinx.com:interface:aximm:1.0 SLOT_0_AXI AWADDR";
  attribute x_interface_info of SLOT_0_AXI_bresp : signal is "xilinx.com:interface:aximm:1.0 SLOT_0_AXI BRESP";
  attribute x_interface_info of SLOT_0_AXI_rdata : signal is "xilinx.com:interface:aximm:1.0 SLOT_0_AXI RDATA";
  attribute x_interface_info of SLOT_0_AXI_rresp : signal is "xilinx.com:interface:aximm:1.0 SLOT_0_AXI RRESP";
  attribute x_interface_info of SLOT_0_AXI_wdata : signal is "xilinx.com:interface:aximm:1.0 SLOT_0_AXI WDATA";
  attribute x_interface_info of SLOT_0_AXI_wstrb : signal is "xilinx.com:interface:aximm:1.0 SLOT_0_AXI WSTRB";
  attribute x_interface_info of SLOT_1_AXI_araddr : signal is "xilinx.com:interface:aximm:1.0 SLOT_1_AXI ARADDR";
  attribute x_interface_parameter of SLOT_1_AXI_araddr : signal is "XIL_INTERFACENAME SLOT_1_AXI, ADDR_WIDTH 64, ARUSER_WIDTH 0, AWUSER_WIDTH 0, BUSER_WIDTH 0, CLK_DOMAIN design_1_processing_system7_0_0_FCLK_CLK0, DATA_WIDTH 32, FREQ_HZ 100000000, HAS_BRESP 1, HAS_BURST 0, HAS_CACHE 1, HAS_LOCK 1, HAS_PROT 1, HAS_QOS 1, HAS_REGION 1, HAS_RRESP 1, HAS_WSTRB 1, ID_WIDTH 1, INSERT_VIP 0, MAX_BURST_LENGTH 256, NUM_READ_OUTSTANDING 16, NUM_READ_THREADS 1, NUM_WRITE_OUTSTANDING 16, NUM_WRITE_THREADS 1, PHASE 0.0, PROTOCOL AXI4, READ_WRITE_MODE READ_WRITE, RUSER_BITS_PER_BYTE 0, RUSER_WIDTH 0, SUPPORTS_NARROW_BURST 0, WUSER_BITS_PER_BYTE 0, WUSER_WIDTH 0";
  attribute x_interface_info of SLOT_1_AXI_arcache : signal is "xilinx.com:interface:aximm:1.0 SLOT_1_AXI ARCACHE";
  attribute x_interface_info of SLOT_1_AXI_arid : signal is "xilinx.com:interface:aximm:1.0 SLOT_1_AXI ARID";
  attribute x_interface_info of SLOT_1_AXI_arlen : signal is "xilinx.com:interface:aximm:1.0 SLOT_1_AXI ARLEN";
  attribute x_interface_info of SLOT_1_AXI_arlock : signal is "xilinx.com:interface:aximm:1.0 SLOT_1_AXI ARLOCK";
  attribute x_interface_info of SLOT_1_AXI_arprot : signal is "xilinx.com:interface:aximm:1.0 SLOT_1_AXI ARPROT";
  attribute x_interface_info of SLOT_1_AXI_arqos : signal is "xilinx.com:interface:aximm:1.0 SLOT_1_AXI ARQOS";
  attribute x_interface_info of SLOT_1_AXI_arregion : signal is "xilinx.com:interface:aximm:1.0 SLOT_1_AXI ARREGION";
  attribute x_interface_info of SLOT_1_AXI_arsize : signal is "xilinx.com:interface:aximm:1.0 SLOT_1_AXI ARSIZE";
  attribute x_interface_info of SLOT_1_AXI_awaddr : signal is "xilinx.com:interface:aximm:1.0 SLOT_1_AXI AWADDR";
  attribute x_interface_info of SLOT_1_AXI_awcache : signal is "xilinx.com:interface:aximm:1.0 SLOT_1_AXI AWCACHE";
  attribute x_interface_info of SLOT_1_AXI_awid : signal is "xilinx.com:interface:aximm:1.0 SLOT_1_AXI AWID";
  attribute x_interface_info of SLOT_1_AXI_awlen : signal is "xilinx.com:interface:aximm:1.0 SLOT_1_AXI AWLEN";
  attribute x_interface_info of SLOT_1_AXI_awlock : signal is "xilinx.com:interface:aximm:1.0 SLOT_1_AXI AWLOCK";
  attribute x_interface_info of SLOT_1_AXI_awprot : signal is "xilinx.com:interface:aximm:1.0 SLOT_1_AXI AWPROT";
  attribute x_interface_info of SLOT_1_AXI_awqos : signal is "xilinx.com:interface:aximm:1.0 SLOT_1_AXI AWQOS";
  attribute x_interface_info of SLOT_1_AXI_awregion : signal is "xilinx.com:interface:aximm:1.0 SLOT_1_AXI AWREGION";
  attribute x_interface_info of SLOT_1_AXI_awsize : signal is "xilinx.com:interface:aximm:1.0 SLOT_1_AXI AWSIZE";
  attribute x_interface_info of SLOT_1_AXI_bid : signal is "xilinx.com:interface:aximm:1.0 SLOT_1_AXI BID";
  attribute x_interface_info of SLOT_1_AXI_bresp : signal is "xilinx.com:interface:aximm:1.0 SLOT_1_AXI BRESP";
  attribute x_interface_info of SLOT_1_AXI_rdata : signal is "xilinx.com:interface:aximm:1.0 SLOT_1_AXI RDATA";
  attribute x_interface_info of SLOT_1_AXI_rid : signal is "xilinx.com:interface:aximm:1.0 SLOT_1_AXI RID";
  attribute x_interface_info of SLOT_1_AXI_rresp : signal is "xilinx.com:interface:aximm:1.0 SLOT_1_AXI RRESP";
  attribute x_interface_info of SLOT_1_AXI_wdata : signal is "xilinx.com:interface:aximm:1.0 SLOT_1_AXI WDATA";
  attribute x_interface_info of SLOT_1_AXI_wstrb : signal is "xilinx.com:interface:aximm:1.0 SLOT_1_AXI WSTRB";
begin
  Conn1_ARADDR(63 downto 0) <= SLOT_1_AXI_araddr(63 downto 0);
  Conn1_ARCACHE(3 downto 0) <= SLOT_1_AXI_arcache(3 downto 0);
  Conn1_ARID(0) <= SLOT_1_AXI_arid(0);
  Conn1_ARLEN(7 downto 0) <= SLOT_1_AXI_arlen(7 downto 0);
  Conn1_ARLOCK(0) <= SLOT_1_AXI_arlock(0);
  Conn1_ARPROT(2 downto 0) <= SLOT_1_AXI_arprot(2 downto 0);
  Conn1_ARQOS(3 downto 0) <= SLOT_1_AXI_arqos(3 downto 0);
  Conn1_ARREADY <= SLOT_1_AXI_arready;
  Conn1_ARREGION(3 downto 0) <= SLOT_1_AXI_arregion(3 downto 0);
  Conn1_ARSIZE(2 downto 0) <= SLOT_1_AXI_arsize(2 downto 0);
  Conn1_ARVALID <= SLOT_1_AXI_arvalid;
  Conn1_AWADDR(63 downto 0) <= SLOT_1_AXI_awaddr(63 downto 0);
  Conn1_AWCACHE(3 downto 0) <= SLOT_1_AXI_awcache(3 downto 0);
  Conn1_AWID(0) <= SLOT_1_AXI_awid(0);
  Conn1_AWLEN(7 downto 0) <= SLOT_1_AXI_awlen(7 downto 0);
  Conn1_AWLOCK(0) <= SLOT_1_AXI_awlock(0);
  Conn1_AWPROT(2 downto 0) <= SLOT_1_AXI_awprot(2 downto 0);
  Conn1_AWQOS(3 downto 0) <= SLOT_1_AXI_awqos(3 downto 0);
  Conn1_AWREADY <= SLOT_1_AXI_awready;
  Conn1_AWREGION(3 downto 0) <= SLOT_1_AXI_awregion(3 downto 0);
  Conn1_AWSIZE(2 downto 0) <= SLOT_1_AXI_awsize(2 downto 0);
  Conn1_AWVALID <= SLOT_1_AXI_awvalid;
  Conn1_BID(0) <= SLOT_1_AXI_bid(0);
  Conn1_BREADY <= SLOT_1_AXI_bready;
  Conn1_BRESP(1 downto 0) <= SLOT_1_AXI_bresp(1 downto 0);
  Conn1_BVALID <= SLOT_1_AXI_bvalid;
  Conn1_RDATA(31 downto 0) <= SLOT_1_AXI_rdata(31 downto 0);
  Conn1_RID(0) <= SLOT_1_AXI_rid(0);
  Conn1_RLAST <= SLOT_1_AXI_rlast;
  Conn1_RREADY <= SLOT_1_AXI_rready;
  Conn1_RRESP(1 downto 0) <= SLOT_1_AXI_rresp(1 downto 0);
  Conn1_RVALID <= SLOT_1_AXI_rvalid;
  Conn1_WDATA(31 downto 0) <= SLOT_1_AXI_wdata(31 downto 0);
  Conn1_WLAST <= SLOT_1_AXI_wlast;
  Conn1_WREADY <= SLOT_1_AXI_wready;
  Conn1_WSTRB(3 downto 0) <= SLOT_1_AXI_wstrb(3 downto 0);
  Conn1_WVALID <= SLOT_1_AXI_wvalid;
  Conn_ARADDR(6 downto 0) <= SLOT_0_AXI_araddr(6 downto 0);
  Conn_ARREADY <= SLOT_0_AXI_arready;
  Conn_ARVALID <= SLOT_0_AXI_arvalid;
  Conn_AWADDR(6 downto 0) <= SLOT_0_AXI_awaddr(6 downto 0);
  Conn_AWREADY <= SLOT_0_AXI_awready;
  Conn_AWVALID <= SLOT_0_AXI_awvalid;
  Conn_BREADY <= SLOT_0_AXI_bready;
  Conn_BRESP(1 downto 0) <= SLOT_0_AXI_bresp(1 downto 0);
  Conn_BVALID <= SLOT_0_AXI_bvalid;
  Conn_RDATA(31 downto 0) <= SLOT_0_AXI_rdata(31 downto 0);
  Conn_RREADY <= SLOT_0_AXI_rready;
  Conn_RRESP(1 downto 0) <= SLOT_0_AXI_rresp(1 downto 0);
  Conn_RVALID <= SLOT_0_AXI_rvalid;
  Conn_WDATA(31 downto 0) <= SLOT_0_AXI_wdata(31 downto 0);
  Conn_WREADY <= SLOT_0_AXI_wready;
  Conn_WSTRB(3 downto 0) <= SLOT_0_AXI_wstrb(3 downto 0);
  Conn_WVALID <= SLOT_0_AXI_wvalid;
  clk_1 <= clk;
  resetn_1 <= resetn;
g_inst: component bd_f60c_g_inst_0
     port map (
      aclk => clk_1,
      aresetn => resetn_1,
      m_slot_0_axi_ar_cnt(1 downto 0) => net_slot_0_axi_ar_cnt(1 downto 0),
      m_slot_0_axi_araddr(6 downto 0) => net_slot_0_axi_araddr(6 downto 0),
      m_slot_0_axi_arready => net_slot_0_axi_arready,
      m_slot_0_axi_arvalid => net_slot_0_axi_arvalid,
      m_slot_0_axi_aw_cnt(1 downto 0) => net_slot_0_axi_aw_cnt(1 downto 0),
      m_slot_0_axi_awaddr(6 downto 0) => net_slot_0_axi_awaddr(6 downto 0),
      m_slot_0_axi_awready => net_slot_0_axi_awready,
      m_slot_0_axi_awvalid => net_slot_0_axi_awvalid,
      m_slot_0_axi_b_cnt(1 downto 0) => net_slot_0_axi_b_cnt(1 downto 0),
      m_slot_0_axi_bready => net_slot_0_axi_bready,
      m_slot_0_axi_bresp(1 downto 0) => net_slot_0_axi_bresp(1 downto 0),
      m_slot_0_axi_bvalid => net_slot_0_axi_bvalid,
      m_slot_0_axi_r_cnt(1 downto 0) => net_slot_0_axi_r_cnt(1 downto 0),
      m_slot_0_axi_rdata(31 downto 0) => net_slot_0_axi_rdata(31 downto 0),
      m_slot_0_axi_rready => net_slot_0_axi_rready,
      m_slot_0_axi_rresp(1 downto 0) => net_slot_0_axi_rresp(1 downto 0),
      m_slot_0_axi_rvalid => net_slot_0_axi_rvalid,
      m_slot_0_axi_wdata(31 downto 0) => net_slot_0_axi_wdata(31 downto 0),
      m_slot_0_axi_wready => net_slot_0_axi_wready,
      m_slot_0_axi_wstrb(3 downto 0) => net_slot_0_axi_wstrb(3 downto 0),
      m_slot_0_axi_wvalid => net_slot_0_axi_wvalid,
      m_slot_1_axi_ar_cnt(1 downto 0) => net_slot_1_axi_ar_cnt(1 downto 0),
      m_slot_1_axi_araddr(63 downto 0) => net_slot_1_axi_araddr(63 downto 0),
      m_slot_1_axi_arcache(3 downto 0) => net_slot_1_axi_arcache(3 downto 0),
      m_slot_1_axi_arid(0) => net_slot_1_axi_arid(0),
      m_slot_1_axi_arlen(7 downto 0) => net_slot_1_axi_arlen(7 downto 0),
      m_slot_1_axi_arlock(0) => net_slot_1_axi_arlock(0),
      m_slot_1_axi_arprot(2 downto 0) => net_slot_1_axi_arprot(2 downto 0),
      m_slot_1_axi_arqos(3 downto 0) => net_slot_1_axi_arqos(3 downto 0),
      m_slot_1_axi_arready => net_slot_1_axi_arready,
      m_slot_1_axi_arregion(3 downto 0) => net_slot_1_axi_arregion(3 downto 0),
      m_slot_1_axi_arsize(2 downto 0) => net_slot_1_axi_arsize(2 downto 0),
      m_slot_1_axi_arvalid => net_slot_1_axi_arvalid,
      m_slot_1_axi_aw_cnt(1 downto 0) => net_slot_1_axi_aw_cnt(1 downto 0),
      m_slot_1_axi_awaddr(63 downto 0) => net_slot_1_axi_awaddr(63 downto 0),
      m_slot_1_axi_awcache(3 downto 0) => net_slot_1_axi_awcache(3 downto 0),
      m_slot_1_axi_awid(0) => net_slot_1_axi_awid(0),
      m_slot_1_axi_awlen(7 downto 0) => net_slot_1_axi_awlen(7 downto 0),
      m_slot_1_axi_awlock(0) => net_slot_1_axi_awlock(0),
      m_slot_1_axi_awprot(2 downto 0) => net_slot_1_axi_awprot(2 downto 0),
      m_slot_1_axi_awqos(3 downto 0) => net_slot_1_axi_awqos(3 downto 0),
      m_slot_1_axi_awready => net_slot_1_axi_awready,
      m_slot_1_axi_awregion(3 downto 0) => net_slot_1_axi_awregion(3 downto 0),
      m_slot_1_axi_awsize(2 downto 0) => net_slot_1_axi_awsize(2 downto 0),
      m_slot_1_axi_awvalid => net_slot_1_axi_awvalid,
      m_slot_1_axi_b_cnt(1 downto 0) => net_slot_1_axi_b_cnt(1 downto 0),
      m_slot_1_axi_bid(0) => net_slot_1_axi_bid(0),
      m_slot_1_axi_bready => net_slot_1_axi_bready,
      m_slot_1_axi_bresp(1 downto 0) => net_slot_1_axi_bresp(1 downto 0),
      m_slot_1_axi_bvalid => net_slot_1_axi_bvalid,
      m_slot_1_axi_r_cnt(1 downto 0) => net_slot_1_axi_r_cnt(1 downto 0),
      m_slot_1_axi_rdata(31 downto 0) => net_slot_1_axi_rdata(31 downto 0),
      m_slot_1_axi_rid(0) => net_slot_1_axi_rid(0),
      m_slot_1_axi_rlast => net_slot_1_axi_rlast,
      m_slot_1_axi_rready => net_slot_1_axi_rready,
      m_slot_1_axi_rresp(1 downto 0) => net_slot_1_axi_rresp(1 downto 0),
      m_slot_1_axi_rvalid => net_slot_1_axi_rvalid,
      m_slot_1_axi_wdata(31 downto 0) => net_slot_1_axi_wdata(31 downto 0),
      m_slot_1_axi_wlast => net_slot_1_axi_wlast,
      m_slot_1_axi_wready => net_slot_1_axi_wready,
      m_slot_1_axi_wstrb(3 downto 0) => net_slot_1_axi_wstrb(3 downto 0),
      m_slot_1_axi_wvalid => net_slot_1_axi_wvalid,
      slot_0_axi_araddr(6 downto 0) => Conn_ARADDR(6 downto 0),
      slot_0_axi_arready => Conn_ARREADY,
      slot_0_axi_arvalid => Conn_ARVALID,
      slot_0_axi_awaddr(6 downto 0) => Conn_AWADDR(6 downto 0),
      slot_0_axi_awready => Conn_AWREADY,
      slot_0_axi_awvalid => Conn_AWVALID,
      slot_0_axi_bready => Conn_BREADY,
      slot_0_axi_bresp(1 downto 0) => Conn_BRESP(1 downto 0),
      slot_0_axi_bvalid => Conn_BVALID,
      slot_0_axi_rdata(31 downto 0) => Conn_RDATA(31 downto 0),
      slot_0_axi_rready => Conn_RREADY,
      slot_0_axi_rresp(1 downto 0) => Conn_RRESP(1 downto 0),
      slot_0_axi_rvalid => Conn_RVALID,
      slot_0_axi_wdata(31 downto 0) => Conn_WDATA(31 downto 0),
      slot_0_axi_wready => Conn_WREADY,
      slot_0_axi_wstrb(3 downto 0) => Conn_WSTRB(3 downto 0),
      slot_0_axi_wvalid => Conn_WVALID,
      slot_1_axi_araddr(63 downto 0) => Conn1_ARADDR(63 downto 0),
      slot_1_axi_arcache(3 downto 0) => Conn1_ARCACHE(3 downto 0),
      slot_1_axi_arid(0) => Conn1_ARID(0),
      slot_1_axi_arlen(7 downto 0) => Conn1_ARLEN(7 downto 0),
      slot_1_axi_arlock(0) => Conn1_ARLOCK(0),
      slot_1_axi_arprot(2 downto 0) => Conn1_ARPROT(2 downto 0),
      slot_1_axi_arqos(3 downto 0) => Conn1_ARQOS(3 downto 0),
      slot_1_axi_arready => Conn1_ARREADY,
      slot_1_axi_arregion(3 downto 0) => Conn1_ARREGION(3 downto 0),
      slot_1_axi_arsize(2 downto 0) => Conn1_ARSIZE(2 downto 0),
      slot_1_axi_arvalid => Conn1_ARVALID,
      slot_1_axi_awaddr(63 downto 0) => Conn1_AWADDR(63 downto 0),
      slot_1_axi_awcache(3 downto 0) => Conn1_AWCACHE(3 downto 0),
      slot_1_axi_awid(0) => Conn1_AWID(0),
      slot_1_axi_awlen(7 downto 0) => Conn1_AWLEN(7 downto 0),
      slot_1_axi_awlock(0) => Conn1_AWLOCK(0),
      slot_1_axi_awprot(2 downto 0) => Conn1_AWPROT(2 downto 0),
      slot_1_axi_awqos(3 downto 0) => Conn1_AWQOS(3 downto 0),
      slot_1_axi_awready => Conn1_AWREADY,
      slot_1_axi_awregion(3 downto 0) => Conn1_AWREGION(3 downto 0),
      slot_1_axi_awsize(2 downto 0) => Conn1_AWSIZE(2 downto 0),
      slot_1_axi_awvalid => Conn1_AWVALID,
      slot_1_axi_bid(0) => Conn1_BID(0),
      slot_1_axi_bready => Conn1_BREADY,
      slot_1_axi_bresp(1 downto 0) => Conn1_BRESP(1 downto 0),
      slot_1_axi_bvalid => Conn1_BVALID,
      slot_1_axi_rdata(31 downto 0) => Conn1_RDATA(31 downto 0),
      slot_1_axi_rid(0) => Conn1_RID(0),
      slot_1_axi_rlast => Conn1_RLAST,
      slot_1_axi_rready => Conn1_RREADY,
      slot_1_axi_rresp(1 downto 0) => Conn1_RRESP(1 downto 0),
      slot_1_axi_rvalid => Conn1_RVALID,
      slot_1_axi_wdata(31 downto 0) => Conn1_WDATA(31 downto 0),
      slot_1_axi_wlast => Conn1_WLAST,
      slot_1_axi_wready => Conn1_WREADY,
      slot_1_axi_wstrb(3 downto 0) => Conn1_WSTRB(3 downto 0),
      slot_1_axi_wvalid => Conn1_WVALID
    );
ila_lib: component bd_f60c_ila_lib_0
     port map (
      clk => clk_1,
      probe0(1 downto 0) => net_slot_0_axi_ar_cnt(1 downto 0),
      probe1(6 downto 0) => net_slot_0_axi_araddr(6 downto 0),
      probe10(3 downto 0) => net_slot_0_axi_wstrb(3 downto 0),
      probe11(1 downto 0) => net_slot_0_axi_aw_ctrl(1 downto 0),
      probe12(1 downto 0) => net_slot_0_axi_w_ctrl(1 downto 0),
      probe13(1 downto 0) => net_slot_0_axi_b_ctrl(1 downto 0),
      probe14(1 downto 0) => net_slot_0_axi_ar_ctrl(1 downto 0),
      probe15(1 downto 0) => net_slot_0_axi_r_ctrl(1 downto 0),
      probe16(1 downto 0) => net_slot_1_axi_ar_cnt(1 downto 0),
      probe17(63 downto 0) => net_slot_1_axi_araddr(63 downto 0),
      probe18(3 downto 0) => net_slot_1_axi_arcache(3 downto 0),
      probe19(0) => net_slot_1_axi_arid(0),
      probe2(1 downto 0) => net_slot_0_axi_aw_cnt(1 downto 0),
      probe20(7 downto 0) => net_slot_1_axi_arlen(7 downto 0),
      probe21(0) => net_slot_1_axi_arlock(0),
      probe22(2 downto 0) => net_slot_1_axi_arprot(2 downto 0),
      probe23(3 downto 0) => net_slot_1_axi_arqos(3 downto 0),
      probe24(3 downto 0) => net_slot_1_axi_arregion(3 downto 0),
      probe25(2 downto 0) => net_slot_1_axi_arsize(2 downto 0),
      probe26(1 downto 0) => net_slot_1_axi_aw_cnt(1 downto 0),
      probe27(63 downto 0) => net_slot_1_axi_awaddr(63 downto 0),
      probe28(3 downto 0) => net_slot_1_axi_awcache(3 downto 0),
      probe29(0) => net_slot_1_axi_awid(0),
      probe3(6 downto 0) => net_slot_0_axi_awaddr(6 downto 0),
      probe30(7 downto 0) => net_slot_1_axi_awlen(7 downto 0),
      probe31(0) => net_slot_1_axi_awlock(0),
      probe32(2 downto 0) => net_slot_1_axi_awprot(2 downto 0),
      probe33(3 downto 0) => net_slot_1_axi_awqos(3 downto 0),
      probe34(3 downto 0) => net_slot_1_axi_awregion(3 downto 0),
      probe35(2 downto 0) => net_slot_1_axi_awsize(2 downto 0),
      probe36(1 downto 0) => net_slot_1_axi_b_cnt(1 downto 0),
      probe37(0) => net_slot_1_axi_bid(0),
      probe38(1 downto 0) => net_slot_1_axi_bresp(1 downto 0),
      probe39(1 downto 0) => net_slot_1_axi_r_cnt(1 downto 0),
      probe4(1 downto 0) => net_slot_0_axi_b_cnt(1 downto 0),
      probe40(31 downto 0) => net_slot_1_axi_rdata(31 downto 0),
      probe41(0) => net_slot_1_axi_rid(0),
      probe42(1 downto 0) => net_slot_1_axi_rresp(1 downto 0),
      probe43(31 downto 0) => net_slot_1_axi_wdata(31 downto 0),
      probe44(3 downto 0) => net_slot_1_axi_wstrb(3 downto 0),
      probe45(1 downto 0) => net_slot_1_axi_aw_ctrl(1 downto 0),
      probe46(2 downto 0) => net_slot_1_axi_w_ctrl(2 downto 0),
      probe47(1 downto 0) => net_slot_1_axi_b_ctrl(1 downto 0),
      probe48(1 downto 0) => net_slot_1_axi_ar_ctrl(1 downto 0),
      probe49(2 downto 0) => net_slot_1_axi_r_ctrl(2 downto 0),
      probe5(1 downto 0) => net_slot_0_axi_bresp(1 downto 0),
      probe6(1 downto 0) => net_slot_0_axi_r_cnt(1 downto 0),
      probe7(31 downto 0) => net_slot_0_axi_rdata(31 downto 0),
      probe8(1 downto 0) => net_slot_0_axi_rresp(1 downto 0),
      probe9(31 downto 0) => net_slot_0_axi_wdata(31 downto 0)
    );
slot_0_ar: component bd_f60c_slot_0_ar_0
     port map (
      In0(0) => net_slot_0_axi_arvalid,
      In1(0) => net_slot_0_axi_arready,
      dout(1 downto 0) => net_slot_0_axi_ar_ctrl(1 downto 0)
    );
slot_0_aw: component bd_f60c_slot_0_aw_0
     port map (
      In0(0) => net_slot_0_axi_awvalid,
      In1(0) => net_slot_0_axi_awready,
      dout(1 downto 0) => net_slot_0_axi_aw_ctrl(1 downto 0)
    );
slot_0_b: component bd_f60c_slot_0_b_0
     port map (
      In0(0) => net_slot_0_axi_bvalid,
      In1(0) => net_slot_0_axi_bready,
      dout(1 downto 0) => net_slot_0_axi_b_ctrl(1 downto 0)
    );
slot_0_r: component bd_f60c_slot_0_r_0
     port map (
      In0(0) => net_slot_0_axi_rvalid,
      In1(0) => net_slot_0_axi_rready,
      dout(1 downto 0) => net_slot_0_axi_r_ctrl(1 downto 0)
    );
slot_0_w: component bd_f60c_slot_0_w_0
     port map (
      In0(0) => net_slot_0_axi_wvalid,
      In1(0) => net_slot_0_axi_wready,
      dout(1 downto 0) => net_slot_0_axi_w_ctrl(1 downto 0)
    );
slot_1_ar: component bd_f60c_slot_1_ar_0
     port map (
      In0(0) => net_slot_1_axi_arvalid,
      In1(0) => net_slot_1_axi_arready,
      dout(1 downto 0) => net_slot_1_axi_ar_ctrl(1 downto 0)
    );
slot_1_aw: component bd_f60c_slot_1_aw_0
     port map (
      In0(0) => net_slot_1_axi_awvalid,
      In1(0) => net_slot_1_axi_awready,
      dout(1 downto 0) => net_slot_1_axi_aw_ctrl(1 downto 0)
    );
slot_1_b: component bd_f60c_slot_1_b_0
     port map (
      In0(0) => net_slot_1_axi_bvalid,
      In1(0) => net_slot_1_axi_bready,
      dout(1 downto 0) => net_slot_1_axi_b_ctrl(1 downto 0)
    );
slot_1_r: component bd_f60c_slot_1_r_0
     port map (
      In0(0) => net_slot_1_axi_rvalid,
      In1(0) => net_slot_1_axi_rready,
      In2(0) => net_slot_1_axi_rlast,
      dout(2 downto 0) => net_slot_1_axi_r_ctrl(2 downto 0)
    );
slot_1_w: component bd_f60c_slot_1_w_0
     port map (
      In0(0) => net_slot_1_axi_wvalid,
      In1(0) => net_slot_1_axi_wready,
      In2(0) => net_slot_1_axi_wlast,
      dout(2 downto 0) => net_slot_1_axi_w_ctrl(2 downto 0)
    );
end STRUCTURE;
