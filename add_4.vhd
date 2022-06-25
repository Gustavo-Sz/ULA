
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.all;

entity add_4 is
    Port ( x : in  STD_LOGIC_VECTOR (3 downto 0);
           y : in  STD_LOGIC_VECTOR (3 downto 0);
           cin : in  STD_LOGIC;
           s : out  STD_LOGIC_VECTOR (3 downto 0);
           cout, ovf: out  STD_LOGIC);
end add_4;

architecture Behavioral of add_4 is
	signal cini: std_logic_vector (2 downto 0);
	signal couti: STD_LOGIC_VECTOR (3 downto 0);
	signal sumi : std_logic;
	
	component fulladder is
        Port(a : in  STD_LOGIC;
               b : in  STD_LOGIC;
               cin : in  STD_LOGIC;
               s : out STD_LOGIC;
               cout : out  STD_LOGIC);
	 end component;
begin
    -- Um somador de transporte propagado em sistema de complemento 2
    -- couti(0) é o carry out do primeiro fulladder (o 0), que vai pro c_int do segundo (o 1). O cin é o carry in do primeiro full adder, e o Cout é o carry out do ultimo full adder (o 3)
	add_0: fulladder port map(x(0), y(0), cin, s(0), couti(0));
	cini(0) <= couti(0);
	add_1: fulladder port map(x(1), y(1), cini(0), s(1), couti(1));
	cini(1) <= couti(1);
	add_2: fulladder port map(x(2), y(2), cini(1), s(2), couti(2));
	cini(2) <= couti(2);
	add_3: fulladder port map(x(3), y(3), cini(2), s(3), couti(3));
	ovf <= couti(3) xor couti(2);
	cout <= couti(3);
	
end Behavioral;

