----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 21.06.2022 14:57:30
-- Design Name: 
-- Module Name: decoder_tb - Behavioral
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

entity decoder_tb is
--  Port ( );
end decoder_tb;

architecture Behavioral of decoder_tb is

component decoder is
    Port ( seg : out STD_LOGIC_VECTOR (6 downto 0);
           an : out STD_LOGIC_VECTOR (3 downto 0);
           Bin : in STD_LOGIC_VECTOR (3 downto 0));
end component decoder;

Signal seg_sig : STD_LOGIC_VECTOR (6 downto 0);
Signal an_sig : STD_LOGIC_VECTOR (3 downto 0);
Signal Bin_sig : STD_LOGIC_VECTOR (3 downto 0) := "0000";

begin

UUT : decoder
Port map(seg => seg_sig, an => an_sig, Bin => Bin_sig);

Process begin
    wait for 100 ns;

    for i in 0 to 15 loop
        Bin_sig <= Bin_sig + 1;
    end loop;
end process;



end Behavioral;
