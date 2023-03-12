library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_UNSIGNED.all;

entity DCD_Anod is
	port(ANOD:in std_logic_vector(5 downto 0);
	SEL:out std_logic_vector(2 downto 0));
end entity;

architecture arhi_dcd of DCD_Anod is
begin
	process(ANOD)
	variable T:std_logic_vector(2 downto 0) := "111";
	begin
		case ANOD is
			when "111110" => T:="000"; 
			when "111101" => T:="001"; 
			when "111011" => T:="010"; 
			when "110111" => T:="011";
			when "101111" => T:="100"; 
			when "011111" => T:="101"; 
			when others => T:="111";
		end case;
		SEL<=T;
end process;
end architecture;
	
