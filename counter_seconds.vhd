library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;


entity counter_seconds is
    generic(t_max : integer := 100000000); -- tempo de espera para que nosso contador conte (10^8 / 50MHz = 2s)

    port(CLOCK_50: in std_logic; -- sinal de clock da placa
    
    counter_out1, counter_out2: out std_logic_vector(3 downto 0) := "0000"
    );
end counter_seconds;

architecture behavioral of counter_seconds is

signal counter_temp: unsigned(7 downto 0) := "00000000";
signal c_max: unsigned(7 downto 0) := "11111111";

begin
    counter_label: process (CLOCK_50)
    variable slow_clock: integer range t_max downto 0 := 0;
    begin
       if (CLOCK_50'event and CLOCK_50='1') then
        if (slow_clock <= t_max) then
            slow_clock := slow_clock + 1;
        else
            if (counter_temp <= c_max) then
                counter_temp <= counter_temp + 1;
            else
                counter_temp <= "00000000";
            end if;
            slow_clock := 0;
        
        end if;
       end if;
    end process;
    counter_out1 <= std_logic_vector(counter_temp(3 downto 0));
	 counter_out2 <= std_logic_vector(counter_temp(7 downto 4));
end behavioral;
