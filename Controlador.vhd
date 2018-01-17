library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
use IEEE.numeric_std.all;
use work.Pack_controlador.all;
entity Controlador is
   Port ( 
			  reset : in  STD_LOGIC;
           data : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           clkt : in  STD_LOGIC;
			  final:out STD_LOGIC;
           salida : out  STD_LOGIC_VECTOR (7 downto 0));
end Controlador;

architecture Behavioral of Controlador is
type estados is (s0,s1,s2,s3);
signal enable,wr,h,auxfinal,aux,signo:STD_LOGIC;
signal con,demulti,auxsalida:STD_LOGIC_VECTOR (7 downto 0);
signal cemulti: STD_LOGIC_VECTOR (13 downto 0);
signal cont:std_logic_vector (1 downto 0);
signal unidades,decenas,centenas,inport: STD_LOGIC_VECTOR (3 downto 0);
signal sreg:estados;	
begin
c1:Traductor port map (clkt,reset,Data,enable,con);
c2:Definiciones port map (con,enable,clk,reset,wr,inport);
process(clk,reset,aux)
begin

if(clk'event and clk='1')then

if(reset='1' or aux='1')then
	sreg<=s0;
	unidades<="0000";
	decenas<="0000";
	centenas<="0000";	
	cont<="00";
	signo<='0';
	end if;
if(h='1')then
	unidades<=inport;
	decenas<=unidades;
	centenas<=decenas;
end if;
	case sreg is
	when s0=>
		if(wr='1')then
			if(inport="0000" or inport="0001" or inport="0010" or inport="0011" or inport="0100" or inport="0101" or 
				 inport="0110" or  inport="0111" or  inport="1000" or inport="1001") then
					sreg<=s1;
			elsif(inport="1111")then
					if(cont="01" or cont="10" or cont="11")then
						sreg<=s2;
					else
						sreg<=s0;
					end if;
			else
				if(inport="1010")then
				signo<='1';
				end if;
					sreg<=s0;
			end if;	 
		else
			sreg<=s0;
		end if;
	when s1=>
		sreg<=s0;
		if(cont="11")then 
		cont<=cont;
		else
		cont<=cont+1;
		end if;
	when s2=> 
		sreg<=s3;
	when s3=>
		sreg<=s0;
	end case;
end if;
end process;
h<='1' when (sreg=s1) else '0';
final<='1' when (sreg=s2 or sreg=s3) else '0';
demulti<=decenas*("1010");
cemulti<="000"&centenas*("1100100");
aux<='1' when(sreg=s3) else '0';
auxsalida<=(cemulti(7 downto 0)+demulti+unidades);
salida<= (not(auxsalida)+1) when signo ='1' else auxsalida;
end Behavioral;
