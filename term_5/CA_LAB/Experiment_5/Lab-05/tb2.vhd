LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY tb2_MUX_2_TO_1 IS
END tb2_MUX_2_TO_1;

ARCHITECTURE TestBench OF tb2_MUX_2_TO_1 IS
    SIGNAL i0, i1, s, y : STD_LOGIC;
BEGIN
    UUT: ENTITY work.MUX_2_TO_1 PORT MAP (i0, i1, s, y);
    i0 <= '0',
          '1' AFTER 1 ns,
          '0' AFTER 2 ns,
          '1' AFTER 3 ns,
          '0' AFTER 4 ns,
          '1' AFTER 5 ns,
          '0' AFTER 6 ns,
          '1' AFTER 7 ns,
          '0' AFTER 8 ns;

    i1 <= '0',
          '1' AFTER 2 ns,
          '0' AFTER 4 ns,
          '1' AFTER 6 ns;

    s  <= '0',
          '1' AFTER 4 ns;
END TestBench;
