----------------------------------------------------------------------------------
-- Company:  
-- Engineer: Inias De FUCKING Belder
-- 
-- Create Date: 18.06.2022 21:48:02
-- Design Name: Stopwatch
-- Module Name: top - Behavioral
-- Project Name: Stopwatch
-- Target Devices: ARTIX7
-- Tool Versions: 
-- Description: ne stopwatch eh vriend
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

entity top is
    Port ( clk : in STD_LOGIC;
           rst : in STD_LOGIC;
           seg : out STD_LOGIC_VECTOR (6 downto 0);
           an : out STD_LOGIC_VECTOR (3 downto 0);
           s : in STD_LOGIC);
end top;

architecture Behavioral of top is

component clock_divider is
    Port ( clk : in STD_LOGIC;
           div : in STD_LOGIC_VECTOR (1 downto 0);
           clk_slow : out STD_LOGIC);
end component clock_divider;

component BCD_CNT10 is
    Port ( clk : in STD_LOGIC;
           rst : in STD_LOGIC;
           en : in STD_LOGIC;
           co : out STD_LOGIC;
           count : out STD_LOGIC_VECTOR (3 downto 0));
end component BCD_CNT10;

component bcd_7seg is
    Port ( seg : out STD_LOGIC_VECTOR (6 downto 0);
           bin : in STD_LOGIC_VECTOR (3 downto 0));
end component bcd_7seg;

component mux2_1 is
    Port ( d0 : in STD_LOGIC_VECTOR (3 downto 0);
           d1 : in STD_LOGIC_VECTOR (3 downto 0);
           a : in STD_LOGIC;
           z : out STD_LOGIC_VECTOR (3 downto 0));
end component mux2_1;

Signal clk1Hz : STD_LOGIC;
Signal clk100Hz : STD_LOGIC;
Signal ones : STD_LOGIC_VECTOR (3 downto 0);
Signal tens : STD_LOGIC_VECTOR (3 downto 0);
Signal en_cnt5 : STD_LOGIC;
Signal Bin : STD_LOGIC_VECTOR (3 downto 0);

begin

CLK10 : clock_divider
Port map(clk => clk,
         div => "00",
         clk_slow => clk1Hz);
         
CLK100 : clock_divider
Port map(clk => clk,
         div => "11",
         clk_slow => clk100Hz);
         
CNT10 : BCD_CNT10
Port map(clk => clk1Hz,
         rst => rst,
         en => s,
         co => en_cnt5,
         count => ones);
         
CNT5 : BCD_CNT10
Port map(clk => clk1Hz,
         rst => rst,
         en => en_cnt5,
         co => open,
         count => tens);
         
mux : mux2_1
Port map(d0 => ones,
         d1 => tens,
         a => clk100Hz,
         z => Bin);

seg7 : bcd_7seg
Port map(seg => seg,
         bin => Bin);
         
an(3 downto 2) <= "11";
an(1) <= not clk100Hz;
an(0) <= clk100Hz;

end Behavioral;
