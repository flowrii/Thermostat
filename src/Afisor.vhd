library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity Afisor is
	port(CLK:in std_logic;
	Ora_crt_Z, Ora_Z, Ora_crt_U, Ora_U: in std_logic_vector(3 downto 0);
	Min_Z, Min_U, Temp_Z, T_Z, Temp_U, T_U: in std_logic_vector(3 downto 0);
	Aleg,Set_Ora:in std_logic;
	INFO: out std_logic_vector(3 downto 0);
	Anod: out std_logic_vector(5 downto 0));
end entity;

architecture ARHITECTURA of Afisor is
component MUX_2_1
	port(A: in std_logic_vector(3 downto 0);
		B: in std_logic_vector(3 downto 0);
		sel: in std_logic;
		iesire:	out std_logic_vector(3 downto 0));
end component;

component MUX_8_1 
	port(A0: in std_logic_vector(3 downto 0);
	A1: in std_logic_vector(3 downto 0);
	A2: in std_logic_vector(3 downto 0);
	A3: in std_logic_vector(3 downto 0);
	A4: in std_logic_vector(3 downto 0);
	A5: in std_logic_vector(3 downto 0);
	A6: in std_logic_vector(3 downto 0);
	A7: in std_logic_vector(3 downto 0);
	sel: in std_logic_vector(2 downto 0);
	iesire:	out std_logic_vector(3 downto 0));
end component;

component registru 
	port(CLK:in std_logic;
	Q:out std_logic_vector(5 downto 0));
end component;

component DCD_Anod 
	port(ANOD:in std_logic_vector(5 downto 0);
	SEL:out std_logic_vector(2 downto 0));
end component;

signal out0,out1,out2,out3,out4,out5: std_logic_vector(3 downto 0);
signal Anod_temp: std_logic_vector(5 downto 0);
signal S: std_logic_vector(2 downto 0);

begin
	m1: MUX_2_1 port map(A=>Ora_crt_Z, B=>Ora_Z, sel=>Aleg, iesire=>out0);
	m2: MUX_2_1 port map(A=>Ora_crt_U, B=>Ora_U, sel=>Aleg, iesire=>out1);
	m3: MUX_2_1 port map(A=>Min_Z, B=>"0000", sel=>Aleg, iesire=>out2);
	m4: MUX_2_1 port map(A=>Min_U, B=>"0000", sel=>Aleg, iesire=>out3);
	m5: MUX_2_1 port map(A=>Temp_Z, B=>T_Z, sel=>Set_Ora, iesire=>out4);
	m6: MUX_2_1 port map(A=>Temp_U, B=>T_U, sel=>Set_Ora, iesire=>out5);
	
	r: registru port map(CLK=>CLK, Q=>Anod_temp);
	Anod<=Anod_temp;
	dcd: DCD_Anod port map(ANOD=>Anod_temp, SEL=>S);
	
	M: MUX_8_1 port map(A0=>out0, A1=>out1, A2=>out2, A3=>out3, A4=>out4, A5=>out5, A6=>"0000", A7=>"0000", sel=>S, iesire=>INFO);
end architecture;	