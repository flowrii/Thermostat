library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_UNSIGNED.all;

entity DCD_to_6B is
	port(U,Z:in std_logic_vector(3 downto 0);
	Rez:out std_logic_vector(5 downto 0));
end entity;

architecture arhi_dcd6B of DCD_to_6B is
begin
	process(U,Z)
	variable Rez_T:std_logic_vector(5 downto 0) := "000000";
	begin
	  	if(Z="0000" and U="0000") --0
			then Rez_T:="000000";
		elsif(Z="0000" and U="0001") --1
			then Rez_T:= "000001";
		elsif(Z="0000" and U="0010") --2
			then Rez_T:= "000010";
		elsif(Z="0000" and U="0011") --3
			then Rez_T:= "000011";
		elsif(Z="0000" and U="0100") --4
			then Rez_T:= "000100";
		elsif(Z="0000" and U="0101") --5
			then Rez_T:= "000101";
		elsif(Z="0000" and U="0110") --6
			then Rez_T:= "000110";
		elsif(Z="0000" and U="0111") --7
			then Rez_T:= "000111";
		elsif(Z="0000" and U="1000") --8
			then Rez_T:= "001000";
		elsif(Z="0000" and U="1001") --9
			then Rez_T:= "001001";
		elsif(Z="0001" and U="0000") --10
			then Rez_T:= "001010";
		elsif(Z="0001" and U="0001") --11
			then Rez_T:= "001011";
		elsif(Z="0001" and U="0010") --12
			then Rez_T:= "001100";
		elsif(Z="0001" and U="0011") --13
			then Rez_T:= "001101";
		elsif(Z="0001" and U="0100") --14
			then Rez_T:= "001110";
		elsif(Z="0001" and U="0101") --15
			then Rez_T:= "001111";
		elsif(Z="0001" and U="0110") --16
			then Rez_T:= "010000";
		elsif(Z="0001" and U="0111") --17
			then Rez_T:= "010001";
		elsif(Z="0001" and U="1000") --18
			then Rez_T:= "010010";
		elsif(Z="0001" and U="1001") --19
			then Rez_T:= "010011";
		elsif(Z="0010" and U="0000") --20
			then Rez_T:= "010100";
		elsif(Z="0010" and U="0001") --21
			then Rez_T:= "010101";
		elsif(Z="0010" and U="0010") --22
			then Rez_T:= "010110";
		elsif(Z="0010" and U="0011") --23
			then Rez_T:= "010111";
		elsif(Z="0010" and U="0100") --24
			then Rez_T:= "011000";
		elsif(Z="0010" and U="0101") --25
			then Rez_T:= "011001";
		elsif(Z="0010" and U="0110") --26
			then Rez_T:= "011010";
		elsif(Z="0010" and U="0111") --27
			then Rez_T:= "011011";
		elsif(Z="0010" and U="1000") --28
			then Rez_T:= "011100";
		elsif(Z="0010" and U="1001") --29
			then Rez_T:= "011101";
		elsif(Z="0011" and U="0000") --30
			then Rez_T:= "011110";
		elsif(Z="0011" and U="0001") --31
			then Rez_T:= "011111";
		end if;	
		Rez<=Rez_T;
end process;
end architecture;