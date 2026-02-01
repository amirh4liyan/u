-- In The Name Of God
-- Date: 1404/08/24
-- Author:
--      Amirhossein Alian

LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY tb_MUX_2_TO_1 IS
END tb_MUX_2_TO_1;

ARCHITECTURE TestBench OF tb_MUX_2_TO_1 IS
	SIGNAL i    : STD_LOGIC_VECTOR(1 downto 0);
	SIGNAL s, y : STD_LOGIC;
BEGIN
	UUT: ENTITY work.MUX_2_TO_1
		PORT MAP (
			I => i,
			S => s,
			Y => y
		);

	--i(0) <= '0', '1' AFTER 5 ns, '0' AFTER 10 ns;
	--s <= '1', '0' AFTER 10 ns, '1' AFTER 11 ns;

	i(0) <= '0', '1' AFTER 1 ns, '0' AFTER 2 ns, '1' AFTER 3 ns, '0' AFTER 4 ns, '1' AFTER 5 ns, '0' AFTER 6 ns, '1' AFTER 7 ns, '0' AFTER 8 ns;
	i(1) <= '0', '1' AFTER 2 ns, '0' AFTER 4 ns, '1' AFTER 6 ns;
	s  <= '0', '1' AFTER 4 ns;

END TestBench;
