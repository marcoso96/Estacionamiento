--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   13:44:24 09/04/2018
-- Design Name:   
-- Module Name:   C:/Documents and Settings/Estacionamiento/Test_contador.vhd
-- Project Name:  Estacionamiento
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: TopContadorcito
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
 
ENTITY Test_contador IS
END Test_contador;
 
ARCHITECTURE behavior OF Test_contador IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT TopContadorcito
    PORT(
         clk : IN  std_logic;
         reset : IN  std_logic;
         up : IN  std_logic;
         down : IN  std_logic;
         q_o : OUT  std_logic_vector(15 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal reset : std_logic := '0';
   signal up : std_logic := '0';
   signal down : std_logic := '0';

 	--Outputs
   signal q_o : std_logic_vector(15 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
	signal comparador: unsigned(15 downto 0);
	shared variable comp : integer := 0;	
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: TopContadorcito PORT MAP (
          clk => clk,
          reset => reset,
          up => up,
          down => down,
          q_o => q_o
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
      -- hold reset state for 100 ns.	
	
		reset <= '1';
		wait for 10 ns;	
		assert q_o="0000000000000000" report "no anduvo el reset" severity failure;
		
      wait for clk_period*2;

      -- insert stimulus here 

      reset<='0';
		
		for avar in 0 to 30 loop 
			
			up<='1';
			assert avar=unsigned(q_o) report "Mal" severity failure;
						
			wait for clk_period;
			
		end loop;
		
		up<='0';
		reset<='1';
		wait for clk_period;
		
		reset<='0';
		
		for avar in 0 to 30 loop 
			
			down<='1';
			comp:=(65535-avar);
								
			wait for clk_period;
			assert comp=unsigned(q_o) report "Mal down" severity failure;
			
		end loop;
		
		assert false report "joyita Palacio" severity failure;
   
	end process;
	
	
END;
