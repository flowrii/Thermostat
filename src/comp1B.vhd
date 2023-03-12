library ieee;
use ieee.std_logic_1164.all;

entity comp1b is
	port(A,B:in std_logic;
	F1,F2,F3:out std_logic);
end entity;

architecture flux of comp1b is
begin
	F1<=A and (not B);
	F2<=A xnor B;
	F3<=(not A) and B;
end architecture;
