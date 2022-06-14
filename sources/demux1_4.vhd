----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 13.06.2022 21:36:10
-- Design Name: 
-- Module Name: demux1_4 - Behavioral
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

entity demux1_4 is
    Port ( y : in STD_LOGIC;
           a : in STD_LOGIC_VECTOR (1 downto 0);
           z : out STD_LOGIC_VECTOR (3 downto 0));
end demux1_4;

architecture Behavioral of demux1_4 is

begin

p1: process (y,a)
begin
      case (a) is
      when "00" => z <= 'Z'&'Z'&'Z'&y;
      when "01" => z <= 'Z'&'Z'&y&'Z';
      when "10" => z <= 'Z'&y&'Z'&'Z';
      when "11" => z <= y&'Z'&'Z'&'Z';
      when others => z <= 'Z'&'Z'&'Z'&'Z';
   end case;
end process;

end Behavioral;
