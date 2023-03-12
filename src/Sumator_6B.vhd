library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity Sumator6B is
	port(A,B:in std_logic_vector(5 downto 0);
	CIN: in std_logic;
	COUT: out std_logic;
	S: out std_logic_vector(5 downto 0));
end entity;

architecture arh_sum of Sumator6B is
component SUMATOR_COMPLET
	port(A,B,CIN: in std_logic; S,COUT: out std_logic);
end component;

signal C1,C2,C3,C4,C5:std_logic;

begin
	s0: SUMATOR_COMPLET port map(A=>A(0),b=>B(0), CIN=>CIN, S=>S(0), COUT=>C1);
	s1: SUMATOR_COMPLET port map(A=>A(1),b=>B(1), CIN=>C1, S=>S(1), COUT=>C2);
	s2: SUMATOR_COMPLET port map(A=>A(2),b=>B(2), CIN=>C2, S=>S(2), COUT=>C3);
	s3: SUMATOR_COMPLET port map(A=>A(3),b=>B(3), CIN=>C3, S=>S(3), COUT=>C4);
	s4: SUMATOR_COMPLET port map(A=>A(4),b=>B(4), CIN=>C4, S=>S(4), COUT=>C5);
	s5: SUMATOR_COMPLET port map(A=>A(5),b=>B(5), CIN=>C5, S=>S(5), COUT=>COUT);
end architecture;
		