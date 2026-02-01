-- In The Name Of Allah
-- Date: 1404/09/08 and Completed in 1404/09/15
-- Author:
--	Amirhossein Alian

LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;

ENTITY tb_booth IS
END tb_booth;

ARCHITECTURE TestBench OF tb_booth IS
	SIGNAL clk, reset : STD_LOGIC;
	SIGNAL q, m       : STD_LOGIC_VECTOR(7 downto 0);
	SIGNAL result     : STD_LOGIC_VECTOR(15 downto 0);
BEGIN
	UUT : ENTITY work.Booth
		PORT MAP(
			clk,
			reset,
			q,
			m,
			result
		);

	reset <= '1',
		 '0' AFTER 1 ns;
	
	clk <= '0',
	       '1' AFTER 1 ns,
	       '0' AFTER 2 ns,
	       '1' AFTER 3 ns,
	       '0' AFTER 4 ns,
	       '1' AFTER 5 ns,
	       '0' AFTER 6 ns,
	       '1' AFTER 7 ns,
	       '0' AFTER 8 ns,
	       '1' AFTER 9 ns,
	       '0' AFTER 10 ns,
	       '1' AFTER 11 ns,
	       '0' AFTER 12 ns,
	       '1' AFTER 13 ns,
	       '0' AFTER 14 ns,
	       '1' AFTER 15 ns,
	       '0' AFTER 16 ns,
	       '1' AFTER 17 ns,
	       '0' AFTER 18 ns,
	       '1' AFTER 19 ns,
	       '0' AFTER 20 ns,
	       '1' AFTER 21 ns,
	       '0' AFTER 22 ns,
	       '1' AFTER 23 ns,
	       '0' AFTER 24 ns,
	       '1' AFTER 25 ns,
	       '0' AFTER 26 ns,
	       '1' AFTER 27 ns,
	       '0' AFTER 28 ns,
	       '1' AFTER 29 ns,
	       '0' AFTER 30 ns,
	       '1' AFTER 31 ns,
	       '0' AFTER 32 ns;
	
	q <= "11111001";	
	m <= "11111011";	

END TestBench;
