----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 21.06.2022 14:09:09
-- Design Name: 
-- Module Name: decoder - Behavioral
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

entity decoder is
    Port ( seg : out STD_LOGIC_VECTOR (6 downto 0);
           an : out STD_LOGIC_VECTOR (3 downto 0);
           Bin : in STD_LOGIC_VECTOR (3 downto 0));
end decoder;

architecture Behavioral of decoder is

    type state_type is (S1, S2, S3, S4, S5, S6, S7);

    signal state : state_type := S1;

begin

process(Bin) begin

   case (Bin) is
      when "0000" => state <= S1;
      when "1100" => state <= S1;
      when "0001" => state <= S2;
      when "1011" => state <= S2;
      when "0010" => state <= S3;
      when "1010" => state <= S3;
      when "0011" => state <= S4;
      when "1001" => state <= S4;
      when "0100" => state <= S5;
      when "1000" => state <= S5;
      when "0101" => state <= S6;
      when "0111" => state <= S6;
      when "0110" => state <= S7;
      when others => null;


   end case;

end process;

process (state) begin

    case (state) is
        when S1 =>
            seg <= "0000000";
            an <= "1110";
        when S2 =>
            seg <= "0100011";
            an <= "1100";
        when S3 =>
            seg <= "0000000";
            an <= "1101";
        when S4 =>
            seg <= "0100011";
            an <= "1001";
        when S5 =>
            seg <= "0000000";
            an <= "1011";
        when S6 =>
            seg <= "0100011";
            an <= "0011";
        when S7 =>
            seg <= "0000000";
            an <= "0111";
        when others => null;
    end case;

end process;


end Behavioral;
