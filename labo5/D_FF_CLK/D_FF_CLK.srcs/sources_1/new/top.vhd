----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 18.06.2022 15:57:23
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
    Port ( CLK : in STD_LOGIC;
           CLR : in STD_LOGIC;
           d : in STD_LOGIC;
           q : out STD_LOGIC;
           clk_slow : out STD_LOGIC;
           div : in STD_LOGIC_VECTOR (1 downto 0));
end top;

architecture Behavioral of top is

component DFF is
    Port (  CLK : in STD_LOGIC;
            CLR : in STD_LOGIC;
            d : in STD_LOGIC;
            q : out STD_LOGIC);
end component DFF;

component clock_divider is
    Port (  CLK : in STD_LOGIC;
            div : in STD_LOGIC_VECTOR (1 downto 0);
            CLK_SLOW : out STD_LOGIC);
end component clock_divider;

Signal CLK_slow_sig : std_logic;

begin

DFF1 : DFF
Port map (CLK => CLK_slow_sig, CLR => CLR, d => d, q => q);

CLK_DIV : clock_divider
Port map (CLK => CLK, div => div, CLK_SLOW => CLK_slow_sig);

clk_slow <= CLK_slow_sig;

end Behavioral;
