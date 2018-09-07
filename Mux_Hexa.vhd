----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    09:55:26 09/01/2018 
-- Design Name: 
-- Module Name:    Mux_Hexa - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Mux_Hexa is

	port(
		
		clk, reset:in std_logic;
		cont: in std_logic_vector(15 downto 0); 
		sseg:out std_logic_vector(7 downto 0);
		an:out std_logic_vector(3 downto 0)
	);
	
end Mux_Hexa;

architecture Behavioral of Mux_Hexa is
	
	signal r_reg, r_next: unsigned(17 downto 0);
	signal hexa1, hexa2, hexa3, hexa4, hexa_out: std_logic_vector(3 downto 0);

begin	
		
	hexa1 <= cont(3 downto 0);
	hexa2 <= cont(7 downto 4);
	hexa3 <= cont(11 downto 8);
	hexa4 <= cont(15 downto 12);
	
	process(clk, reset)
	begin
		if(reset='1') then
			r_reg <= (others=>'0');
		elsif(clk'event and clk='1') then
			r_reg <= r_next;
		end if;
	end process;
	
	r_next <= r_reg+1;
	
	hexa_out <= hexa1 when r_reg(17 downto 16)="00" else
					hexa2 when r_reg(17 downto 16)="01" else
					hexa3 when r_reg(17 downto 16)="10" else
					hexa4;
	
	an <= "0111" when r_reg(17 downto 16)="11" else
			"1110" when r_reg(17 downto 16)="00" else
			"1101" when r_reg(17 downto 16)="01" else 
			"1011";
				 
	ssegment: entity work.Hexsseg(Behavioral)
	port map(sseg=>sseg, hex=>hexa_out);
	
end Behavioral;

