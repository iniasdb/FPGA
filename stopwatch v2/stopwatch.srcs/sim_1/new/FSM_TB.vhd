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

entity FSM_TB is
    Port ( clk : in STD_LOGIC;
           an : in STD_LOGIC_VECTOR (3 downto 0));
end FSM_TB;

architecture Behavioral of FSM_TB is

component FSM is
    Port ( clk : in STD_LOGIC;
           clk_out : out STD_LOGIC;
           an_out : out STD_LOGIC_VECTOR (2 downto 0));
end component FSM;

Signal clk_out : STD_LOGIC;
Signal an_out : STD_LOGIC_VECTOR (3 downto 0);

begin

UUT : FSM
Port map(clk => clk_out, an_out => an_out);

stim_process : process begin
for i in 0 to 6 loop
    wait for 100 ns;
    if clk_out = '0' then
        clk_out <= '1';
    else
        clk_out <= '0';
    end if;
end loop;

wait;

end process;

end Behavioral;
