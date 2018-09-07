----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:09:36 08/29/2018 
-- Design Name: 
-- Module Name:    Parking - Behavioral 
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
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Parking is
	
	port(
		clk, reset:in std_logic;
		a,b: in std_logic;
		salida, entrada: out std_logic
	);

end Parking;

	architecture Behavioral of Parking is

	type state_type is (zero, one_in, two_in,three_in, entro, one_out, two_out, three_out, salio);
	signal state_reg, state_next: state_type;

begin
	
	process(clk, reset)
	begin
		if(reset='1') then
			state_reg <= zero;
		elsif(clk'event and clk='1') then
			state_reg <= state_next;
		end if;
	end process;
	
	--logica de estado siguiente
	process(state_reg, a, b)
	begin 
		--entrada, a/b se pone en 1 cuando entra un auto
		state_next <= state_reg;
		case state_reg is
			when zero =>
				if a='1' and  b='0' then
					state_next <= one_in;			
				elsif a='0' and  b='1' then
					state_next <= one_out;					
				end if;
			when one_in =>
				if a='1' and b='1' then 
					state_next <= two_in;
				elsif a='0' and b='0' then
					state_next <= zero;
				end if;
			when two_in =>
				if a='0' and b='1' then 
					state_next <= three_in;
				elsif a='1' and b='0' then
					state_next <= one_in;
				end if;
			when three_in =>
				if a='0' and b='0' then 
					state_next <= entro;
				elsif a='1' and b='1' then
					state_next <= two_in;
				end if;
			when one_out =>
				if a='1' and b='1' then 
					state_next <= two_out;
				elsif a='0' and b='0' then
					state_next <= zero;
				end if;
			when two_out =>
				if a='1' and b='0' then 
					state_next <= three_out;
				elsif a='0' and b='1' then
					state_next <= one_in;
				end if;
			when three_out =>
				if a='0' and b='0' then 
					state_next <= salio;
				elsif a='1' and b='1' then
					state_next <= two_in;
				end if;
			when others =>
				state_next <= zero;
		end case;
	end process;
				
	--logica de salida
	process(state_reg)
	begin
		entrada<='0';
		salida<='0';
		
		case state_reg is 
			when entro =>
				entrada<='1';
			
			when salio=>
				salida<='1';
			when others=>
				entrada<='0';
				salida<='0';
		end case;
	end process;
			
			
end Behavioral;

