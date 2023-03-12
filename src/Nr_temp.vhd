library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_UNSIGNED.all;

entity Nr_temp is
	port(EN_TEMP,RESET_TEMP: in std_logic;
	T_U, T_Z: inout std_logic_vector(3 downto 0));
end entity;

architecture arh of Nr_temp is
component numarator
	port(EN,CLK,MR: in std_logic;  
	CR:out std_logic; 
	Q:out std_logic_vector(3 downto 0));
end component;

signal Reset,c,n32,activ:std_logic;

begin
	activ<='1';
	n32<=((not T_U(3)) and (not T_U(2)) and (T_U(1)) and (not T_U(0))) and
	((not T_Z(3)) and (not T_Z(2)) and (T_Z(1)) and (T_Z(0)));
	Reset<=RESET_TEMP or n32;
	u:numarator port map(EN=>activ,CLK=>EN_TEMP,MR=>Reset,CR=>c,Q=>T_U);
	z:numarator port map(EN=>c,CLK=>EN_TEMP,MR=>Reset,Q=>T_Z);
end architecture;

	