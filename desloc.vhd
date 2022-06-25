
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity desloc is
    Port ( x : in  STD_LOGIC_VECTOR (3 downto 0);
           z : out  STD_LOGIC_VECTOR (3 downto 0)
		);
end desloc;

architecture Behavioral of desloc is
begin
	-- Deslocamento circular de 1 bit
    z(0) <= x(3);
    z(1) <= x(0);
    z(2) <= x(1);
    z(3) <= x(2);
    
end Behavioral;
