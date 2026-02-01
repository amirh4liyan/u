LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY tb_D_FF IS
END tb_D_FF;

ARCHITECTURE tb OF tb_D_FF IS
	SIGNAL clk, reset_not, D, Q, Q_NOT : STD_LOGIC;
BEGIN
	UUT: ENTITY work.D_FF
		PORT MAP (
			clk,
			reset_not,
			D,
			Q,
			Q_NOT
		);
	clk <= '0', '1' AFTER 1 ns, '0' AFTER 2 ns, '1' AFTER 3 ns, '0' AFTER 4 ns, '1' AFTER 5 ns, '0' AFTER 6 ns, '1' AFTER 7 ns, '0' AFTER 8 ns;
	reset_not <= '0','1' AFTER 1 ns;
	D <= '1', '0' AFTER 2 ns, '1' AFTER 5 ns, '0' AFTER 7 ns, '1' AFTER 8 ns;
END tb;
