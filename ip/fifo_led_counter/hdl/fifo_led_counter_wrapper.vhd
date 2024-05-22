--Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2021.1 (win64) Build 3247384 Thu Jun 10 19:36:33 MDT 2021
--Date        : Wed May 22 14:11:14 2024
--Host        : LAPTOP-N26RM7D0 running 64-bit major release  (build 9200)
--Command     : generate_target fifo_led_counter_wrapper.bd
--Design      : fifo_led_counter_wrapper
--Purpose     : IP block netlist
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity fifo_led_counter_wrapper is
  port (
    LED : out STD_LOGIC_VECTOR ( 7 downto 0 )
  );
end fifo_led_counter_wrapper;

architecture STRUCTURE of fifo_led_counter_wrapper is
  component fifo_led_counter is
  port (
    LED : out STD_LOGIC_VECTOR ( 7 downto 0 )
  );
  end component fifo_led_counter;
begin
fifo_led_counter_i: component fifo_led_counter
     port map (
      LED(7 downto 0) => LED(7 downto 0)
    );
end STRUCTURE;
