library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;



entity Division is
    Port ( Numerador : in  STD_LOGIC_VECTOR (10 downto 0);
           Denominador : in  STD_LOGIC_VECTOR (10 downto 0);
           Resultado : out  STD_LOGIC_VECTOR (12 downto 0));
end Division;

architecture Behavioral of Division is

Signal auxdivision:STD_LOGIC_VECTOR (5 downto 0);
Signal auxmultiplicacion:STD_LOGIC_VECTOR (16 downto 0);
Signal num_bin: STD_LOGIC_VECTOR(8 downto 0);
Signal num_bcd: STD_LOGIC_VECTOR(10 downto 0);
begin
process (denominador)
begin
	case denominador(6 downto 0) is
	when(	"0000010"	)=>	auxdivision <=	"110010"	;
	when(	"0000011"	)=>	auxdivision <=	"100001"	;
	when(	"0000100"	)=>	auxdivision <=	"011001"	;
	when(	"0000101"	)=>	auxdivision <=	"010100"	;
	when(	"0000110"	)=>	auxdivision <=	"010000"	;
	when(	"0000111"	)=>	auxdivision <=	"001110"	;
	when(	"0001000"	)=>	auxdivision <=	"001100"	;
	when(	"0001001"	)=>	auxdivision <=	"001011"	;
	when(	"0001010"	)=>	auxdivision <=	"001010"	;
	when(	"0001011"	)=>	auxdivision <=	"001001"	;
	when(	"0001100"	)=>	auxdivision <=	"001000"	;
	when(	"0001101"	)=>	auxdivision <=	"000111"	;
	when(	"0001110"	)=>	auxdivision <=	"000111"	;
	when(	"0001111"	)=>	auxdivision <=	"000110"	;
	when(	"0010000"	)=>	auxdivision <=	"000110"	;
	when(	"0010001"	)=>	auxdivision <=	"000101"	;
	when(	"0010010"	)=>	auxdivision <=	"000101"	;
	when(	"0010011"	)=>	auxdivision <=	"000101"	;
	when(	"0010100"	)=>	auxdivision <=	"000101"	;
	when(	"0010101"	)=>	auxdivision <=	"000100"	;
	when(	"0010110"	)=>	auxdivision <=	"000100"	;
	when(	"0010111"	)=>	auxdivision <=	"000100"	;
	when(	"0011000"	)=>	auxdivision <=	"000100"	;
	when(	"0011001"	)=>	auxdivision <=	"000100"	;
	when(	"0011010"	)=>	auxdivision <=	"000011"	;
	when(	"0011011"	)=>	auxdivision <=	"000011"	;
	when(	"0011100"	)=>	auxdivision <=	"000011"	;
	when(	"0011101"	)=>	auxdivision <=	"000011"	;
	when(	"0011110"	)=>	auxdivision <=	"000011"	;
	when(	"0011111"	)=>	auxdivision <=	"000011"	;
	when(	"0100000"	)=>	auxdivision <=	"000011"	;
	when(	"0100001"	)=>	auxdivision <=	"000011"	;
	when(	"0100010"	)=>	auxdivision <=	"000010"	;
	when(	"0100011"	)=>	auxdivision <=	"000010"	;
	when(	"0100100"	)=>	auxdivision <=	"000010"	;
	when(	"0100101"	)=>	auxdivision <=	"000010"	;
	when(	"0100110"	)=>	auxdivision <=	"000010"	;
	when(	"0100111"	)=>	auxdivision <=	"000010"	;
	when(	"0101000"	)=>	auxdivision <=	"000010"	;
	when(	"0101001"	)=>	auxdivision <=	"000010"	;
	when(	"0101010"	)=>	auxdivision <=	"000010"	;
	when(	"0101011"	)=>	auxdivision <=	"000010"	;
	when(	"0101100"	)=>	auxdivision <=	"000010"	;
	when(	"0101101"	)=>	auxdivision <=	"000010"	;
	when(	"0101110"	)=>	auxdivision <=	"000010"	;
	when(	"0101111"	)=>	auxdivision <=	"000010"	;
	when(	"0110000"	)=>	auxdivision <=	"000010"	;
	when(	"0110001"	)=>	auxdivision <=	"000010"	;
	when(	"0110010"	)=>	auxdivision <=	"000010"	;
	when(	"0110011"	)=>	auxdivision <=	"000010"	;
	when(	"0110100"	)=>	auxdivision <=	"000001"	;
	when(	"0110101"	)=>	auxdivision <=	"000001"	;
	when(	"0110110"	)=>	auxdivision <=	"000001"	;
	when(	"0110111"	)=>	auxdivision <=	"000001"	;
	when(	"0111000"	)=>	auxdivision <=	"000001"	;
	when(	"0111001"	)=>	auxdivision <=	"000001"	;
	when(	"0111010"	)=>	auxdivision <=	"000001"	;
	when(	"0111011"	)=>	auxdivision <=	"000001"	;
	when(	"0111100"	)=>	auxdivision <=	"000001"	;
	when(	"0111101"	)=>	auxdivision <=	"000001"	;
	when(	"0111110"	)=>	auxdivision <=	"000001"	;
	when(	"0111111"	)=>	auxdivision <=	"000001"	;
	when(	"1000000"	)=>	auxdivision <=	"000001"	;
	when(	"1000001"	)=>	auxdivision <=	"000001"	;
	when(	"1000010"	)=>	auxdivision <=	"000001"	;
	when(	"1000011"	)=>	auxdivision <=	"000001"	;
	when(	"1000100"	)=>	auxdivision <=	"000001"	;
	when(	"1000101"	)=>	auxdivision <=	"000001"	;
	when(	"1000110"	)=>	auxdivision <=	"000001"	;
	when(	"1000111"	)=>	auxdivision <=	"000001"	;
	when(	"1001000"	)=>	auxdivision <=	"000001"	;
	when(	"1001001"	)=>	auxdivision <=	"000001"	;
	when(	"1001010"	)=>	auxdivision <=	"000001"	;
	when(	"1001011"	)=>	auxdivision <=	"000001"	;
	when(	"1001100"	)=>	auxdivision <=	"000001"	;
	when(	"1001101"	)=>	auxdivision <=	"000001"	;
	when(	"1001110"	)=>	auxdivision <=	"000001"	;
	when(	"1001111"	)=>	auxdivision <=	"000001"	;
	when(	"1010000"	)=>	auxdivision <=	"000001"	;
	when(	"1010001"	)=>	auxdivision <=	"000001"	;
	when(	"1010010"	)=>	auxdivision <=	"000001"	;
	when(	"1010011"	)=>	auxdivision <=	"000001"	;
	when(	"1010100"	)=>	auxdivision <=	"000001"	;
	when(	"1010101"	)=>	auxdivision <=	"000001"	;
	when(	"1010110"	)=>	auxdivision <=	"000001"	;
	when(	"1010111"	)=>	auxdivision <=	"000001"	;
	when(	"1011000"	)=>	auxdivision <=	"000001"	;
	when(	"1011001"	)=>	auxdivision <=	"000001"	;
	when(	"1011010"	)=>	auxdivision <=	"000001"	;
	when(	"1011011"	)=>	auxdivision <=	"000001"	;
	when(	"1011100"	)=>	auxdivision <=	"000001"	;
	when(	"1011101"	)=>	auxdivision <=	"000001"	;
	when(	"1011110"	)=>	auxdivision <=	"000001"	;
	when(	"1011111"	)=>	auxdivision <=	"000001"	;
	when(	"1100000"	)=>	auxdivision <=	"000001"	;
	when(	"1100001"	)=>	auxdivision <=	"000001"	;
	when(	"1100010"	)=>	auxdivision <=	"000001"	;
	when(	"1100011"	)=>	auxdivision <=	"000001"	;
	when(	"1100100"	)=>	auxdivision <=	"000001"	;
	when(	"1100101"	)=>	auxdivision <=	"000001"	;
	when(	"1100110"	)=>	auxdivision <=	"000001"	;
	when(	"1100111"	)=>	auxdivision <=	"000001"	;
	when(	"1101000"	)=>	auxdivision <=	"000001"	;
	when(	"1101001"	)=>	auxdivision <=	"000001"	;
	when others =>          auxdivision <= "000000" ;	
	end case;
	end process;
	auxmultiplicacion<=auxdivision*Denominador; 
	
	Resultado<="00000000001" when (Numerador=Denominador) else 
					Numerador when (Denominador="0000000001") else
					num_bcd;
num_bin<=auxmultiplicacion(8 downto 0);
proceso_bcd: process(num_bin)
        variable z: STD_LOGIC_VECTOR(22 downto 0);
    begin
        -- Inicialización de datos en cero.
        z := (others => '0');
        -- Se realizan los primeros tres corrimientos.
        z(11 downto 3) := num_bin;
        for i in 0 to 5 loop
            -- Unidades (4 bits).
            if z(12 downto 9) > 4 then
                z(12 downto 9) := z(12 downto 9) + 3;
            end if;
            -- Decenas (4 bits).
            if z(16 downto 13) > 4 then
                z(16 downto 13) := z(16 downto 13) + 3;
            end if;
            -- Centenas (3 bits).
            if z(19 downto 17) > 4 then
                z(19 downto 17) := z(19 downto 17) + 3;
            end if;
				 
				 if z(22 downto 20) > 4 then
                z(22 downto 20) := z(20 downto 20) + 3;
            end if;
            -- Corrimiento a la izquierda.
            z(19 downto 1) := z(18 downto 0);
        end loop;
        -- Pasando datos de variable Z, correspondiente a BCD.
        num_bcd <= z(22 downto 9);
    end process;
	 resultado<=num_bcd;
end Behavioral;

