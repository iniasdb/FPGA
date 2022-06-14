----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 14.06.2022 16:40:43
-- Design Name: 
-- Module Name: decoder3_8 - Behavioral
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

entity decoder3_8 is
    Port ( sw : in STD_LOGIC_VECTOR (2 downto 0);
           led : out STD_LOGIC_VECTOR (7 downto 0));
end decoder3_8;

architecture Behavioral of decoder3_8 is

begin

process(sw) begin

case (sw) is
  when "000" => led <= "00000001";
  when "001" => led <= "00000010";
  when "010" => led <= "00000100";
  when "011" => led <= "00001000";
  when "100" => led <= "00010000";
  when "101" => led <= "00100000";
  when "110" => led <= "01000000";  
  when "111" => led <= "10000000";
  when others =>
 led <= "00000000";
end case;
   
end process;


end Behavioral;
