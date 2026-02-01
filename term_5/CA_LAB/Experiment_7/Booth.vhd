-- In The Name Of Allah
-- Date: 1404/09/08 and Completed in 1404/09/29
-- Author:
--     Amirhossein Alian

LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;

ENTITY Booth IS
	PORT(
		clk, reset : IN STD_LOGIC;
		Q, M       : IN STD_LOGIC_VECTOR(7 downto 0);
		RESULT     : OUT STD_LOGIC_VECTOR(15 downto 0)
	);
END Booth;

ARCHITECTURE Behavioural OF Booth IS
	SIGNAL SC  : INTEGER;
	SIGNAL Qm1 : STD_LOGIC;
	SIGNAL AC  : STD_LOGIC_VECTOR(7 downto 0);
	SIGNAL QR  : STD_LOGIC_VECTOR(7 downto 0);
BEGIN
	PROCESS (reset, clk)
		VARIABLE ACC : STD_LOGIC_VECTOR(7 downto 0);
	BEGIN
		IF reset = '1' THEN
			AC  <= "00000000";
			SC  <= 8;
			Qm1 <= '0';
			QR  <= Q;
		ELSIF rising_edge(clk) and SC /= 0 THEN
			ACC := AC;
			IF QR(0) = '1' and Qm1 = '0' THEN
				ACC := STD_LOGIC_VECTOR(
				      SIGNED(ACC) - SIGNED(M)
				);
			ELSIF QR(0) = '0' and Qm1 = '1' THEN
				ACC := STD_LOGIC_VECTOR(
				      SIGNED(ACC) + SIGNED(M)
				);
			END IF;
			
			AC  <= ACC;
			Qm1 <= QR(0);
			QR  <= ACC(0) & QR(7 downto 1);
			AC  <= ACC(7) & ACC(7 downto 1);
			SC  <= SC - 1;
		END IF;	
		RESULT <= AC & QR; -- Final Result
	END PROCESS;
END Behavioural;
