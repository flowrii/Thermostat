library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity MUX_2_1 is
	port(A: in std_logic_vector(3 downto 0);
		B: in std_logic_vector(3 downto 0);
		sel: in std_logic;
		iesire:	out std_logic_vector(3 downto 0));
end entity;

architecture ARHITECTURA of MUX_2_1 is 
begin
	process(sel, A, B)
	variable t:std_logic_vector(3 downto 0):="0000";
	begin
		 if(sel='0')then
			t:=A;
		else
			t:=B;
		end if;
		iesire<=t;
	end process;
end architecture;
