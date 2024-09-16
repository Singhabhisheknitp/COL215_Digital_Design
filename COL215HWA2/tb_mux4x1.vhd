----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09/01/2024 09:23:49 PM
-- Design Name: 
-- Module Name: mux_tb
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: Testbench for 4-to-1 MUX with 4-bit data inputs
-- 
-- Dependencies: mux.vhdl
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mux_tb is
end mux_tb;

architecture behavior of mux_tb is

    -- Component Declaration for the Unit Under Test (UUT)
    component mux
        Port (
            sel : in STD_LOGIC_VECTOR(1 downto 0); -- 2-bit selector
            d0  : in STD_LOGIC_VECTOR(3 downto 0); -- 4-bit Data input 0
            d1  : in STD_LOGIC_VECTOR(3 downto 0); -- 4-bit Data input 1
            d2  : in STD_LOGIC_VECTOR(3 downto 0); -- 4-bit Data input 2
            d3  : in STD_LOGIC_VECTOR(3 downto 0); -- 4-bit Data input 3
            y   : out STD_LOGIC_VECTOR(3 downto 0) -- 4-bit Output
        );
    end component;

    -- Inputs
    signal sel : STD_LOGIC_VECTOR(1 downto 0);
    signal d0  : STD_LOGIC_VECTOR(3 downto 0);
    signal d1  : STD_LOGIC_VECTOR(3 downto 0);
    signal d2  : STD_LOGIC_VECTOR(3 downto 0);
    signal d3  : STD_LOGIC_VECTOR(3 downto 0);
    
    -- Output
    signal y   : STD_LOGIC_VECTOR(3 downto 0);

begin

    -- Instantiate the Unit Under Test (UUT)
    uut: mux
        Port Map (
            sel => sel,
            d0  => d0,
            d1  => d1,
            d2  => d2,
            d3  => d3,
            y   => y
        );

    -- Testbench Process
    stimulus: process
    begin
        -- Initialize Inputs
        sel <= "00"; d0 <= "0001"; d1 <= "0010"; d2 <= "0100"; d3 <= "1000";
        wait for 10 ns;
        
        -- Test case 1: Select d0
        sel <= "00";
        wait for 10 ns;
        assert (y = "0001") report "Error: Test case 1 failed" severity error;

        -- Test case 2: Select d1
        sel <= "01";
        wait for 10 ns;
        assert (y = "0010") report "Error: Test case 2 failed" severity error;

        -- Test case 3: Select d2
        sel <= "10";
        wait for 10 ns;
        assert (y = "0100") report "Error: Test case 3 failed" severity error;

        -- Test case 4: Select d3
        sel <= "11";
        wait for 10 ns;
        assert (y = "1000") report "Error: Test case 4 failed" severity error;

        -- Finish simulation
        wait;
    end process;

end behavior;
