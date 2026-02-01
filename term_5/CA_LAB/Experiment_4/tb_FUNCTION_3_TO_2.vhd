-- In The Name Of God
-- Date: 1404/08/24
-- Authors:
--      Amirhossein Alian
--      Amirmahdi Azizi

LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY tb_FUNCTION_3_TO_2 IS
END tb_FUNCTION_3_TO_2;

ARCHITECTURE TestBench OF tb_FUNCTION_3_TO_2 IS
	SIGNAL a, b, c, f1, f2 : STD_LOGIC;
BEGIN
	UUT: ENTITY work.FUNCTION_3_TO_2 PORT MAP (a, b, c, f1, f2);
		a <= '0', '1' AFTER 4 ns;
		b <= '0', '1' AFTER 2 ns, '0' AFTER 4 ns, '1' AFTER 6 ns;
		c <= '0', '1' AFTER 1 ns, '0' AFTER 2 ns, '1' AFTER 3 ns, '0' AFTER 4 ns, '1' AFTER 5 ns, '0' AFTER 6 ns, '1' AFTER 7 ns, '0' AFTER 8 ns;
END TestBench;
