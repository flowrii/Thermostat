library ieee;
use ieee.std_logic_1164.all;

entity comp4b is
	port(A,B:in std_logic_vector(3 downto 0);
	F1,F2,F3:out std_logic);
end entity;

architecture comp4 of comp4b is
component comp2b
	port(A,B:in std_logic_vector(1 downto 0);
	F1,F2,F3:out std_logic);
end component;
signal e1,e2,e3,g1,g2,g3:std_logic;
begin
	c1:comp2b port map(A=>A(3 downto 2),B=>B(3 downto 2),F1=>e1,F2=>e2,F3=>e3);
	c2:comp2b port map(A=>A(1 downto 0),B=>B(1 downto 0),F1=>g1,F2=>g2,F3=>g3);
	F1<=e1 or (e2 and g1);
	F2<=e2 and g2;
	F3<=e3 or (e2 and g3);
end architecture;
