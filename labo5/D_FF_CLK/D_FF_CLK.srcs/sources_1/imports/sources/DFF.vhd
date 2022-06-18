----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 20.04.2022 10:32:49
-- Design Name: 
-- Module Name: DFF - Behavioral
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

entity DFF is
    Port ( clk : in STD_LOGIC;
           D : in STD_LOGIC;
           clr : in STD_LOGIC;
           q : out STD_LOGIC);
end DFF;

architecture Behavioral of DFF is

begin
process (clk, clr) begin

if(clr = '1') then
    q <= '0';
elsif(rising_edge(clk)) then
    q <= D;
end if;
   
end process;

end Behavioral;
