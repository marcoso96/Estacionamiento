----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    08:55:54 08/24/2018 
-- Design Name: 
-- Module Name:    TopContadorcito - Behavioral 
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

entity TopContadorcito is
	generic(N: integer :=16);
	
	port(
		clk, reset:in std_logic;
		up: in std_logic;
		down: in std_logic;
		q_o: out std_logic_vector(N-1 downto 0)
	);
	
end TopContadorcito;	

architecture Behavioral of TopContadorcito is
	
	signal r_reg: unsigned(N-1 downto 0);
	signal r_next: unsigned(N-1 downto 0);

begin
	--registro de evento
	process(clk, reset)
	begin
		if(reset='1') then
			r_reg<=(others=>'0');
		elsif(clk'event and clk='1') then
			r_reg<=r_next;
		end if;
	end process;
	
	r_next<=r_reg + 1 when up='1' and down='0' else
			 r_reg - 1 when down='1' and up='0' else
			 r_reg;
	
	q_o <= std_logic_vector(r_reg);

end Behavioral;

