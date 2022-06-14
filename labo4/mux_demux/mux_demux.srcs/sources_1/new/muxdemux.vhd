----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 14.06.2022 12:42:05
-- Design Name: 
-- Module Name: muxdemux - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity muxdemux is
    Port ( D : in STD_LOGIC_VECTOR (3 downto 0);
           Z : out STD_LOGIC_VECTOR (3 downto 0);
           A : in STD_LOGIC_VECTOR (1 downto 0));
end muxdemux;

architecture Behavioral of muxdemux is

component mux4_1 is
    Port ( d : in STD_LOGIC_VECTOR (3 downto 0);
           a : in STD_LOGIC_VECTOR (1 downto 0);
           z : out STD_LOGIC);
end component mux4_1;

component demux1_4 is
    Port ( y : in STD_LOGIC;
           a : in STD_LOGIC_VECTOR (1 downto 0);
           z : out STD_LOGIC_VECTOR (3 downto 0));
end component demux1_4;

signal y_sig: STD_LOGIC;

begin

Mux1: mux4_1
Port map (d => D, a => A, z => y_sig);

Demux1: demux1_4
Port map (y => y_sig, a => A, z => Z);

end Behavioral;
