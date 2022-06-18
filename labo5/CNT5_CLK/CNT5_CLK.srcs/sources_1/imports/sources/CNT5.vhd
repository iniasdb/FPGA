----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 18.06.2022 21:04:49
-- Design Name: 
-- Module Name: CNT5 - Behavioral
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

entity CNT5 is
    Port ( clk : in STD_LOGIC;
           rst : in STD_LOGIC;
           en : in STD_LOGIC;
           co : out STD_LOGIC;
           count : out STD_LOGIC_VECTOR (2 downto 0));
end CNT5;

architecture Behavioral of CNT5 is

Signal count_sig : STD_LOGIC_VECTOR (2 downto 0);

begin

process (clk, rst) begin
    if rst = '1' then
        count_sig <= "000";
    elsif rising_edge(clk) and en = '1' then
        count_sig <= count_sig + 1;
        if count_sig = "100" then
            count_sig <= "000";
        end if;
    end if;
end process;

count <= count_sig;
co <= count_sig(2) and count_sig(0);

end Behavioral;
