-- Copyright 1986-2015 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2015.4 (win64) Build 1412921 Wed Nov 18 09:43:45 MST 2015
-- Date        : Wed Jan 18 10:20:48 2017
-- Host        : MANTA-RAY running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub
--               c:/SUNNY2/LMAC3-vc709-2015-4/hardware/LMAC3-vc7-9-2015-4/LMAC3-vc7-9-2015-4.srcs/sources_1/ip/br_pre_ctrl_fifo_ip_1024x40/br_pre_ctrl_fifo_ip_1024x40_stub.vhdl
-- Design      : br_pre_ctrl_fifo_ip_1024x40
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7vx690tffg1761-2
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity br_pre_ctrl_fifo_ip_1024x40 is
  Port ( 
    clk : in STD_LOGIC;
    srst : in STD_LOGIC;
    din : in STD_LOGIC_VECTOR ( 39 downto 0 );
    wr_en : in STD_LOGIC;
    rd_en : in STD_LOGIC;
    dout : out STD_LOGIC_VECTOR ( 39 downto 0 );
    full : out STD_LOGIC;
    empty : out STD_LOGIC;
    data_count : out STD_LOGIC_VECTOR ( 9 downto 0 )
  );

end br_pre_ctrl_fifo_ip_1024x40;

architecture stub of br_pre_ctrl_fifo_ip_1024x40 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "clk,srst,din[39:0],wr_en,rd_en,dout[39:0],full,empty,data_count[9:0]";
attribute x_core_info : string;
attribute x_core_info of stub : architecture is "fifo_generator_v13_0_1,Vivado 2015.4";
begin
end;
