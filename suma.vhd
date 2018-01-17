library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
use IEEE.numeric_std.all;

entity suma is
    Port ( Num1 : in  STD_LOGIC_VECTOR (3 downto 0);
           Num2 : in  STD_LOGIC_VECTOR (3 downto 0);
           salida : out  STD_LOGIC_VECTOR (7 downto 0));
end suma;

architecture Behavioral of suma is
signal aux:std_logic_vector(7 downto 0);

begin

aux<=Num1*Num2;
salida<=aux+Num2;

end Behavioral;

