----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 21.06.2022 14:09:09
-- Design Name: 
-- Module Name: CNT - Behavioral
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
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use IEEE.std_logic_unsigned.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity CNT is
    Port ( clk : in STD_LOGIC;
           rst : in STD_LOGIC;
           en : in STD_LOGIC;
           count : out STD_LOGIC_VECTOR (3 downto 0));
end CNT;

architecture Behavioral of CNT is

Signal count_sig : STD_LOGIC_VECTOR (3 downto 0);

begin

process (clk, rst) begin
    if rst = '1' then
        count_sig <= "0000";
    elsif rising_edge(clk) and en = '1' then
        count_sig <= count_sig + 1;
        if count_sig = "1011" then
            count_sig <= "0000";
        end if;
    end if;
end process;
count <= count_sig;

end Behavioral;
