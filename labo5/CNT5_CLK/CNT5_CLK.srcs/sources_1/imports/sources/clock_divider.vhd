----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 18.06.2022 15:20:13
-- Design Name: 
-- Module Name: clock_divider - Behavioral
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

entity clock_divider is
    Port ( clk : in STD_LOGIC;
           div : in STD_LOGIC_VECTOR (1 downto 0);
           clk_slow : out STD_LOGIC);
end clock_divider;

architecture Behavioral of clock_divider is

Signal i : integer range 0 to  50000000 := 0;
Signal int_clk : std_logic := '0';
Signal base : integer range 0 to  50000000 := 50000000;

begin
process (clk, div) begin
    if rising_edge(clk) then
        i <= i+1;
        if (i = base) then
            i <= 0;
            int_clk <= not int_clk;
        end if;
        case (div) is
            when "00" => base <= 50000000;
            when "01" => base <= 25000000;
            when "10" => base <= 5000000;
            when others => base <= 500000;
        end case;
    end if;
end process;

clk_slow <= int_clk;

end Behavioral;
