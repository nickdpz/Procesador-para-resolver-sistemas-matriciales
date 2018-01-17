library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_signed.all;
use IEEE.STD_LOGIC_arith.ALL;

entity divi is
port(		  clk : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           inicio,pulso : in  STD_LOGIC;
			  denominador, numerador: in STD_LOGIC_VECTOR(23 downto 0);
			  final : out STD_LOGIC;
			  salida: out STD_LOGIC_VECTOR(18 downto 0)
			  );	
		  	  
end divi;

architecture Behavioral of divi is

type est is(s0,s1,s2,s3,s4,s5,s6,s7,s8,s9,s10);
signal st: est;
signal decimal : STD_LOGIC_VECTOR(7 downto 0);
signal entero : STD_LOGIC_VECTOR (9 downto 0);
signal signo: STD_LOGIC;
signal aux : STD_LOGIC_VECTOR(12 downto 0);
signal deltaAuxDecimal : STD_LOGIC_VECTOR(7 downto 0);
signal deltaAuxM : STD_LOGIC_VECTOR(15 downto 0);
begin

process (clk,reset,inicio)
begin 

if reset='1' then
	st<=s0;
elsif clk'event and clk='1' then 

case st is
			when s0 =>
				if inicio='0' then
					st <= s0;
				else 
				if(denominador=("000000000000000000000000"))then
				entero <="1111111111";
				decimal<="11111111";
					st<=s10;
				else
					st<= s1;
				end if;
				end if;
	when s1=>    
	entero <="0000000000";
	decimal<="00000000";
	st<= s2;
	when s2=> 		
    aux <= abs(numerador(12 downto 0)); 
	 if((numerador(12 downto 0) < "000000000000" and denominador(11 downto 0)>="000000000000") or (numerador(12 downto 0)>="000000000000" and denominador(11 downto 0)<"000000000000"))then
			signo<='1';
	 else
			signo<='0';
    end if;				
			st<=s3;
	when	s3=>		
			st<=s4;
	when s4=>    
	if(aux>=abs(denominador(12 downto 0)))then
			st<= s5;
	else
	   	st<= s6;
			deltaAuxDecimal<= aux(7 downto 0);
	end if;
	when s5=> 
	   	entero<=entero+1;
         aux <=   aux - abs(denominador(12 downto 0)); 
			st<=s4;
	when s6=> 
			deltaAuxM <=   deltaAuxDecimal*("01100100");
			st<=s7;
	when s7=> 
			st<=s8;
	when s8=>    
			if(deltaAuxM>=abs(denominador(12 downto 0)))then
			st<= s9;
	else
			st<= s10;
	end if;	
	when s9=> 
			decimal<=decimal+1;
			deltaAuxM <=   deltaAuxM - abs(denominador(12 downto 0)); 
			st<=s7;	
	when s10=>
			if pulso='1' then
					 st<=s0;
			else
					st<=s10;
			end if;							
	end case;
end if;
end process;
final<='1' when st=s10 else '0';
salida <= signo & entero & decimal;
end Behavioral;

