library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity troca_4 is
    Port ( x : in  STD_LOGIC_VECTOR (3 downto 0);
        z : out  STD_LOGIC_VECTOR (3 downto 0);
        cout, ovf: out STD_LOGIC);
end troca_4;

architecture Behavioral of troca_4 is

    component compl_1 is
        Port ( x : in  STD_LOGIC_VECTOR (3 downto 0);
            z : out  STD_LOGIC_VECTOR (3 downto 0)
        );  
    end component;
    component add_4 is
        port (x : in  STD_LOGIC_VECTOR (3 downto 0);
        y : in  STD_LOGIC_VECTOR (3 downto 0);
        cin : in  STD_LOGIC;
        s : out  STD_LOGIC_VECTOR (3 downto 0);
        cout, ovf: out  STD_LOGIC);
    end component;
    signal x_compl_1: STD_LOGIC_VECTOR (3 downto 0);
begin
    -- Trocar sinal trata-se de fazer o complemento de 2 do operando
	compl: compl_1 port map(x, x_compl_1);
	troca: add_4 port map(x_compl_1, "0000",'1',z,cout,ovf);

end Behavioral;



