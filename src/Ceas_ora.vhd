library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_UNSIGNED.all;

entity Ceas_ora is
	port(clk: in std_logic;
	ORA_U, ORA_Z: inout std_logic_vector(3 downto 0));
end entity;

architecture arh of Ceas_ora is
component numarator
	port(EN,CLK,MR: in std_logic;  
	CR:out std_logic; 
	Q:out std_logic_vector(3 downto 0));
end component; 

component Ceas_minute 
	port(clk: in std_logic;
	MIN_U, MIN_Z: inout std_logic_vector(3 downto 0);
	carry:out std_logic);
end component;

component Ceas_secunde 
	port(clk: in std_logic;
	SEC_U, SEC_Z: inout std_logic_vector(3 downto 0);
	carry:out std_logic);
end component;

signal Reset,cs,cm,cou,en_ora_z,en_ora_u,n24:std_logic;
signal sec_u,sec_z,min_u,min_z:std_logic_vector(3 downto 0);

begin
	n24<=((not ORA_U(3)) and (ORA_U(2)) and (not ORA_U(1)) and (not ORA_U(0))) and
	((not ORA_Z(3)) and (not ORA_Z(2)) and (ORA_Z(1)) and (not ORA_Z(0)));
	Reset<=n24;
	s:Ceas_secunde port map(clk=>clk, SEC_U=>sec_u, SEC_Z=>sec_z,carry=>cs);
	m:Ceas_minute port map(clk=>clk, MIN_U=>min_u,MIN_Z=>min_z,carry=>cm);
	en_ora_u<=cs and cm;
	u:numarator port map(EN=>en_ora_u,CLK=>clk,MR=>Reset,CR=>cou,Q=>ORA_U);
	en_ora_z<=cou and cs and cm;
	z:numarator port map(EN=>en_ora_z,CLK=>clk,MR=>Reset,Q=>ORA_Z);
end architecture;

	