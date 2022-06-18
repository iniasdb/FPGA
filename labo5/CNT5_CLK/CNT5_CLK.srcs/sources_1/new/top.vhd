----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 18.06.2022 21:14:05
-- Design Name: 
-- Module Name: top - Behavioral
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

entity top is
    Port ( clk : in STD_LOGIC;
           rst : in STD_LOGIC;
           en : in STD_LOGIC;
           co : out STD_LOGIC;
           count : out STD_LOGIC_VECTOR (2 downto 0);
           div : in STD_LOGIC_VECTOR (1 downto 0);
           clk_slow : out STD_LOGIC);
end top;

architecture Behavioral of top is

component clock_divider is
    Port ( clk : in STD_LOGIC;
           div : in STD_LOGIC_VECTOR (1 downto 0);
           clk_slow : out STD_LOGIC);
end component clock_divider;

component CNT5 is
    Port ( clk : in STD_LOGIC;
           rst : in STD_LOGIC;
           en : in STD_LOGIC;
           co : out STD_LOGIC;
           count : out STD_LOGIC_VECTOR (2 downto 0));
end component CNT5;

Signal clk_slow_sig : STD_LOGIC;

begin

CLK_DIV: clock_divider
Port map(clk => clk, div => div, clk_slow => clk_slow_sig);

CNT_5 : CNT5
Port map(clk => clk_slow_sig, rst => rst, en => en, co => co, count => count);

clk_slow <= clk_slow_sig;

end Behavioral;
