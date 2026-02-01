-- In The Name Of God
-- Date: 1404/08/24
-- Author:
--      Amirhossein Alian

LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY D_FF IS
    PORT(
        clk       : IN STD_LOGIC;
	reset_not : IN STD_LOGIC;        
        D         : IN STD_LOGIC;
        Q         : OUT STD_LOGIC;
        Q_NOT     : OUT STD_LOGIC
    );
END D_FF;

ARCHITECTURE Behavioural OF D_FF IS
BEGIN 
    PROCESS (clk, reset_not)
    BEGIN
        IF reset_not = '0' THEN
            Q <= '0';
            Q_NOT <= '1';
    	ELSIF rising_edge(clk) THEN
            Q <= D;
            Q_NOT <= NOT D;
	END IF;
    END PROCESS;
END Behavioural;
