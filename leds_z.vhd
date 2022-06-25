library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;


entity leds_z is
    port(f: in std_logic_vector (3 downto 0);
        z: out std_logic_vector (3 downto 0)
    );
end leds_z;

architecture behavioral of leds_z is

begin
    
    z <= "000" when f = "000" else 
    "001" when f = "001" else
    "011" when f = "011" else
    "010" when f = "010" else
    "100" when f = "100" else
    "101" when f = "101" else
    "110" when f = "110" else
    "111" when f = "111" else 
    "000";  -- null
    
end behavioral;
