library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

entity decoder7seg is
    port (
        bin_in: in unsigned(3 downto 0) := "0000";
        d1,d2: out std_logic_vector(6 downto 0);
        sys_c2: in STD_LOGIC
    );
end decoder7seg;

architecture dataflow of decoder7seg is

begin
    d2 <= "1000000" when (bin_in = "0000") else -- 0
    "1111001" when (bin_in = "0001" or (bin_in = "1111" and sys_c2 = '1'))  else  -- 1
    "0100100" when (bin_in = "0010" or (bin_in = "1110" and sys_c2 = '1'))  else  -- 2
    "0110000" when (bin_in = "0011" or (bin_in = "1101" and sys_c2 = '1'))  else  -- 3
    "0011001" when (bin_in = "0100" or (bin_in = "1100" and sys_c2 = '1'))  else  -- 4
    "0010010" when (bin_in = "0101" or (bin_in = "1011" and sys_c2 = '1'))  else  -- 5
    "0000010" when (bin_in = "0110" or (bin_in = "1010" and sys_c2 = '1'))  else  -- 6
    "1111000" when (bin_in = "0111" or (bin_in = "1001" and sys_c2 = '1'))  else  -- 7
    "0000000" when (bin_in = "1000") else  -- 8 ou menos 8
    "0011000" when (bin_in = "1001" and (sys_c2 = '0')) else -- 9
    "1000000" when (bin_in = "1010" and (sys_c2 = '0')) else -- 10
    "1111001" when (bin_in = "1011" and (sys_c2 = '0')) else -- 11
    "0100100" when (bin_in = "1100" and (sys_c2 = '0')) else -- 12
    "0110000" when (bin_in = "1101" and (sys_c2 = '0')) else -- 13
    "0011001" when (bin_in = "1110" and (sys_c2 = '0')) else -- 14
    "0010010" when (bin_in = "1111" and (sys_c2 = '0')) else -- 15
    "0111111";  -- null
    d1 <= "0111111" when (bin_in(3) = '1' and sys_c2 = '1') else
    "1111001" when (bin_in >= "1010" and (sys_c2 = '0')) else -- 1X
    "1111111";
end dataflow;