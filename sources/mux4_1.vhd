----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 23.02.2022 11:26:45
-- Design Name: 
-- Module Name: mux4_1 - Behavioral
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

entity mux4_1 is
    Port ( d : in STD_LOGIC_VECTOR (3 downto 0);
           a : in STD_LOGIC_VECTOR (1 downto 0);
           z : out STD_LOGIC);
end mux4_1;

architecture Behavioral of mux4_1 is

begin

process (d,a)
begin
      case (a) is
      when "00" =>
         z <= d(0);
      when "01" =>
         z <= d(1);
      when "10" =>
         z <= d(2);
      when "11" =>
         z <= d(3);
      when others =>
      z <= d(0);
   end case;
end process;
			
end Behavioral;
