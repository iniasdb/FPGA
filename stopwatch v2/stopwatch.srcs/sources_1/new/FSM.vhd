----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 19.06.2022 03:00:16
-- Design Name: 
-- Module Name: FSM - Behavioral
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

entity FSM is
    Port ( clk : in STD_LOGIC;
           an : out STD_LOGIC_VECTOR (3 downto 0);
           to_mux : out STD_LOGIC_VECTOR (1 downto 0));
end FSM;

architecture Behavioral of FSM is

Signal i : integer range 0 to  2 := 0;

begin

an(3) <= '1';

process (clk) begin
    if rising_edge(clk) then
        if i = 0 then
            an(0) <= '0';
            an(1) <= '1';
            an(2) <= '1';
            to_mux <= "00";
            i <= 1;
        elsif i = 1 then
            an(0) <= '1';
            an(1) <= '0';
            an(2) <= '1';
            to_mux <= "01";
            i <= 2;
        elsif i = 2 then
            an(0) <= '1';
            an(1) <= '1';
            an(2) <= '0';
            to_mux <= "10";
            i <= 0;
        end if;
    end if;
    
    if rising_edge(clk) then
        if i = 0 then
            an(0) <= '0';
            an(1) <= '1';
            an(2) <= '1';
            to_mux <= "00";
            i <= 1;
        elsif i = 1 then
            an(0) <= '1';
            an(1) <= '0';
            an(2) <= '1';
            to_mux <= "01";
            i <= 2;
        elsif i = 2 then
            an(0) <= '1';
            an(1) <= '1';
            an(2) <= '0';
            to_mux <= "10";
            i <= 0;
        end if;
    end if;
    end process;
        
end Behavioral;
