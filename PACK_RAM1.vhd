library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

package PACK_RAM1 is
component RAM0 is
    Port ( Wr : in  STD_LOGIC;
           Swr : in  STD_LOGIC_VECTOR (1 downto 0);
           entrada : in  STD_LOGIC_VECTOR (7 downto 0);
           Sa : in  	STD_LOGIC_VECTOR (1 downto 0);
			  clk: in 	STD_LOGIC;
           Ra : out  STD_LOGIC_VECTOR (7 downto 0)
       );
end component;
component RAM1 is
    Port ( Wr : in  STD_LOGIC;
           Swr : in  STD_LOGIC_VECTOR (1 downto 0);
           entrada : in  STD_LOGIC_VECTOR (7 downto 0);
           Sa : in  	STD_LOGIC_VECTOR (1 downto 0);
			  clk: in 	STD_LOGIC;
           Ra : out  STD_LOGIC_VECTOR (7 downto 0)
       );
end component;
component RAM2 is
    Port ( Wr : in  STD_LOGIC;
           Swr : in  STD_LOGIC_VECTOR (1 downto 0);
           entrada : in  STD_LOGIC_VECTOR (7 downto 0);
           Sa : in  	STD_LOGIC_VECTOR (1 downto 0);
			  clk: in 	STD_LOGIC;
           Ra : out  STD_LOGIC_VECTOR (7 downto 0)
       );
end component;
component RAM3 is
    Port ( Wr : in  STD_LOGIC;
           Swr : in  STD_LOGIC_VECTOR (1 downto 0);
           entrada : in  STD_LOGIC_VECTOR (7 downto 0);
           Sa : in  	STD_LOGIC_VECTOR (1 downto 0);
			  clk: in 	STD_LOGIC;
           Ra : out  STD_LOGIC_VECTOR (7 downto 0)
       );
end component;
component RAM4 is
    Port ( Wr : in  STD_LOGIC;
           Swr : in  STD_LOGIC_VECTOR (1 downto 0);
           entrada : in  STD_LOGIC_VECTOR (7 downto 0);
           Sa : in  	STD_LOGIC_VECTOR (1 downto 0);
			  clk: in 	STD_LOGIC;
           Ra : out  STD_LOGIC_VECTOR (7 downto 0)
       );
end component;
component RAM5 is
    Port ( Wr : in  STD_LOGIC;
           Swr : in  STD_LOGIC_VECTOR (1 downto 0);
           entrada : in  STD_LOGIC_VECTOR (7 downto 0);
           Sa : in  	STD_LOGIC_VECTOR (1 downto 0);
			  clk: in 	STD_LOGIC;
           Ra : out  STD_LOGIC_VECTOR (7 downto 0)
       );
end component;
end package;