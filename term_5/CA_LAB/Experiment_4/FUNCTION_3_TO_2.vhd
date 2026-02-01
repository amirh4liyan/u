-- In The Name Of God
-- Date: 1404/08/24
-- Authors:
--      Amirhossein Alian
--      Amirmahdi Azizi

LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY FUNCTION_3_TO_2 IS
    PORT(
        A, B, C : IN STD_LOGIC;
        F1, F2 : OUT STD_LOGIC
    );
END FUNCTION_3_TO_2;

ARCHITECTURE DataFlow OF FUNCTION_3_TO_2 IS
BEGIN
    F1 <= (NOT A AND NOT C) OR (B AND NOT C) OR (NOT A AND B);
    F2 <= (NOT A AND NOT B) OR (A AND C);
END DataFlow;
