----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:36:44 09/01/2018 
-- Design Name: 
-- Module Name:    Completito - Behavioral 
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

entity Completito is
	
	port(
		clk, reset:in std_logic;
		sw:in std_logic_vector(1 downto 0);
		sseg: out std_logic_vector(7 downto 0);
		an:out std_logic_vector(3 downto 0)
	);
	
end Completito;

architecture Behavioral of Completito is
	
	signal deb: std_logic_vector(1 downto 0);
	signal increment, decrement: std_logic;
	signal cont:std_logic_vector(15 downto 0);

begin
	
	debouncer1:entity work.db_fsm(arch)
	port map(clk=>clk, reset=>reset, sw=>sw(0), db=>deb(0));
	
	debouncer2:entity work.db_fsm(arch)
	port map(clk=>clk, reset=>reset, sw=>sw(1), db=>deb(1));
	
	parking:entity work.Parking(Behavioral)
	port map(clk=>clk, reset=>reset, a=>deb(0), b=>deb(1), entrada=>increment, salida=>decrement);
	
	contador:entity work.TopContadorcito(Behavioral)
	port map(clk=>clk, reset=>reset, up=>increment, down=>decrement, q_o=>cont);
	
	hex:entity work.Mux_Hexa(Behavioral)
	port map(clk=>clk, reset=>reset, cont=>cont, sseg=>sseg, an=>an);
	
	
end Behavioral;

