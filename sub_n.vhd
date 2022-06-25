----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:20:18 05/26/2022 
-- Design Name: 
-- Module Name:    sub_n - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity sub_n is
    Port ( x,y : in  STD_LOGIC_VECTOR (3 downto 0);
           z : out  STD_LOGIC_VECTOR (3 downto 0);
			  cout, ovf: out STD_LOGIC);
end sub_n;

architecture Behavioral of sub_n is
	signal c1_y_temp, c2_y_temp: std_logic_vector (3 downto 0);
	signal sumi: std_logic;
	component  compl_1 is
	    Port ( x : in  STD_LOGIC_VECTOR (3 downto 0);
           z : out  STD_LOGIC_VECTOR (3 downto 0)
		);
	end component;
	
	component add_4 is
	    Port ( x : in  STD_LOGIC_VECTOR (3 downto 0);
           y : in  STD_LOGIC_VECTOR (3 downto 0);
           cin : in  STD_LOGIC;
           s : out  STD_LOGIC_VECTOR (3 downto 0);
           cout, ovf: out  STD_LOGIC);
    end component;
begin
	c1y: compl_1 port map(y,c1_y_temp);
	c2y: add_4 port map(c1_y_temp, "0001", '0', c2_y_temp, open, open);
	sub: add_4 port map(x, c2_y_temp, '0', z, cout, ovf);
end Behavioral;

