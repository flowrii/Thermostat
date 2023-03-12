library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_UNSIGNED.all;

entity DCD_to_5B is
	port(U,Z:in std_logic_vector(3 downto 0);
	Rez:out std_logic_vector(4 downto 0));
end entity;

architecture arhi_dcd5B of DCD_to_5B is
begin
	process(U,Z)
	variable Rez_T:std_logic_vector(4 downto 0) := "00000";
	begin
	  	if(Z="0000" and U="0000") --0
			then Rez_T:="00000";
		elsif(Z="0000" and U="0001") --1
			then Rez_T:= "00001";
		elsif(Z="0000" and U="0010") --2
			then Rez_T:= "00010";
		elsif(Z="0000" and U="0011") --3
			then Rez_T:= "00011";
		elsif(Z="0000" and U="0100") --4
			then Rez_T:= "00100";
		elsif(Z="0000" and U="0101") --5
			then Rez_T:= "00101";
		elsif(Z="0000" and U="0110") --6
			then Rez_T:= "00110";
		elsif(Z="0000" and U="0111") --7
			then Rez_T:= "00111";
		elsif(Z="0000" and U="1000") --8
			then Rez_T:= "01000";
		elsif(Z="0000" and U="1001") --9
			then Rez_T:= "01001";
		elsif(Z="0001" and U="0000") --10
			then Rez_T:= "01010";
		elsif(Z="0001" and U="0001") --11
			then Rez_T:= "01011";
		elsif(Z="0001" and U="0010") --12
			then Rez_T:= "01100";
		elsif(Z="0001" and U="0011") --13
			then Rez_T:= "01101";
		elsif(Z="0001" and U="0100") --14
			then Rez_T:= "01110";
		elsif(Z="0001" and U="0101") --15
			then Rez_T:= "01111";
		elsif(Z="0001" and U="0110") --16
			then Rez_T:= "10000";
		elsif(Z="0001" and U="0111") --17
			then Rez_T:= "10001";
		elsif(Z="0001" and U="1000") --18
			then Rez_T:= "10010";
		elsif(Z="0001" and U="1001") --19
			then Rez_T:= "10011";
		elsif(Z="0010" and U="0000") --20
			then Rez_T:= "10100";
		elsif(Z="0010" and U="0001") --21
			then Rez_T:= "10101";
		elsif(Z="0010" and U="0010") --22
			then Rez_T:= "10110";
		elsif(Z="0010" and U="0011") --23
			then Rez_T:= "10111";
		elsif(Z="0010" and U="0100") --24
			then Rez_T:= "11000";
		elsif(Z="0010" and U="0101") --25
			then Rez_T:= "11001";
		elsif(Z="0010" and U="0110") --26
			then Rez_T:= "11010";
		elsif(Z="0010" and U="0111") --27
			then Rez_T:= "11011";
		elsif(Z="0010" and U="1000") --28
			then Rez_T:= "11100";
		elsif(Z="0010" and U="1001") --29
			then Rez_T:= "11101";
		elsif(Z="0011" and U="0000") --30
			then Rez_T:= "11110";
		elsif(Z="0011" and U="0001") --31
			then Rez_T:= "11111";
		end if;	
		Rez<=Rez_T;
end process;
end architecture;