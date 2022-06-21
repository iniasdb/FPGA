----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 19.06.2022 03:19:19
-- Design Name: 
-- Module Name: FSM_TB - Behavioral
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

entity top_TB is
end top_TB;

architecture Behavioral of top_TB is

component top is
    Port ( clk : in STD_LOGIC;
           rst : in STD_LOGIC;
           seg : out STD_LOGIC_VECTOR (6 downto 0);
           an : out STD_LOGIC_VECTOR (3 downto 0);
           s : in STD_LOGIC);
end component top;

Signal clk : STD_LOGIC := '1';
Signal rst : STD_LOGIC := '0';
Signal seg : STD_LOGIC_VECTOR (6 downto 0);
Signal an : STD_LOGIC_VECTOR (3 downto 0);
Signal s : STD_LOGIC := '1';

begin

UUT : top
Port map(clk => clk, rst => rst, seg => seg, an => an, s => s);

stim_process : process begin
clk <= not clk after 10 ns;

end process;

end Behavioral;
