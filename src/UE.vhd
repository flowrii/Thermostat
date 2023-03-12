library IEEE;
use IEEE.STD_LOGIC_1164.all;
USE ieee.numeric_std.ALL;

entity Unitate_Executie is
	port(CLK,Aleg,en_ora,en_temp,Reset_Ora,Reset_Temp,Set_Tmin,Set_Tmax,Set_Ora:in std_logic;
		TEMP:in std_logic_vector(4 downto 0);						  
		Tl_Tmin,Th_Tmax:out std_logic;
		 Anod: out std_logic_vector(5 downto 0);
		 Catod: out std_logic_vector(6 downto 0));
end entity;


architecture arh_ue of Unitate_Executie is

component Nr_ora
	port(EN_ORA,RESET_ORA: in std_logic;
	ORA_U, ORA_Z: inout std_logic_vector(3 downto 0));
end component;

component Nr_temp 
	port(EN_TEMP,RESET_TEMP: in std_logic;
	T_U, T_Z: inout std_logic_vector(3 downto 0));
end component;

component Afisor
	port(CLK:in std_logic;
	Ora_crt_Z, Ora_Z, Ora_crt_U, Ora_U: in std_logic_vector(3 downto 0);
	Min_Z, Min_U, Temp_Z, T_Z, Temp_U, T_U: in std_logic_vector(3 downto 0);
	Aleg,Set_Ora:in std_logic;
	INFO: out std_logic_vector(3 downto 0);
	Anod: out std_logic_vector(5 downto 0));
end component;

component MEMORIE_RAM
	port ( A_RAM: in STD_LOGIC_VECTOR (5 downto 0);	
	WE_RAM: in STD_LOGIC;
	CS_RAM: in STD_LOGIC;
	I_RAM: in STD_LOGIC_VECTOR(4 downto 0);	  
	D_RAM: out STD_LOGIC_VECTOR(4 downto 0));	  
end component;

component Divizor
	port(CLK1:in std_logic;
	CLK2: out std_logic);
end component; 

component DCD7
	port(INFO:in std_logic_vector(3 downto 0);
	CATOD:out std_logic_vector(6 downto 0));
end component;

component DCD_to_2INT is
	port(Temp:in std_logic_vector(4 downto 0);
	T_U,T_Z:out std_logic_vector(3 downto 0));
end component;

component DCD_to_6B 
	port(U,Z:in std_logic_vector(3 downto 0);
	Rez:out std_logic_vector(5 downto 0));
end component;

component DCD_to_5B
	port(U,Z:in std_logic_vector(3 downto 0);
	Rez:out std_logic_vector(4 downto 0));
end component;

component Comp5
	port(A,B:in std_logic_vector(4 downto 0);
	F1,F2,F3:out std_logic);
end component;

component Ceas_secunde
	port(clk: in std_logic;
	SEC_U, SEC_Z: inout std_logic_vector(3 downto 0);
	carry:out std_logic);
end component;

component Ceas_minute
	port(clk: in std_logic;
	MIN_U, MIN_Z: inout std_logic_vector(3 downto 0);
	carry:out std_logic);
end component;

component Ceas_ora
	port(clk: in std_logic;
	ORA_U, ORA_Z: inout std_logic_vector(3 downto 0));
end component;

component Sumator6B
	port(A,B:in std_logic_vector(5 downto 0);
	CIN: in std_logic;
	COUT: out std_logic;
	S: out std_logic_vector(5 downto 0));
end component;

signal Ora_U, Ora_Z: std_logic_vector(3 downto 0);
signal T_U, T_Z: std_logic_vector(3 downto 0);
signal Temp_aleasa: std_logic_vector(4 downto 0);
signal Ora_crt_Z, Ora_crt_U, Min_Z, Min_U: std_logic_vector(3 downto 0);
signal Ora_crt: std_logic_vector(5 downto 0);
signal Temp_crt_Z, Temp_crt_U: std_logic_vector(3 downto 0);
signal Info: std_logic_vector(3 downto 0);
signal Tmin,Tmax: std_logic_vector(4 downto 0);
signal CLK_1s: std_logic;
signal Adresa_tmax: std_logic_vector(5 downto 0);
signal n24: std_logic_vector(5 downto 0);

begin
	NrOra: Nr_ora port map(EN_ORA=>en_ora,RESET_ORA=>Reset_Ora,ORA_U=>Ora_U,ORA_Z=>Ora_Z);
	NrTemp: Nr_Temp port map(EN_TEMP=>en_temp,RESET_TEMP=>Reset_Temp,T_U=>T_U,T_Z=>T_Z);
	Descomp_T: DCD_to_2INT port map(Temp=>TEMP, T_U=>Temp_crt_U, T_Z=>Temp_crt_Z);
	
	div: Divizor port map(CLK1=>CLK, CLK2=>CLK_1s);
	min: Ceas_minute port map(clk=>CLK_1s, MIN_U=>Min_U, MIN_Z=>Min_Z);
	ora: Ceas_ora port map(clk=>CLK_1s, ORA_U=>Ora_crt_U, ORA_Z=>Ora_crt_Z);
	
	Afis: Afisor port map(CLK=>CLK, Ora_crt_Z=>Ora_crt_Z, Ora_Z=>Ora_Z, Ora_crt_U=>Ora_crt_U, Ora_U=>Ora_U,
				Min_Z=>Min_Z, Min_U=>Min_U, Temp_Z=>Temp_crt_Z, T_Z=>T_Z, Temp_U=>Temp_crt_U, T_U=>T_U,	
				Aleg=>Aleg,Set_Ora=>Set_Ora,INFO=>Info, Anod=>Anod); 
	Decodificare: DCD7 port map(INFO=>Info, CATOD=>Catod);
	
	Compunere_Adr: DCD_to_6B port map(U=>Ora_crt_U,Z=>Ora_crt_Z,Rez=>Ora_crt);
	
	Compunere_Temp: DCD_to_5B port map(U=>T_U,Z=>T_Z,Rez=>Temp_aleasa); 
	
	memo_tmin: MEMORIE_RAM port map(A_RAM=>Ora_crt, WE_RAM=>Set_Tmin, CS_RAM=>'1', I_RAM=>Temp_aleasa, D_RAM=>Tmin);
	n24<="011000";
	adr_Tmax: Sumator6B port map(A=>Ora_crt,B=>n24,CIN=>'0',S=>Adresa_tmax);
	memo_tmax: MEMORIE_RAM port map(A_RAM=>Adresa_tmax, WE_RAM=>Set_Tmax, CS_RAM=>'1', I_RAM=>Temp_aleasa, D_RAM=>Tmax);
	
	comp1: Comp5 port map(A=>TEMP, B=>Tmin, F3=>Tl_Tmin);
	comp2: Comp5 port map(A=>TEMP, B=>Tmax, F1=>Th_Tmax);
	
end architecture;
