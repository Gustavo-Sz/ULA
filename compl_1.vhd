
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity compl_1 is
    Port ( x : in  STD_LOGIC_VECTOR (3 downto 0);
           z : out  STD_LOGIC_VECTOR (3 downto 0)
		);
end compl_1;

architecture Behavioral of compl_1 is
begin
	z <= NOT x;

end Behavioral;
