----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:56:16 08/28/2018 
-- Design Name: 
-- Module Name:    Display - Behavioral 
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

entity Hexasseg is
	
	port(
		in1, in2, in3, in4: in std_logic_vector(7 downto 0);
		sw: in std_logic;
		btn: in std_logic_vector(3 downto 0);
		clk, reset:in std_logic;
		sseg: out std_logic_vector(7 downto 0);
		an: out std_logic;
	);
	
end Hexasseg;

architecture Behavioral of Hexasseg is

	signal r_reg, r_next:unsigned(1 downto 0);
		
begin
	
	process(clk, reset)
	begin
		if(reset='1') then
			r_reg<=(others=>'0');
		elsif(clk'event and clk='1') then
			r_reg<=r_next;
		end if;
	end process;
	
	sseg <= in1 when r_reg="00" else
			  in2 when r_reg="01" else
			  in3 when r_reg="10" else
			  in4 when r_reg="11";
	
	r_next<="00" when r_reg="11" else 
				r_reg+1;
				
	an<=std_logic_vector(r_reg);
		


end Behavioral;

