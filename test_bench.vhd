library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

entity test_bench is
    port(
    CLOCK_50: in std_logic;
    x,y: out std_logic_vector (3 downto 0)
    );
end test_bench;

architecture func of test_bench is

component counter_seconds is
    port (CLOCK_50: in std_logic; -- sinal de clock da placa
    
    counter_out1, counter_out2: out std_logic_vector(3 downto 0) := "0000"
    );
end component;

begin
    cont_x: counter_seconds port map(CLOCK_50,x,y);
end func;