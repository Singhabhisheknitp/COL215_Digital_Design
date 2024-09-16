----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09/01/2024 10:10:00 PM
-- Design Name: 
-- Module Name: tb_decoder7seg
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: Testbench for the 4-bit to 7-segment decoder
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

entity tb_decoder7seg is
--  Testbench does not have any ports
end tb_decoder7seg;

architecture behavior of tb_decoder7seg is

    -- Component Declaration
    component decoder7seg
        Port (
            sw : in STD_LOGIC_VECTOR(3 downto 0); -- 4-bit binary input
            seg : out STD_LOGIC_VECTOR(6 downto 0) -- 7-segment display output
        );
    end component;

    -- Signals for connecting to the DUT (Device Under Test)
    signal sw : STD_LOGIC_VECTOR(3 downto 0);
    signal seg : STD_LOGIC_VECTOR(6 downto 0);

begin
    -- Instantiate the Device Under Test (DUT)
    uut: decoder7seg
        Port map (
            sw => sw,
            seg => seg
        );

    -- Testbench process to generate stimulus
    stimulus: process
    begin
        -- Test case 1
        sw <= "0000"; -- Should display 0
        wait for 10 ns;

        -- Test case 2
        sw <= "0001"; -- Should display 1
        wait for 10 ns;

        -- Test case 3
        sw <= "0010"; -- Should display 2
        wait for 10 ns;

        -- Test case 4
        sw <= "0011"; -- Should display 3
        wait for 10 ns;

        -- Test case 5
        sw <= "0100"; -- Should display 4
        wait for 10 ns;

        -- Test case 6
        sw <= "0101"; -- Should display 5
        wait for 10 ns;

        -- Test case 7
        sw <= "0110"; -- Should display 6
        wait for 10 ns;

        -- Test case 8
        sw <= "0111"; -- Should display 7
        wait for 10 ns;

        -- Test case 9
        sw <= "1000"; -- Should display 8
        wait for 10 ns;

        -- Test case 10
        sw <= "1001"; -- Should display 9
        wait for 10 ns;

        -- Test case 11
        sw <= "1010"; -- Should display A
        wait for 10 ns;

        -- Test case 12
        sw <= "1011"; -- Should display B
        wait for 10 ns;

        -- Test case 13
        sw <= "1100"; -- Should display C
        wait for 10 ns;

        -- Test case 14
        sw <= "1101"; -- Should display D
        wait for 10 ns;

        -- Test case 15
        sw <= "1110"; -- Should display E
        wait for 10 ns;

        -- Test case 16
        sw <= "1111"; -- Should display F
        wait for 10 ns;

        -- End of simulation
        wait;
    end process;

end behavior;
