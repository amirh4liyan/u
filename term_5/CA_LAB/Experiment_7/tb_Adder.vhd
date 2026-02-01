-- In The Name Of Allah
-- Date: 1404/09/15
-- Author:
--	Amirhossein Alian

LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY tb IS
END tb;

ARCHITECTURE Testbench OF tb IS
	SIGNAL cin, cout : STD_LOGIC;
	SIGNAL a, b : STD_LOGIC_VECTOR(7 downto 0);
	SIGNAL sum  : STD_LOGIC_VECTOR(7 downto 0);
BEGIN
	U1 : ENTITY work.Adder PORT MAP (cin, a, b, sum, cout);
	cin <= '0', '1' AFTER 4 ns, '0' AFTER 8 ns;
	a   <= "00000001"; 
	b   <= "00000010";
END Testbench;
