library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity SUMATOR_COMPLET is
	port(A,B,CIN: in std_logic; S,COUT: out std_logic);
end entity;

architecture flux_de_date of SUMATOR_COMPLET is
begin
	S <= A xor B xor CIN;
	COUT <= (A and B) or (A and CIN) or (B and CIN);
end architecture;
