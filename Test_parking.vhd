--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   14:22:01 09/01/2018
-- Design Name:   
-- Module Name:   C:/Documents and Settings/Estacionamiento/Test_parking.vhd
-- Project Name:  Estacionamiento
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Parking
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
USE ieee.numeric_std.ALL;
 
ENTITY Test_parking IS
END Test_parking;
 
ARCHITECTURE behavior OF Test_parking IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Parking
    PORT(
         clk : IN  std_logic;
         reset : IN  std_logic;
         a : IN  std_logic;
         b : IN  std_logic;
         salida : OUT  std_logic;
         entrada : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal reset : std_logic := '0';
   signal a : std_logic := '0';
   signal b : std_logic := '0';

 	--Outputs
   signal salida : std_logic;
   signal entrada : std_logic;

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Parking PORT MAP (
          clk => clk,
          reset => reset,
          a => a,
          b => b,
          salida => salida,
          entrada => entrada
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      
		
		reset<='1';
		wait for 15 ns;
		assert salida='0' and entrada='0' report "el reset fallo" severity failure;
		
		wait for 15 ns;
      
      reset<='0';
		a<='1';
		wait for 30 ns;
		b<='1';
		wait for 30 ns;
		a<='0';
		wait for 30 ns;
		b<='0';
		wait for 10 ns;
		assert entrada='1' report "la entrada fallo" severity failure;
		
		assert false report "todo bien :D" severity failure;
		
   end process;
	
	
END;
