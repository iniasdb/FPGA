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
           an : inout STD_LOGIC_VECTOR (3 downto 0);
           s : in STD_LOGIC;
           c1 : out STD_LOGIC_VECTOR (3 downto 0);
           c1_co : out STD_LOGIC;
           c2 : out STD_LOGIC_VECTOR (3 downto 0);
           c2_co : out STD_LOGIC;
           c3 : out STD_LOGIC_VECTOR (3 downto 0));

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

component CNT5 is
    Port ( clk : in STD_LOGIC;
           rst : in STD_LOGIC;
           en : in STD_LOGIC;
           co : out STD_LOGIC;
           count : out STD_LOGIC_VECTOR (3 downto 0));
end component CNT5;

component bcd_7seg is
    Port ( seg : out STD_LOGIC_VECTOR (6 downto 0);
           bin : in STD_LOGIC_VECTOR (3 downto 0));
end component bcd_7seg;

--component mux2_1 is
--    Port ( d0 : in STD_LOGIC_VECTOR (3 downto 0);
--           d1 : in STD_LOGIC_VECTOR (3 downto 0);
--           a : in STD_LOGIC;
--           z : out STD_LOGIC_VECTOR (3 downto 0));
--end component mux2_1;

component mux3_1 is
    Port ( d0 : in STD_LOGIC_VECTOR (3 downto 0);
           d1 : in STD_LOGIC_VECTOR (3 downto 0);
           d2 : in STD_LOGIC_VECTOR (3 downto 0);
           a : in STD_LOGIC_VECTOR (1 downto 0);
           z : out STD_LOGIC_VECTOR (3 downto 0));
end component mux3_1;

component FSM is
    Port ( clk : in STD_LOGIC;
           an : out STD_LOGIC_VECTOR (3 downto 0);
           to_mux : out STD_LOGIC_VECTOR (1 downto 0));
end component FSM;

Signal clk1Hz : STD_LOGIC;
Signal clk100Hz : STD_LOGIC;
Signal ones : STD_LOGIC_VECTOR (3 downto 0);
Signal tens : STD_LOGIC_VECTOR (3 downto 0);
Signal huns : STD_LOGIC_VECTOR (3 downto 0);
Signal en_cnt5 : STD_LOGIC;
Signal en_cnt10_2 : STD_LOGIC;
Signal Bin : STD_LOGIC_VECTOR (3 downto 0);
Signal to_mux_sig : STD_LOGIC_VECTOR (1 downto 0);

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
                  
CNT_5 : CNT5
Port map(clk => clk1Hz,
         rst => rst,
         en => en_cnt5,
         co => en_cnt10_2,
         count => tens);
         
CNT10_2 : BCD_CNT10
Port map(clk => clk1Hz,
         rst => rst,
         en => en_cnt10_2,
         co => open,
         count => huns);
         
mux : mux3_1
Port map(d0 => ones,
         d1 => tens,
         d2 => huns,
         a => to_mux_sig,
         z => Bin);

seg7 : bcd_7seg
Port map(seg => seg,
         bin => Bin);
         
an_fsm : FSM
Port map(clk => clk100Hz, an => an, to_mux => to_mux_sig);

c1 <= ones;
c1_co <= en_cnt5;
c2 <= tens;
c2_co <= en_cnt10_2;
c3 <= huns;

--c3 <= an;

end Behavioral;
