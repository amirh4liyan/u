-- In The Name Of Allah
-- Date: 1404/09/08 and Completed in 1404/09/15
-- Author:
--	Amirhossein Alian

LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;

ENTITY Adder IS
	PORT(
		cin  : IN STD_LOGIC;
		a    : IN STD_LOGIC_VECTOR(7 downto 0);
		b    : IN STD_LOGIC_VECTOR(7 downto 0);
		sum  : OUT STD_LOGIC_VECTOR(7 downto 0);
		cout : OUT STD_LOGIC
	);
END Adder;

ARCHITECTURE Behavioural OF Adder IS
	signal result : STD_LOGIC_VECTOR(8 downto 0);
BEGIN
	PROCESS (a, b, cin)
	BEGIN
		result <= STD_LOGIC_VECTOR(
			  	('0' & unsigned(A)) +
				('0' & unsigned(B)) +
				("00000000" & cin)
			  );

		sum  <= result(7 downto 0);
		cout <= result(8);
	END PROCESS;
END Behavioural;
