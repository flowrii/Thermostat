library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity MEMORIE_RAM is
	port ( A_RAM: in STD_LOGIC_VECTOR (5 downto 0);	
	WE_RAM: in STD_LOGIC;
	CS_RAM: in STD_LOGIC;
	I_RAM: in STD_LOGIC_VECTOR(4 downto 0);	  
	D_RAM: out STD_LOGIC_VECTOR(4 downto 0));	  
end entity;

architecture COMPORTAMENTALA of memorie_ram is 
type MEMORIE is array (0  to 47) of STD_LOGIC_VECTOR (4 downto 0);
signal MEM:MEMORIE := ("01111", "01111", "01111", "01111", "01111", "01111", "01111", "01111",
					   "01111", "01111", "01111", "01111", "01111", "01111", "01111", "01111",
					   "01111", "01111", "01111", "01111", "01111", "01111", "01111", "01111",
					   "11111", "11111", "11111", "11111", "11111", "11111", "11111", "11111",
					   "11111", "11111", "11111", "11111", "11111", "11111", "11111", "11111",
					   "11111", "11111", "11111", "11111", "11111", "11111", "11111", "11111");
begin
	process(I_RAM,A_RAM,WE_RAM,CS_RAM) 
	begin
		if CS_RAM='1' then
			if WE_RAM='0' then
				case A_RAM is
					when "000000" => D_RAM<=MEM(0);
					when "000001" => D_RAM<=MEM(1);
					when "000010" => D_RAM<=MEM(2);
					when "000011" => D_RAM<=MEM(3);
					when "000100" => D_RAM<=MEM(4);
					when "000101" => D_RAM<=MEM(5);
					when "000110" => D_RAM<=MEM(6);
					when "000111" => D_RAM<=MEM(7);
					when "001000" => D_RAM<=MEM(8);
					when "001001" => D_RAM<=MEM(9);
					when "001010" => D_RAM<=MEM(10);
					when "001011" => D_RAM<=MEM(11);
					when "001100" => D_RAM<=MEM(12);
					when "001101" => D_RAM<=MEM(13);
					when "001110" => D_RAM<=MEM(14);
					when "001111" => D_RAM<=MEM(15);
					when "010000" => D_RAM<=MEM(16);
					when "010001" => D_RAM<=MEM(17);
					when "010010" => D_RAM<=MEM(18);
					when "010011" => D_RAM<=MEM(19);
					when "010100" => D_RAM<=MEM(20);
					when "010101" => D_RAM<=MEM(21);
					when "010110" => D_RAM<=MEM(22);
					when "010111" => D_RAM<=MEM(23);
					when "011000" => D_RAM<=MEM(24);
					when "011001" => D_RAM<=MEM(25);
					when "011010" => D_RAM<=MEM(26);
					when "011011" => D_RAM<=MEM(27);
					when "011100" => D_RAM<=MEM(28);
					when "011101" => D_RAM<=MEM(29);
					when "011110" => D_RAM<=MEM(30);
					when "011111" => D_RAM<=MEM(31);
					when "100000" => D_RAM<=MEM(32);
					when "100001" => D_RAM<=MEM(33);
					when "100010" => D_RAM<=MEM(34);
					when "100011" => D_RAM<=MEM(35);
					when "100100" => D_RAM<=MEM(36);
					when "100101" => D_RAM<=MEM(37);
					when "100110" => D_RAM<=MEM(38);
					when "100111" => D_RAM<=MEM(39);
					when "101000" => D_RAM<=MEM(40);
					when "101001" => D_RAM<=MEM(41);
					when "101010" => D_RAM<=MEM(42);
					when "101011" => D_RAM<=MEM(43);
					when "101100" => D_RAM<=MEM(44);
					when "101101" => D_RAM<=MEM(45);
					when "101110" => D_RAM<=MEM(46);
					when "101111" => D_RAM<=MEM(47);
					when others => D_RAM<="11111";
				end case;
			elsif WE_RAM='1' then
				case A_RAM is
					when "000000" => MEM(0)<=I_RAM;
					when "000001" => MEM(1)<=I_RAM;
					when "000010" => MEM(2)<=I_RAM;
					when "000011" => MEM(3)<=I_RAM;
					when "000100" => MEM(4)<=I_RAM;
					when "000101" => MEM(5)<=I_RAM;
					when "000110" => MEM(6)<=I_RAM;
					when "000111" => MEM(7)<=I_RAM;
					when "001000" => MEM(8)<=I_RAM;
					when "001001" => MEM(9)<=I_RAM;
					when "001010" => MEM(10)<=I_RAM;
					when "001011" => MEM(11)<=I_RAM;
					when "001100" => MEM(12)<=I_RAM;
					when "001101" => MEM(13)<=I_RAM;
					when "001110" => MEM(14)<=I_RAM;
					when "001111" => MEM(15)<=I_RAM;
					when "010000" => MEM(16)<=I_RAM;
					when "010001" => MEM(17)<=I_RAM;
					when "010010" => MEM(18)<=I_RAM;
					when "010011" => MEM(19)<=I_RAM;
					when "010100" => MEM(20)<=I_RAM;
					when "010101" => MEM(21)<=I_RAM;
					when "010110" => MEM(22)<=I_RAM;
					when "010111" => MEM(23)<=I_RAM;
					when "011000" => MEM(24)<=I_RAM;
					when "011001" => MEM(25)<=I_RAM;
					when "011010" => MEM(26)<=I_RAM;
					when "011011" => MEM(27)<=I_RAM;
					when "011100" => MEM(28)<=I_RAM;
					when "011101" => MEM(29)<=I_RAM;
					when "011110" => MEM(30)<=I_RAM;
					when "011111" => MEM(31)<=I_RAM;
					when "100000" => MEM(32)<=I_RAM;
					when "100001" => MEM(33)<=I_RAM;
					when "100010" => MEM(34)<=I_RAM;
					when "100011" => MEM(35)<=I_RAM;
					when "100100" => MEM(36)<=I_RAM;
					when others => MEM(37)<=I_RAM;
				end case;
			end if;
		elsif CS_RAM='0' then D_RAM<="11111";
			
		end if;
	end process;
end architecture;