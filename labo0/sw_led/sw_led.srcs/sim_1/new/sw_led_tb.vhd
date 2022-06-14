----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 14.06.2022 14:49:26
-- Design Name: 
-- Module Name: sw_led_tb2 - Behavioral
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

entity sw_led_tb is
--  Port ( );
end sw_led_tb;

architecture Behavioral of sw_led_tb2 is

component sw_led is
    Port ( sw : in STD_LOGIC_VECTOR (3 downto 0);
           led : out STD_LOGIC_VECTOR (3 downto 0));
end component sw_led;

signal sw: std_logic_vector (3 downto 0):="0000";
signal led: std_logic_vector (3 downto 0);

begin

UUT: sw_led
Port map(sw => sw, led => led);

process begin


for i in 0 to 20 loop
    wait for 100 ns;
    sw <= sw+1;
end loop;

end process;

end Behavioral;
