----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 14.06.2022 17:18:26
-- Design Name: 
-- Module Name: decoder8_3 - Behavioral
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
use IEEE.std_logic_arith.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity decoder8_3 is
    Port ( sw : in STD_LOGIC_VECTOR (7 downto 0);
           led : out STD_LOGIC_VECTOR (2 downto 0));
end decoder8_3;

architecture Behavioral of decoder8_3 is

begin

process(sw)
variable j: integer;
begin

led <= "000";

for j in 0 to 7 loop
    if sw(j) = '1' then
        led <= conv_std_logic_vector(j, 3);
    end if;
end loop;
end process;

end Behavioral;
