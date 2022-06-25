
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.all;

entity comp_4 is
    Port ( x : in  STD_LOGIC_VECTOR (3 downto 0);
           y : in  STD_LOGIC_VECTOR (3 downto 0);
           z : out  STD_LOGIC_VECTOR (3 downto 0));
end comp_4;
	
architecture Behavioral of comp_4 is
	signal z0_temp, z1_temp, z2_temp: STD_LOGIC_VECTOR (3 downto 0);
	component comp is
	    Port ( x : in  STD_LOGIC;
           y : in  STD_LOGIC;
           z : out  STD_LOGIC_VECTOR (3 downto 0);
           c_in : in  STD_LOGIC_VECTOR (3 downto 0)
           );
	end component;
begin

    -- Usamdo comparador de um bit, implementamos um de 4 bits com ordem do LSB ao MSB
	comp_0: comp port map(x(0), y(0),z0_temp, "0000"); -- Comparação do LSB, cujo resultado é usado no seguinte 
	comp_1: comp port map(x(1), y(1),z1_temp, z0_temp); -- Primeiro bit após o LSB
	comp_2: comp port map(x(2), y(2),z2_temp, z1_temp); -- Primeiro bit antes do MSB
	comp_3: comp port map(x(3), y(3),z, z2_temp); -- Comparação do MSB
	
end Behavioral;

