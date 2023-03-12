library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity registru is
	port(CLK:in std_logic;
	Q:out std_logic_vector(5 downto 0));
end entity;

architecture comportamentala of registru is
begin
	process (CLK)
	variable T:std_logic_vector(5 downto 0):="111110";
	variable l:std_logic:='1';
	begin
		l:=T(5);
		if(l='0') then
			if(CLK'event and CLK='0') then
				T:="111110";
			end if;
		else
			if(CLK'event and CLK='0') then
				T(5):=T(4);T(4):=T(3);T(3):=T(2);T(2):=T(1);T(1):=T(0);T(0):='1';	
			end if;
		end if;
		Q<=T;
	end process;
end architecture;
				