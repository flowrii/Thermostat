library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_UNSIGNED.all; 

entity numarator is
	port(EN: in std_logic;
	CLK: in std_logic;
	MR: in std_logic;   
	CR:out std_logic; 
	Q:out std_logic_vector(3 downto 0));
end entity;

architecture arhi_nr of numarator is
begin
	process(CLK,EN,MR)
	variable T:std_logic_vector(3 downto 0) := "0000";
	variable c:std_logic:='0';
	begin
		if(MR='1') then
			T:="0000";
			c:='0';
		elsif(EN='0') then
			T:=T;
		elsif(CLK'event and CLK='1') then
				T:=T+1;
				if(T="1001") then c:='1';
				else c:='0';
				end if;
				if(T="1010")then T:="0000";
				end if;
		end if;
		CR<=c;
		Q<=T;
	end process;
end architecture;