
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.all;

entity ula is
    Port ( x, y: in  STD_LOGIC_VECTOR (3 downto 0); 
           f : in  STD_LOGIC_VECTOR (2 downto 0);
           cin : in STD_LOGIC;
           z : out  STD_LOGIC_VECTOR (3 downto 0);
		   zero,cout,ovf,neg: out STD_LOGIC);
end ula;

architecture Behavioral of ula is
    
    -- Sinais, que servem de variáveis temporárias, para guardar as saídas das operações
    
    signal a_temp, b_temp, add_temp, sub_temp, incr_temp, troca_temp, de1_temp, and_temp, or_temp, comp_temp: STD_LOGIC_VECTOR(3 downto 0);
    signal cin_temp, add_cout, add_ovf, sub_cout, sub_ovf, incr_cout, incr_ovf, troca_cout,troca_ovf: STD_LOGIC;
    
    -- Componentes que serão utilizados pela ULA.
    
    component add_4 is
	    Port ( x : in  STD_LOGIC_VECTOR (3 downto 0);
           y : in  STD_LOGIC_VECTOR (3 downto 0);
           cin : in  STD_LOGIC;
           s : out  STD_LOGIC_VECTOR (3 downto 0);
           cout, ovf: out  STD_LOGIC);
	end component;
	
    component sub_n is
        Port ( x,y : in  STD_LOGIC_VECTOR (3 downto 0);
           z : out  STD_LOGIC_VECTOR (3 downto 0);
			  cout, ovf: out STD_LOGIC);
    end component;
    
    component troca_4 is
        Port ( x : in  STD_LOGIC_VECTOR (3 downto 0);
                z : out  STD_LOGIC_VECTOR (3 downto 0);
                cout, ovf: out STD_LOGIC);
    end component;
    
    component and_4 is
        port (
            x : in  STD_LOGIC_VECTOR (3 downto 0);
           y : in  STD_LOGIC_VECTOR (3 downto 0);
           z : out STD_LOGIC_VECTOR (3 downto 0)
        );
    end component;
    
    component or_4 is
        port (
             x : in  STD_LOGIC_VECTOR (3 downto 0);
           y : in  STD_LOGIC_VECTOR (3 downto 0);
           z : out  STD_LOGIC_VECTOR (3 downto 0)
           );
    end component;
    
    component comp_4 is
        port (
            x : in  STD_LOGIC_VECTOR (3 downto 0);
           y : in  STD_LOGIC_VECTOR (3 downto 0);
           z : out  STD_LOGIC_VECTOR (3 downto 0)
           );
    end component;
    
    component desloc is
        Port ( x : in  STD_LOGIC_VECTOR (3 downto 0);
               z : out  STD_LOGIC_VECTOR (3 downto 0)
    		);
    end component;
	
	begin
    
    -- todas operações são realizadas, mas apenas os resultados da operação selecionada são enviada para  as saídas da ULA.
    -- Abaixo, o mapeamento das entradas da ULA, com as entradas dos módulos usados e as saídas destes, com os sinais utilizados temporariamente.    
	sum: add_4 port map(a_temp, b_temp, cin_temp, add_temp, add_cout, add_ovf);

	sub: sub_n port map(a_temp, b_temp, sub_temp, sub_cout, sub_ovf);

	incr: add_4 port map(a_temp, "0000", '1', incr_temp, incr_cout, incr_ovf);
	
	troca: troca_4 port map(a_temp, troca_temp, troca_cout, troca_ovf);

	desloc1: desloc port map(a_temp, de1_temp);
	
	and_l: and_4 port map(a_temp, b_temp, and_temp);
	
	or_l: or_4 port map(a_temp, b_temp, or_temp);
	
	comp_n: comp_4 port map(a_temp, b_temp, comp_temp);
	
	process(x,y,f)
	begin -- mux
	    a_temp <= x;
	    b_temp <= y;
	    cin_temp <= cin;
		-- implementação de um mux 8:1 usando "case ... when ..."
		case f is 
			when "000" => -- adição
				z <= add_temp;
				zero <= not(add_temp(0)) AND not(add_temp(1)) AND not(add_temp(2)) AND not(add_temp(3));
				cout <= add_cout;
				ovf <= add_ovf;
				neg <= add_temp(3);
			when "001" => -- subtração
				z <= sub_temp;
				zero <= not(sub_temp(0)) AND not(sub_temp(1)) AND not(sub_temp(2)) AND not(sub_temp(3));
				cout <= sub_cout;
				ovf <= sub_ovf;
				neg <= sub_temp(3);
				
			when "010" => -- incremento
				z <= incr_temp;
				zero <= not(incr_temp(0)) AND not(incr_temp(1)) AND not(incr_temp(2)) AND not(incr_temp(3));
				cout <= incr_cout;
				ovf <= incr_ovf;
				neg <= incr_temp(3);
				
			when "011" => -- troca sinal
				z <= troca_temp;
				zero <= not(troca_temp(0)) AND not(troca_temp(1)) AND not(troca_temp(2)) AND not(troca_temp(3));
				cout <= troca_cout;
				ovf <= troca_ovf;
				neg <= troca_temp(3);
				
			when "100" => -- deslocamento cíclico para esquerda
				z <= de1_temp;
				zero <= not(de1_temp(0)) AND not(de1_temp(1)) AND not(de1_temp(2)) AND not(de1_temp(3));
				cout <= '0';
				ovf <= '0';
				neg <= '0';
				
			when "101" => -- comparador
				z <= comp_temp;
				zero <= not(comp_temp(0)) AND not(comp_temp(1)) AND not(comp_temp(2)) AND not(comp_temp(3));
				cout <= '0';
				ovf <= '0';
				neg <= '0';
				
			when "110" => -- AND
				z <= and_temp;
				zero <= not(and_temp(0)) AND not(and_temp(1)) AND not(and_temp(2)) AND not(and_temp(3));
				cout <= '0';
				ovf <= '0';
				neg <= '0';
				
			when "111" => -- OR
				z <= or_temp;
				zero <= not(or_temp(0)) AND not(or_temp(1)) AND not(or_temp(2)) AND not(or_temp(3));
				cout <= '0';
				ovf <= '0';
				neg <= '0';
			when others => 
				z <= "0000";
				zero <= '0';
				cout <= '0';
				ovf <= '0';
				neg <= '0';
		end case;
	end process;
end Behavioral;

