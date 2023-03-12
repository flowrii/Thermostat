library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_UNSIGNED.all;

entity Ceas_minute is
	port(clk: in std_logic;
	MIN_U, MIN_Z: inout std_logic_vector(3 downto 0);
	carry:out std_logic);
end entity;

architecture arh of Ceas_minute is
component numarator
	port(EN,CLK,MR: in std_logic;  
	CR:out std_logic; 
	Q:out std_logic_vector(3 downto 0));
end component;

component Ceas_secunde 
	port(clk: in std_logic;
	SEC_U, SEC_Z: inout std_logic_vector(3 downto 0);
	carry:out std_logic);
end component;

signal Reset,c,c2,c3,n60,n59:std_logic;
signal sec_u,sec_z:std_logic_vector(3 downto 0);
begin
	n60<=((not MIN_U(3)) and (not MIN_U(2)) and (not MIN_U(1)) and (not MIN_U(0))) and
	((not MIN_Z(3)) and (MIN_Z(2)) and (MIN_Z(1)) and (not MIN_Z(0)));
	Reset<=n60;
	n59<=((MIN_U(3)) and (not MIN_U(2)) and (not MIN_U(1)) and (MIN_U(0))) and
	((not MIN_Z(3)) and (MIN_Z(2)) and (not MIN_Z(1)) and (MIN_Z(0)));
	carry<=n59;
	s:Ceas_secunde port map(clk=>clk, SEC_U=>sec_u, SEC_Z=>sec_z,carry=>c);
	u:numarator port map(EN=>c,CLK=>clk,MR=>Reset,CR=>c2,Q=>MIN_U);
	c3<=c2 and c;
	z:numarator port map(EN=>c3,CLK=>clk,MR=>Reset,Q=>MIN_Z);
end architecture;

	