library ieee;
use ieee.std_logic_1164.all;

entity Comp5 is
	port(A,B:in std_logic_vector(4 downto 0);
	F1,F2,F3:out std_logic);
end entity;

architecture comp5 of Comp5 is
component comp4b
	port(A,B:in std_logic_vector(3 downto 0);
	F1,F2,F3:out std_logic);
end component;

component comp1b
	port(A,B:in std_logic;
	F1,F2,F3:out std_logic);
end component;

signal e1,e2,e3,g1,g2,g3:std_logic;
begin
	c1:comp4b port map(A=>A(4 downto 1),B=>B(4 downto 1),F1=>e1,F2=>e2,F3=>e3);
	c2:comp1b port map(A=>A(0),B=>B(0),F1=>g1,F2=>g2,F3=>g3);
	F1<=e1 or (e2 and g1);
	F2<=e2 and g2;
	F3<=e3 or (e2 and g3);
end architecture;
