library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity TERMOSTAT is
	port (TEMP: in std_logic_vector(4 downto 0);
		BTN_ALEG_ORA, BTN_ALEG_TEMP: in std_logic;
		SW_ALEG_ORA, SW_SET_ORA, SW_SET_TEMP: in std_logic;
		SW_MIN_MAX, SW_SAVE: in std_logic;
		CLK: in std_logic;
		LED: out std_logic;
		ANOD: out std_logic_vector(5 downto 0);
		CATOD: out std_logic_vector(6 downto 0));
end entity;

architecture ARH_TERMO of TERMOSTAT is

	component Organigrama
		port(CLK: in std_logic;
		SW_ALEG_ORA, BTN_ALEG_ORA, SW_SET_ORA: in std_logic;
		BTN_TEMP, SW_SET_TEMP, SW_MIN_MAX: in std_logic;
		SW_SAVE: in std_logic;
		Tl_TMIN, Th_TMAX: in std_logic;
		RESET_ORA, RESET_TEMP: out std_logic;
		LED: out std_logic;
		ALEG: out std_logic;
		EN_ORA, SET_ORA: out std_logic;
		EN_TEMP, SET_Tmin, SET_Tmax: out std_logic);
	end component;

	component Unitate_Executie
		port(CLK,Aleg,en_ora,en_temp,Reset_Ora,Reset_Temp,Set_Tmin,Set_Tmax,Set_Ora:in std_logic;
		TEMP:in std_logic_vector(4 downto 0);						  
		Tl_Tmin,Th_Tmax:out std_logic;
		Anod: out std_logic_vector(5 downto 0);
		Catod: out std_logic_vector(6 downto 0));
	end component;
	
	signal Aleg,en_ora,en_temp,Reset_Ora,Reset_Temp,Set_Tmin,Set_Tmax,Set_Ora,
	Tl_Tmin,Th_Tmax: std_logic;
	
begin
	UC: Organigrama port map(CLK=>CLK,SW_ALEG_ORA=>SW_ALEG_ORA,BTN_ALEG_ORA=>BTN_ALEG_ORA,
					SW_SET_ORA=>SW_SET_ORA,BTN_TEMP=>BTN_ALEG_TEMP,SW_SET_TEMP=>SW_SET_TEMP,
					SW_MIN_MAX=>SW_MIN_MAX,SW_SAVE=>SW_SAVE,Tl_TMIN=>Tl_Tmin,Th_TMAX=>Th_Tmax,
					RESET_ORA=>Reset_Ora, RESET_TEMP=>Reset_Temp,LED=>LED,ALEG=>Aleg,EN_ORA=>en_ora,
					SET_ORA=>Set_Ora,EN_TEMP=>en_temp,SET_Tmin=>Set_Tmin,SET_Tmax=>Set_Tmax);
	
	UE: Unitate_Executie port map(CLK=>CLK,Aleg=>Aleg,en_ora=>en_ora,en_temp=>en_temp,
					Reset_Ora=>Reset_Ora,Reset_Temp=>Reset_Temp,Set_Tmin=>Set_Tmin,
					Set_Tmax=>Set_Tmax,Set_Ora=>Set_Ora,TEMP=>TEMP,Tl_Tmin=>Tl_Tmin,
					Th_Tmax=>Th_Tmax,Anod=>ANOD,Catod=>CATOD);
	
end architecture;

