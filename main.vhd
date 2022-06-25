library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

entity main is
    port(
    CLOCK_50: in std_logic;
    f: in std_logic_vector (2 downto 0); 
    z_leds: out std_logic_vector (3 downto 0);
    f_leds: out std_logic_vector (3 downto 0)
    );
end main;

architecture func of main is
 
signal cout,ovf,zero,neg: std_logic;
signal x,y,z: std_logic_vector (3 downto 0);

component ula is
    Port ( x, y: in  STD_LOGIC_VECTOR (3 downto 0); 
       f : in  STD_LOGIC_VECTOR (2 downto 0);
       cin : in STD_LOGIC;
       z : out  STD_LOGIC_VECTOR (3 downto 0);
	   zero,cout,ovf,neg: out STD_LOGIC);
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

component leds_z is
    port(f: in std_logic_vector (2 downto 0);
        z: out std_logic_vector (2 downto 0)
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
    sys_c2 <= (not(f(2)) and not(f(1))) or (not(f(2)) and f(1) and f(0)); -- sistema de complemento 2 se for adição, subtração ou troca de sinaç.
    get_x_y: test_bench port map(CLOCK_50,x,y);
    run: ula port map(x,y,f,'0',z,zero,cout,ovf,neg);
    set_leds_f: leds_flag port map(zero,cout,ovf,neg,f_leds(3 downto 0)); 
	 z_leds <= z;
end func;
