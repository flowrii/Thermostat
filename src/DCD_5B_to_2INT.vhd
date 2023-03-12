library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_UNSIGNED.all;

entity DCD_to_2INT is
	port(Temp:in std_logic_vector(4 downto 0);
	T_U,T_Z:out std_logic_vector(3 downto 0));
end entity;

architecture arhi_dcdINT of DCD_to_2INT is
begin
	process(Temp)
	variable TU,TZ:std_logic_vector(3 downto 0) := "0000";
	begin
		case Temp is
			when "00000" => TZ:="0000"; TU:="0000"; --0
			when "00001" => TZ:="0000"; TU:="0001"; --1
			when "00010" => TZ:="0000"; TU:="0010"; --2
			when "00011" => TZ:="0000"; TU:="0011"; --3
			when "00100" => TZ:="0000"; TU:="0100"; --4
			when "00101" => TZ:="0000"; TU:="0101"; --5
			when "00110" => TZ:="0000"; TU:="0110"; --6
			when "00111" => TZ:="0000"; TU:="0111"; --7
			when "01000" => TZ:="0000"; TU:="1000"; --8
			when "01001" => TZ:="0000"; TU:="1001"; --9
			when "01010" => TZ:="0001"; TU:="0000"; --10
			when "01011" => TZ:="0001"; TU:="0001"; --11
			when "01100" => TZ:="0001"; TU:="0010"; --12
			when "01101" => TZ:="0001"; TU:="0011"; --13
			when "01110" => TZ:="0001"; TU:="0100"; --14
			when "01111" => TZ:="0001"; TU:="0101"; --15
			when "10000" => TZ:="0001"; TU:="0110"; --16
			when "10001" => TZ:="0001"; TU:="0111"; --17
			when "10010" => TZ:="0001"; TU:="1000"; --18
			when "10011" => TZ:="0001"; TU:="1001"; --19 
			when "10100" => TZ:="0010"; TU:="0000"; --20
			when "10101" => TZ:="0010"; TU:="0100"; --21
			when "10110" => TZ:="0010"; TU:="0010"; --22
			when "10111" => TZ:="0010"; TU:="0011"; --23
			when "11000" => TZ:="0010"; TU:="0100"; --24
			when "11001" => TZ:="0010"; TU:="0101"; --25
			when "11010" => TZ:="0010"; TU:="0110"; --26
			when "11011" => TZ:="0010"; TU:="0111"; --27
			when "11100" => TZ:="0010"; TU:="1000"; --28
			when "11101" => TZ:="0010"; TU:="1001"; --29
			when "11110" => TZ:="0011"; TU:="0000"; --30
			when "11111" => TZ:="0011"; TU:="0001"; --31
			when others => TU:="1111"; TZ:="1111";
		end case;
		T_U<=TU;
		T_Z<=TZ;
end process;
end architecture;