----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 14.06.2022 17:52:02
-- Design Name: 
-- Module Name: bcd_7seg - Behavioral
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

entity bcd_7seg is
    Port ( seg : out STD_LOGIC_VECTOR (6 downto 0);
           an : out STD_LOGIC_VECTOR (3 downto 0);
           bin : in STD_LOGIC_VECTOR (3 downto 0);
           an_in : in STD_LOGIC_VECTOR (3 downto 0));
end bcd_7seg;

architecture Behavioral of bcd_7seg is

begin

Process(bin) begin
   case (bin) is
      when "0000" => seg <= "1000000";
      when "0001" => seg <= "1111001";
      when "0010" => seg <= "0100100";
      when "0011" => seg <= "0110000";
      when "0100" => seg <= "0011001";
      when "0101" => seg <= "0010010";
      when "0110" => seg <= "0000010";
      when "0111" => seg <= "1111000";
      when "1000" => seg <= "0000000";
      when "1001" => seg <= "0011000";
      when others => seg <= "1111111";
   end case;

end process;
an <= an_in;

end Behavioral;
