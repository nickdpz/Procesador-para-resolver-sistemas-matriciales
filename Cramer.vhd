library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_arith.all;
use ieee.std_logic_signed.all;
use IEEE.numeric_std.all;


use work.pack_division.all;

entity Cramer is
    Port ( x,y,z,x1,y1,z1 : in  STD_LOGIC_VECTOR (7 downto 0);
           i,j,k: out  STD_LOGIC_VECTOR (1 downto 0);
			  finaldivision : out STD_LOGIC;
			  outx,outy,outz : out STD_LOGIC_VECTOR (18 downto 0);
           inicio,clk,reset,start,pulso : in  STD_LOGIC);
end Cramer;

architecture Behavioral of Cramer is

type estados is (s0,s1,s3,s4,s5,s7,s8,s9);
signal st: estados;
--Signal x,y,z,x1,y1,z1 :  STD_LOGIC_VECTOR (7 downto 0);
signal final,finalx,finaly,finalz:STD_LOGIC;
signal ai,aj,ak:STD_LOGIC_VECTOR(2 downto 0);
signal aui,auj,auk:STD_LOGIC_VECTOR(2 downto 0 );
signal asuma,aresta,asumax,arestax,asumay,arestay,asumaz,arestaz: STD_LOGIC_VECTOR(23 downto 0);
signal suma,resta,aux,sumax,restax,auxx,sumay,restay,auxy,sumaz,restaz,auxz: STD_LOGIC_VECTOR(23 downto 0);

begin

cx: divi port map (clk,reset,final,pulso,aux(23 downto 0),auxx,finalx,outx);
cy: divi port map (clk,reset,final,pulso,aux(23 downto 0),auxy,finaly,outy);
cz: divi port map (clk,reset,final,pulso,aux(23 downto 0),auxz,finalz,outz);

process(clk,reset,ai)
begin
if(reset='1') then
		suma<=(others=>'0');
		resta<=(others=>'0');
		sumax<=(others=>'0');
		restax<=(others=>'0');
		sumay<=(others=>'0');
		restay<=(others=>'0');
		sumaz<=(others=>'0');
		restaz<=(others=>'0');
		ai<=(others=>'0');
		st<=s0;
elsif(clk'event and clk = '1')then
	case st is
		when s0 => 
			if((start='1') and inicio = '1')then
				st<=s1;
			else
				st<=s0;
			end if;
		when s1=>
			ai<="000";
			suma<=(others=>'0');
			sumax<=(others=>'0');
			sumay<=(others=>'0');
			sumaz<=(others=>'0');
			st<=s3;
		when s3 =>
			suma<=asuma;
			sumax<=asumax;
			sumay<=asumay;
			sumaz<=asumaz;
			if(ai<"010")then 			
			st<=s4;
			else 
			st<=s5;
			end if;
		when s4=>
			ai<=ai+1;
			st<=s3;
		when s5=>
			ai<="000";
			resta<=(others=>'0');
			restax<=(others=>'0');
			restay<=(others=>'0');
			restaz<=(others=>'0');
			st<=s7;
		when s7=>
			resta<=aresta;
			restax<=arestax;
			restay<=arestay;
			restaz<=arestaz;
			if(ai<"010")then
			st<=s8;
			else
			st<=s9;
			end if;
		when s8=>
			ai<=ai+1;
			st<=s7;
		when s9=>
		if(pulso='1')then
			st<=s0;
		else
			st<=s9;
		end if;
		end case;
	end if;
end process;
	
	asuma<=suma+((x)*(y)*(z));
	asumax<=sumax+((x1)*(y)*(z));
	asumay<=sumay+(x)*(y1)*(z);
	asumaz<=sumaz+(x)*(y)*(z1);
	
	aresta<=resta+((x)*(y)*(z));
	arestax<=restax+((x1)*(y)*(z));
	arestay<=restay+(x)*(y1)*(z);
	arestaz<=restaz+(x)*(y)*(z1);
	
	i<=aui(1 downto 0);
	j<=auj(1 downto 0);
	k<=auk(1 downto 0);
	
	aj<="000" when (ai="010") else
		 "001" when (ai="000") else
		 "010";
	ak<="000" when(ai="001")else
		 "001" when(ai="010")else
		 "010";
		 
	aui<=ai when ((st=s1)  or(st=s3) or (st=s4)) else ak;
	auk<=ak  when ((st=s1) or(st=s3) or (st=s4)) else ai;
	auj<=aj;
	
	aux<=suma-resta;
	auxz<=sumaz-restaz;
	auxx<= sumax-restax;
	auxy<=sumay-restay;	
	
	final<='1' when(st=s9) else '0'; 
	finaldivision <= '1' when ((finalx='1') and (finaly='1') and (finalz='1')) else '0';

--
--process (aui,auj,auk)
--begin 
--case aui is 
--	when "000" => 	x<="00000010"; x1<="00001011";
--	when "001" => 	x<="00001010"; x1<="00001000";
--	when others => x<="00001011"; x1<="00000101";
--end case;
--case auj is 
--	when "000" => 	y<="00000001"; y1<="00001011";
--	when "001" => 	y<="00000010"; y1<="00001000";
--	when others => y<="00000011"; y1<="00000101";
--end case;
--case auk is 
--	when "000" => 	z<="00000101"; z1<="00001011";
--	when "001" => 	z<="00000010"; z1<="00001000";
--	when others => z<="00001000"; z1<="00000101";
--end case;
--end process;


end Behavioral;

