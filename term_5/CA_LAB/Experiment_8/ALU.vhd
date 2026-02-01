-- In The Name Of Allah
-- Date: 1404/09/29
-- Author:
--      Amirhossein Alian

LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;

ENTITY ALU IS
	PORT(
		A, B : IN STD_LOGIC_VECTOR(7 downto 0);
		ctrl : IN STD_LOGIC_VECTOR(3 downto 0);
		C    : OUT STD_LOGIC_VECTOR(7 downto 0);
		Z    : OUT STD_LOGIC
	);
END ALU;

ARCHITECTURE Behavioural OF ALU IS
	SIGNAL HELPER : STD_LOGIC_VECTOR(8 downto 0);
	SIGNAL RESULT : STD_LOGIC_VECTOR(7 downto 0);
BEGIN
	PROCESS (A, B, ctrl)
	BEGIN
		IF ctrl = "0000" THEN     -- AND
			RESULT <= A AND B;
		ELSIF ctrl = "0001" THEN  -- OR
			RESULT <= A OR B;
		ELSIF ctrl = "0010" THEN  -- XOR
			RESULT <= A XOR B;
		ELSIF ctrl = "0011" THEN  -- NOR
			RESULT <= A NOR B;
		ELSIF ctrl = "0100" THEN  -- NOT
			RESULT <= NOT A;
		ELSIF ctrl = "0101" THEN  -- NAND
			RESULT <= A NAND B;
		ELSIF ctrl = "0110" THEN  -- SHR
			RESULT <= '0' & A(7 downto 1);
		ELSIF ctrl = "0111" THEN  -- SHL
			RESULT <= A(6 downto 0) & '0';
		ELSIF ctrl = "1000" THEN  -- ADD
			HELPER <= STD_LOGIC_VECTOR(
			  	(A(7) & SIGNED(A)) +
				(B(7) & SIGNED(B))
			  );
			RESULT <= HELPER(7 downto 0);
		ELSIF ctrl = "1001" THEN  -- SUB
			HELPER <= STD_LOGIC_VECTOR(
			  	(A(7) & SIGNED(A)) -
				(B(7) & SIGNED(B))
			  );
			RESULT <= HELPER(7 downto 0);
		ELSIF ctrl = "1010" THEN  -- INC
			HELPER <= STD_LOGIC_VECTOR(
			  	(A(7) & SIGNED(A)) +
				("00000001")
			  );
			RESULT <= HELPER(7 downto 0);
		ELSIF ctrl = "1011" THEN  -- DEC
			HELPER <= STD_LOGIC_VECTOR(
			  	(A(7) & SIGNED(A)) -
				("00000001")
			  );
		ELSIF ctrl = "1100" THEN  -- SLT
			IF A < B THEN
				RESULT <= "00000001";
			ELSE
				RESULT <= "00000000";
			END IF;
		END IF;

		IF RESULT /= "00000000" THEN
			Z <= '0';
		ELSE
			Z <= '1';
		END IF;
	END PROCESS;
	C <= RESULT;
END Behavioural;
