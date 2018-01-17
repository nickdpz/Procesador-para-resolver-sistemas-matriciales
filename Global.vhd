library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


use work.pack_global.all;

entity Global is
    Port ( pulso,reset,clk,clkt,start,dato : in  STD_LOGIC;
				visualizacion: in STD_LOGIC_VECTOR (2 downto 0);
           salida : out  STD_LOGIC_VECTOR (7 downto 0));
end Global;

architecture Behavioral of Global is
signal data:STD_LOGIC_VECTOR(7 downto 0);
signal wr : STD_LOGIC;
signal inicio,finalfinal:STD_LOGIC;
signal i,j,k: STD_LOGIC_VECTOR (1 downto 0);
signal x,y,z,x1,y1,z1 : STD_LOGIC_VECTOR (7 downto 0);
signal outx,outy,outz : STD_LOGIC_VECTOR (16 downto 0);
signal auxsalida: STD_LOGIC_VECTOR (7 downto 0);
begin

c1: RAM port map (data,wr,clk,reset,pulso,i,j,k,inicio,x,y,z,x1,y1,z1);
c2: Controlador port map (reset,dato,clk,clkt,wr,data);
c3: Cramer port map (x,y,z,x1,y1,z1,i,j,k,finalfinal,outx,outy,outz,inicio,clk,reset,start,pulso);


--process (visualizacion,outx,outy,outz)
--begin
--
--case visualizacion is
--	when "000"=> auxsalida(2 downto 0)<=(outx(16))&(outy(16))&(outz(16));
--	when "001"=> auxsalida<=outx(15 downto 8);
--	when "010"=> auxsalida<=outx(7 downto 0);
--	when "011"=> auxsalida<=outy(15 downto 8);
--	when "100"=> auxsalida<=outy(7 downto 0);
--	when "101"=> auxsalida<=outz(15 downto 8);
--	when "110"=> auxsalida<=outz(7 downto 0);
--	when others => auxsalida<="ZZZZZZZZ";
--end case;
--end process;
auxsalida<=(outx(16))&(outy(16))&(outz(16)&"00000") when(visualizacion="000") else
				outx(15 downto 8)    when (visualizacion="001") else
				outx(7 downto 0)     when (visualizacion="010") else
				outy(15 downto 8)    when (visualizacion="011") else 
				outy(7 downto 0)		when (visualizacion="100") else
				outz(15 downto 8)		when (visualizacion="101") else 
				outz(7 downto 0)		when (visualizacion="110") else
				"ZZZZZZZZ";
				
salida<= auxsalida when (finalfinal='1') else  data;

end Behavioral;

