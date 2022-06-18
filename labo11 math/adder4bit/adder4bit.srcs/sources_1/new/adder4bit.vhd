----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 17.06.2022 18:21:44
-- Design Name: 
-- Module Name: adder4bit - Behavioral
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
use IEEE.numeric_std.all;
use IEEE.std_logic_unsigned.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity adder4bit is
    Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
           B : in STD_LOGIC_VECTOR (3 downto 0);
           S : out STD_LOGIC_VECTOR (3 downto 0);
           Ci : in STD_LOGIC;
           Co : out STD_LOGIC);
end adder4bit;

architecture Behavioral of adder4bit is

Signal A_sig : STD_LOGIC_VECTOR (4 downto 0);
Signal B_sig : STD_LOGIC_VECTOR (4 downto 0);
Signal Ci_sig : STD_LOGIC_VECTOR (4 downto 0);
Signal S_sig : STD_LOGIC_VECTOR (4 downto 0);

begin

A_sig <= '0' & A;
B_sig <= '0' & B;
Ci_sig <= "0000" & Ci;

S_sig <= A_sig + B_sig + Ci_sig;

S <= S_sig (3 downto 0);
Co <= S_sig(4);

end Behavioral;
