library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity Traductor is
    Port ( clkt : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           data : in  STD_LOGIC;
           final :out STD_LOGIC;
			  salida : out  STD_LOGIC_VECTOR (7 downto 0));
end Traductor;

architecture Behavioral of Traductor is
Signal contador : STD_LOGIC_VECTOR(3 downto 0 );
signal aux: STD_LOGIC;
signal registro:STD_LOGIC_VECTOR(10 downto 0 );
begin
process(reset,clkt,aux)
begin
	if(reset='1'  or aux='1') then
		registro<=(others=>'0');
		contador<="0000";
	elsif(clkt'event and clkt='0')then
	contador<=contador+1;
	registro(10 downto 0)<=data & registro(10 downto 1); 
	
end if;	
end process;
aux<='1' when (contador="1011") else '0';
final<='1' when (contador="1010") else '0';

salida<=registro(9 downto 2);
end Behavioral;
