
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity comp is
    Port ( x : in  STD_LOGIC;
           y : in  STD_LOGIC;
           z : out  STD_LOGIC_VECTOR (3 downto 0);
           c_in : in  STD_LOGIC_VECTOR (3 downto 0)
           );
end comp;

architecture Behavioral of comp is

begin
    -- Comparação de um bit, a saída e um vetor de 4 bits, tal que o binario correspondente indica se é maior, menor ou igual
	z(0) <= (x and not(y)) or (not(x xor y) and c_in(0)); -- 0001 = 1 -> Maior
	z(1) <= not(x xor y) AND (not(c_in(0)) and not(c_in(2)) ) ; -- 0010 = 2 -> Igual
	z(2) <= (not(x) and y) OR (not(x xor y) and c_in(2)); -- 100 = 4 -> Menor
	z(3) <= '0'; -- desconsiderado

end Behavioral;

