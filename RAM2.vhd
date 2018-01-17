library IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;


entity RAM2 is
    Port ( Wr : in  STD_LOGIC;
           Swr : in  STD_LOGIC_VECTOR (1 downto 0);
           entrada : in  STD_LOGIC_VECTOR (7 downto 0);
           Sa : in  	STD_LOGIC_VECTOR (1 downto 0);
			  clk: in 	STD_LOGIC;
           Ra : out  STD_LOGIC_VECTOR (7 downto 0)
       );
end RAM2;

architecture Behavioral of RAM2 is
type Memory_type is array (3 downto 0) of STD_LOGIC_VECTOR (7 downto 0);
signal Ram : Memory_type;

begin
process(clk,Wr)
begin
if(clk'event and clk='1') then 
	if(Wr='1') then
		Ram(conv_integer(Swr))<=entrada;
	end if;
end if;
end process;

	Ra<=Ram(conv_integer(Sa));

end Behavioral;

