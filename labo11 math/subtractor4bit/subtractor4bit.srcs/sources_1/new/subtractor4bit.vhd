----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 17.06.2022 18:39:31
-- Design Name: 
-- Module Name: subtractor4bit - Behavioral
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

entity subtractor4bit is
    Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
           B : in STD_LOGIC_VECTOR (3 downto 0);
           Ci : in STD_LOGIC;
           S : out STD_LOGIC_VECTOR (3 downto 0);
           Co : out STD_LOGIC);
end subtractor4bit;

architecture Behavioral of subtractor4bit is

component adder4bit is
    Port ( a : in STD_LOGIC_VECTOR (3 downto 0);
           b : in STD_LOGIC_VECTOR (3 downto 0);
           s : out STD_LOGIC_VECTOR (3 downto 0);
           ci : in STD_LOGIC;
           co : out STD_LOGIC);
end component adder4bit;

Signal B_inverted : STD_LOGIC_VECTOR (3 downto 0);

begin

B_inverted <= not B;

adder: adder4bit
Port map (a => A, b => B_inverted, s => S, ci => '1', co => Co);

end Behavioral;
