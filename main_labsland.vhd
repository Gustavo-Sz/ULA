library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

entity main_labsland is
    port(
    CLOCK_50: in std_logic;
    SW: in std_logic_vector (2 downto 0); 
    LEDR: out std_logic_vector(17 downto 0) := "000000000000000000";
    HEX7,HEX6,HEX5,HEX4,HEX3,HEX2: out std_logic_vector (6 downto 0) := "0000000"
    );
end main_labsland;

architecture func of main_labsland is
 
signal cout,ovf,zero,neg: std_logic;
signal x,y,z: std_logic_vector (3 downto 0);

component ula is
    Port ( x, y: in  STD_LOGIC_VECTOR (3 downto 0); 
       f : in  STD_LOGIC_VECTOR (2 downto 0);
       cin : in STD_LOGIC;
       z : out  STD_LOGIC_VECTOR (3 downto 0);
	   zero,cout,ovf,neg: out STD_LOGIC);
end component;

component decoder7seg is
    port (
        bin_in: in unsigned(3 downto 0) := "0000";
        d1,d2: out std_logic_vector(6 downto 0);
        sys_c2: in STD_LOGIC
    );
end component;

component leds_op is
    port(f: in std_logic_vector (2 downto 0);
        z: out std_logic_vector (17 downto 0)
    );
end component;

component leds_flag is
    port(a,b,c,d: in std_logic;
        z: out std_logic_vector (3 downto 0)
    );
end component;

component test_bench is
    port(
    CLOCK_50: in std_logic;
    x,y: out std_logic_vector (3 downto 0)
    );
end component;

signal sys_c2: std_logic;

begin
    sys_c2 <= (not(SW(2)) and not(SW(1))) or (not(SW(2)) and SW(1) and SW(0)) or (not(SW(2)) and SW(1) and not(SW(0))); -- sistema de complemento 2 se for adição, subtração ou troca de sinaç.
    cont_x_y: test_bench port map(CLOCK_50,x,y);
    run: ula port map(x,y,SW,'0',z,zero,cout,ovf,neg);
    leds: leds_flag port map(zero,cout,ovf,neg,LEDR(3 downto 0)); 
    x_disp_hex: decoder7seg port map(unsigned(x),HEX7,HEX6,sys_c2);
    y_disp_hex: decoder7seg port map(unsigned(y),HEX5,HEX4,sys_c2);
    z_disp_hex: decoder7seg port map(unsigned(z),HEX3,HEX2,sys_c2);
    
end func;
