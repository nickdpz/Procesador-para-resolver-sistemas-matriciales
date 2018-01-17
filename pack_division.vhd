library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

package pack_division is

component divi is
port(		  clk : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           inicio,pulso : in  STD_LOGIC;
			  denominador, numerador: in STD_LOGIC_VECTOR(23 downto 0);
			  final : out STD_LOGIC;
			  salida: out STD_LOGIC_VECTOR(18 downto 0)
			  );
end component;
end pack_division;