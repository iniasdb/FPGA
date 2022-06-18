----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 17.06.2022 20:45:05
-- Design Name: 
-- Module Name: shift_register4bit - Behavioral
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

entity shift_register4bit is
    Port ( clk : in STD_LOGIC;
           clr : in STD_LOGIC;
           data_in : in STD_LOGIC;
           q : out STD_LOGIC_VECTOR (3 downto 0));
end shift_register4bit;

architecture Behavioral of shift_register4bit is

Signal qs : STD_LOGIC_VECTOR (3 downto 0);

begin

    process (clk, clr)
    begin
    
        if clr='1' then
            qs <= "0000";
        elsif clk'event and clk='1' then
            qs(3) <= data_in;
            qs(2 downto 0) <= qs(3 downto 1);
        end if;
    
    end process;
q <= qs;


end Behavioral;
