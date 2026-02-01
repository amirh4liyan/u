-- In The Name Of God
-- Date: 1404/08/24
-- Author:
--      Amirhossein Alian

LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY MUX_2_TO_1 IS
    PORT(
        I : IN STD_LOGIC_VECTOR(1 downto 0);
        S : IN STD_LOGIC;
        Y : OUT STD_LOGIC
    );
END MUX_2_TO_1;

ARCHITECTURE DataFlow OF MUX_2_TO_1 IS
BEGIN
    Y <= (NOT S AND I(0)) OR (S AND I(1));
END DataFlow;
