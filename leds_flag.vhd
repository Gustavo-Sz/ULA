library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;


entity leds_flag is
    port(a,b,c,d: in std_logic;
        z: out std_logic_vector (3 downto 0)
    );
end leds_flag;

architecture behavioral of leds_flag is

begin
    z(0) <= a; -- zero
    z(1) <= b; -- cout (-2 - (+2)) (x - 0)
    z(2) <= c; -- ovf
    z(3) <= d; -- neg
end behavioral;
