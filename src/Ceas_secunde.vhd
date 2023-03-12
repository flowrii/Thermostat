library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_UNSIGNED.all;

entity Ceas_secunde is
	port(clk: in std_logic;
	SEC_U, SEC_Z: inout std_logic_vector(3 downto 0);
	carry:out std_logic);
end entity;

architecture arh of Ceas_secunde is
component numarator
	port(EN,CLK,MR: in std_logic;  
	CR:out std_logic; 
	Q:out std_logic_vector(3 downto 0));
end component;

signal Reset,c,n60,n59,activ:std_logic;

begin
	activ<='1';
	n60<=((not SEC_U(3)) and (not SEC_U(2)) and (not SEC_U(1)) and (not SEC_U(0))) and
	((not SEC_Z(3)) and (SEC_Z(2)) and (SEC_Z(1)) and (not SEC_Z(0)));
	Reset<=n60;
	n59<=((SEC_U(3)) and (not SEC_U(2)) and (not SEC_U(1)) and (SEC_U(0))) and
	((not SEC_Z(3)) and (SEC_Z(2)) and (not SEC_Z(1)) and (SEC_Z(0)));
	carry<=n59;
	u:numarator port map(EN=>activ,CLK=>clk,MR=>Reset,CR=>c,Q=>SEC_U);
	z:numarator port map(EN=>c,CLK=>clk,MR=>Reset,Q=>SEC_Z);
end architecture;

	