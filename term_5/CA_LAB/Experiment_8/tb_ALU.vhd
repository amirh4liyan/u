-- In The Name Of Allah
-- Date: 1404/09/29
-- Author:
--      Amirhossein Alian

LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;

ENTITY tb_ALU IS
END tb_ALU;

ARCHITECTURE Behavioural OF tb_ALU IS
	SIGNAL A, B, C : STD_LOGIC_VECTOR(7 downto 0);
	SIGNAL ctrl    : STD_LOGIC_VECTOR(3 downto 0);
	SIGNAL z       : STD_LOGIC;
BEGIN
	UUT : ENTITY work.ALU
		PORT MAP(
			A,
			B,
			ctrl,
			C,
			Z
		);

	A <= "10101010";
	B <= "11100011";

	ctrl <= "0000",
			"0001" AFTER 4  ns,
			"0010" AFTER 8  ns,
			"0011" AFTER 12 ns,
			"0100" AFTER 16 ns,
			"0101" AFTER 20 ns,
			"0110" AFTER 24 ns,
			"0111" AFTER 28 ns,
			"1000" AFTER 32 ns,
			"1001" AFTER 36 ns,
			"1010" AFTER 40 ns,
			"1011" AFTER 44 ns,
			"1100" AFTER 48 ns;
END Behavioural;
