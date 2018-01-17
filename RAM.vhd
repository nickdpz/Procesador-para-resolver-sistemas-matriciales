library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

use work.PACK_RAM1.all;

entity RAM is
    Port ( dato : in  STD_LOGIC_VECTOR (7 downto 0);
           wr,clk,reset,pulso : in  STD_LOGIC;
           i,j,k : in  STD_LOGIC_VECTOR(1 downto 0);
           inicio : out  STD_LOGIC;
           x,y,z,x1,y1,z1 : out  STD_LOGIC_VECTOR (7 downto 0));
end RAM;

architecture Behavioral of RAM is
	type estados is (s0,s1,s2,s3,s4,s5);
	signal enable: std_logic;
	signal cont1,cont2:STD_LOGIC_VECTOR(1 downto 0 );
	signal Wrs: std_logic_vector (3 downto 0);
	signal st: estados;
--	signal ax,ay,az,ax1,ay1,az1: std_logic_vector (7 downto 0);

begin


c0: RAM0 port map (wrs(0),cont1,dato,i,clk,x);
c1: RAM1 port map (wrs(1),cont1,dato,j,clk,y);
c2: RAM2 port map (wrs(2),cont1,dato,k,clk,z);
c3: RAM3 port map (wrs(3),cont1,dato,i,clk,x1);
c4: RAM4 port map (wrs(3),cont1,dato,j,clk,y1);
c5: RAM5 port map (wrs(3),cont1,dato,k,clk,z1);
process(clk,Wr,reset)
begin
	if(reset='1') then
		cont1<="00";
		cont2<="00";
		st<=s0;
	elsif(clk'event and clk='1')then
	case st is
		when s0 => 
			if(wr='1')then
				st<=s5;
			else
				st<=s0;
				cont1<="00";
				cont2<="00";
			end if;
		when s5=>
			st<=s1;
		when s1 =>
			if(cont1="10")then
				st<=s3;
			else
				st<=s2;
			end if;
		when s2 =>
			cont1<=cont1+1;
			st<=s0;
		when s3 =>
			cont2<=cont2+1;
			cont1<="00";
			if(cont2="11")then
				st<=s4;
			else
				st<=s0;
			end if;
		when s4 =>

			if(pulso='1')then 
			st<=s0;
			else
			st<=s4;
			end if;
		end case;
		end if;
end process;
inicio<='1' when (st=s4) else '0';
enable<='0' when (st=s1 or st=s5 ) else '1';

Wrs(0)<=(not(enable)and(not(cont2(0))))and(not(cont2(1)));
wrs(1)<=(not(enable)and(cont2(0)))and(not(cont2(1)));
Wrs(2)<=(not(enable)and(not(cont2(0))))and(cont2(1));
Wrs(3)<=(not(enable)and(cont2(0)))and(cont2(1));

end Behavioral;

