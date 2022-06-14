----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 27.04.2022 10:30:55
-- Design Name: 
-- Module Name: test - Behavioral
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

entity test is
    Port ( x : in STD_LOGIC_VECTOR (3 downto 0);
           an_in : in STD_LOGIC_VECTOR (3 downto 0);
           g_to_a : out STD_LOGIC_VECTOR (6 downto 0);
           an : out STD_LOGIC_VECTOR (3 downto 0));
end test;

architecture Behavioral of test is

begin

process(x)
begin
    case x is
        when "0000"   => g_to_a   <= "100000";
        when "0001"   => g_to_a   <= "100000";
        when "0010"   => g_to_a   <= "100000";
        when "0011"   => g_to_a   <= "100000";
        when "0100"   => g_to_a   <= "100000";
        when "0101"   => g_to_a   <= "100000";
        when "0110"   => g_to_a   <= "100000";
        when "0111"   => g_to_a   <= "100000";
        when "1000"   => g_to_a   <= "100000";
        when "1001"   => g_to_a   <= "100000";
        when "1010"   => g_to_a   <= "100000";
        when "1011"   => g_to_a   <= "100000";
        when "1100"   => g_to_a   <= "100000";
        when "1101"   => g_to_a   <= "100000";
        when "1110"   => g_to_a   <= "100000";
    end case;
    
end process;

an <= an_in;

end Behavioral;
