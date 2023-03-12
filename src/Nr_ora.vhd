library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_UNSIGNED.all;

entity Nr_ora is
	port(EN_ORA,RESET_ORA: in std_logic;
	ORA_U, ORA_Z: inout std_logic_vector(3 downto 0));
end entity;

architecture arh of Nr_ora is
component numarator
	port(EN,CLK,MR: in std_logic;  
	CR:out std_logic; 
	Q:out std_logic_vector(3 downto 0));
end component;

signal Reset,c,n24,activ:std_logic;

begin
	activ<='1';
	n24<=((not ORA_U(3)) and (ORA_U(2)) and (not ORA_U(1)) and (not ORA_U(0))) and
	((not ORA_Z(3)) and (not ORA_Z(2)) and (ORA_Z(1)) and (not ORA_Z(0)));
	Reset<=RESET_ORA or n24;
	u:numarator port map(EN=>activ,CLK=>EN_ORA,MR=>Reset,CR=>c,Q=>ORA_U);
	z:numarator port map(EN=>c,CLK=>EN_ORA,MR=>Reset,Q=>ORA_Z);
end architecture;

	