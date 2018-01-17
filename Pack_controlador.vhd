library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


package Pack_controlador is


component Definiciones is
    Port ( Data : in  STD_LOGIC_VECTOR (7 downto 0);
           enable,clk,reset : in  STD_LOGIC;
           wr : out  STD_LOGIC;
           salida : out  STD_LOGIC_VECTOR (3 downto 0));
end component;

component Traductor is
    Port ( clkt : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           data : in  STD_LOGIC;
           final :out STD_LOGIC;
			  salida : out  STD_LOGIC_VECTOR (7 downto 0));
end component;

component ASM is
    Port ( clk, reset, pulso, start, visual : in  STD_LOGIC;
			  entrada : in STD_LOGIC_VECTOR (7 downto 0);
           final : out  STD_LOGIC;
           resultado : out  STD_LOGIC_VECTOR (7 downto 0));
end component;

end package;