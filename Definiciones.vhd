library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity Definiciones is
    Port ( Data : in  STD_LOGIC_VECTOR (7 downto 0);
           enable,clk,reset : in  STD_LOGIC;
           wr : out  STD_LOGIC;
           salida : out  STD_LOGIC_VECTOR (3 downto 0));
end Definiciones;

architecture Behavioral of Definiciones is
type estado is (s0,s1,s2);
signal registro:STD_LOGIC_VECTOR(7 downto 0 );
signal h:std_logic;
signal st:estado;
begin
process(reset,clk,enable,registro)
begin
if(reset='1') then
		registro<="00000000";
	elsif(clk'event and clk='1')then
	case st is
		when s0 => 
			if(enable ='1')then
				if(data ="11110000")then
					st<=s0;
					h<='1';
				else
					if((data="01110000" or data="01101001" or data="01110010" or data="01111010" or data="01101011" 
					or data="01110011" or data="01110100" or data="01101100" or data="01110101" or data="01111101"
					or data="01011010" or data="01100110")and h='1')then
						st<=s1;
					else
						st<=s0;
					end if;
				end if;
				else
				st<=s0;
			end if;
		when s1 =>
			registro<=Data;
			h<='0';
			st<=s2;
		when s2=>
		st<=s0;
	end case;
end if;
case registro is
	when "01110000" => salida<="0000";
	when "01101001" => salida<="0001";
	when "01110010" => salida<="0010";
	when "01111010" => salida<="0011";
	when "01101011" => salida<="0100";
	when "01110011" => salida<="0101";
	when "01110100" => salida<="0110";
	when "01101100" => salida<="0111";
	when "01110101" => salida<="1000";
	when "01111101" => salida<="1001";
	when "01011010" => salida<="1111";
	when "01100110" => salida<="1010";
	
	
	when others => salida<="0000";
end case;
end process;
wr<='1' when st=s2 else '0';
end Behavioral;

