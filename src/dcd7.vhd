library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_UNSIGNED.all;

entity DCD7 is
	port(INFO:in std_logic_vector(3 downto 0);
	CATOD:out std_logic_vector(6 downto 0));
end entity;

architecture arhi_dcd of DCD7 is
begin
	process(INFO)
	variable T:std_logic_vector(6 downto 0) := "0000000";
	begin
		case INFO is
			when "0000" => T:="0000001"; --0
			when "0001" => T:="1001111"; --1
			when "0010" => T:="0010010"; --2
			when "0011" => T:="0000110"; --3
			when "0100" => T:="1001100"; --4
			when "0101" => T:="0100100"; --5
			when "0110" => T:="0100000"; --6
			when "0111" => T:="0001111"; --7
			when "1000" => T:="0000000"; --8
			when "1001" => T:="0000100"; --9
			when others => T:="1111111";
		end case;
		CATOD<=T;
end process;
end architecture;
	
