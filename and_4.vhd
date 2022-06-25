
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity and_4 is
    Port ( x : in  STD_LOGIC_VECTOR (3 downto 0);
           y : in  STD_LOGIC_VECTOR (3 downto 0);
           z : out STD_LOGIC_VECTOR (3 downto 0));
end and_4;

architecture Behavioral of and_4 is

begin
	z(0) <= x(0) and y(0);
	z(1) <= x(1) and y(1);
	z(2) <= x(2) and y(2);
	z(3) <= x(3) and y(3);
end Behavioral;

