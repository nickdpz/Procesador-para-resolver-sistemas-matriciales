library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


package pack_global is
component Controlador is
   Port ( 
				reset : in  STD_LOGIC;
           data : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           clkt : in  STD_LOGIC;
			  final:out STD_LOGIC;
           salida : out  STD_LOGIC_VECTOR (7 downto 0));
end component;

component RAM is
    Port ( dato : in  STD_LOGIC_VECTOR (7 downto 0);
           wr,clk,reset,pulso : in  STD_LOGIC;
           i,j,k : in  STD_LOGIC_VECTOR(1 downto 0);
           inicio : out  STD_LOGIC;
           x,y,z,x1,y1,z1 : out  STD_LOGIC_VECTOR (7 downto 0));
end component;

component Cramer is
    Port ( x,y,z,x1,y1,z1 : in  STD_LOGIC_VECTOR (7 downto 0);
           i,j,k: out  STD_LOGIC_VECTOR (1 downto 0);
			  finaldivision : out STD_LOGIC;
			  outx,outy,outz : out STD_LOGIC_VECTOR (16 downto 0);
           inicio,clk,reset,start,pulso : in  STD_LOGIC);
end component;
end package;

