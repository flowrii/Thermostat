library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity Divizor is
	port(CLK1:in std_logic;
	CLK2: out std_logic);
end entity;

architecture arhitectura of Divizor is
signal ct: integer:=0;
signal front: std_logic:='0';
begin
	process(Clk1)
	begin
		if(CLK1'event and CLK1='1') then
			ct<=ct+1;
		end if;
		if(ct=(5e7)-1) then
			front<=not(front);
			ct<=0;
		end if;
		CLK2<=front;
 	 end process;
end architecture;