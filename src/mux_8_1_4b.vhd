library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity MUX_8_1 is
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
end entity;

architecture ARHITECTURA of MUX_8_1 is 
begin
	process(sel, A0,A1,A2,A3,A4,A5,A6,A7)
	variable t:std_logic_vector(3 downto 0):="0000";
	begin
		case sel is 
			when "000" => t:=A0;
			when "001" => t:=A1;
			when "010" => t:=A2;
			when "011" => t:=A3;
			when "100" => t:=A4;
			when "101" => t:=A5;
			when others => t:="0000";
		end case;
		iesire<=t;
	end process;
end architecture;