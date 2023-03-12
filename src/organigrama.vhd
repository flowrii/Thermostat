library ieee;
use ieee.std_logic_1164.all;

entity Organigrama is
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
end entity;

architecture termo of Organigrama is
type STARE_T is (A,B,C,D,E,F,G,H);
signal STARE, NXSTARE: STARE_T;
begin
	ACTUALIZEAZA_STARE: process(CLK)
	begin
		if(CLK'EVENT and CLK='1') then
			STARE<=NXSTARE;
		end if;
	end process ACTUALIZEAZA_STARE;
	
	STARE_URM: process(STARE,SW_ALEG_ORA, BTN_ALEG_ORA, SW_SET_ORA,
	BTN_TEMP, SW_SET_TEMP, SW_MIN_MAX, SW_SAVE, Tl_TMIN, Th_TMAX)
	begin
		case STARE is
		when A =>
			if(SW_ALEG_ORA='1') then NXSTARE<=C;
			else NXSTARE<=B;
			end if;
		when B =>
			if(Tl_TMIN='1')then NXSTARE<=H;
			else NXSTARE<=A;
			end if;	
		when H =>			
			if(Th_TMAX='1')then NXSTARE<=A;
			else NXSTARE<=H;
			end if;
		when C =>
			if(BTN_ALEG_ORA='1')then NXSTARE<=C;
			else NXSTARE<=D;
			end if;
		when D =>
			if(SW_SET_ORA='1')then NXSTARE<=E;
			else NXSTARE<=C;
			end if;
		when E =>
			if(BTN_TEMP='1')then NXSTARE<=E;
			else NXSTARE<=F;
			end if;
		when F =>
			if(SW_SET_TEMP='1')then NXSTARE<=G;
			else NXSTARE<=E;
			end if;
		when G =>
			if(SW_MIN_MAX='1' and SW_SAVE='1')then NXSTARE<=A;
			elsif(SW_MIN_MAX='1' and SW_SAVE='0')then NXSTARE<=G;
			elsif(SW_MIN_MAX='0' and SW_SAVE='1')then NXSTARE<=A;
			else NXSTARE<=G;
			end if;
		end case;
	end process STARE_URM;
	
	IESIRI:process(STARE,SW_ALEG_ORA, BTN_ALEG_ORA, SW_SET_ORA,
	BTN_TEMP, SW_SET_TEMP, SW_MIN_MAX, SW_SAVE, Tl_TMIN, Th_TMAX)
	begin	
			RESET_ORA<='0'; RESET_TEMP<='0'; LED<='0';
			EN_ORA<='0';
			EN_TEMP<='0'; 
			if(NXSTARE=A) then 
				RESET_ORA<='1'; RESET_TEMP<='1'; 
				LED<='0'; 
				ALEG<='0';
				SET_ORA<='0';
				SET_Tmin<='0'; SET_Tmax<='0'; 
				if(SW_ALEG_ORA='1') then ALEG<='1';
				end if;
			elsif(NXSTARE=C) then
				if(BTN_ALEG_ORA='1')then EN_ORA<='1';
				else EN_ORA<='0';
			 	end if;
			elsif(NXSTARE=D) then
				if(SW_SET_ORA='1')then SET_ORA<='1';
				else SET_ORA<='0';
			 	end if;
			elsif(NXSTARE=E) then
				if(BTN_TEMP='1')then EN_TEMP<='1';
				else EN_TEMP<='0';
			 	end if;
			elsif(NXSTARE=G) then 
				if(SW_MIN_MAX='1' and SW_SAVE='1')then SET_Tmax<='1';
				elsif(SW_MIN_MAX='0' and SW_SAVE='1')then SET_Tmin<='1';
				else SET_Tmax<='0'; SET_Tmin<='0';
				end if;
			elsif(NXSTARE=H)then LED<='1';
			end if;
	end process IESIRI;		
end termo;
	