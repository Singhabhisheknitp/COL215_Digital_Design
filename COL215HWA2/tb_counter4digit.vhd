----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09/01/2024 11:00:00 PM
-- Design Name: Testbench for counter4digit
-- Module Name: tb_counter4digit
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: Testbench for the counter4digit top-level design.
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

entity tb_counter4digit is
end tb_counter4digit;

architecture Behavioral of tb_counter4digit is

    -- Component Declaration for the Unit Under Test (UUT)
    component counter4digit is
        Port (
            clk        : in  STD_LOGIC;
            reset      : in  STD_LOGIC;
            d0         : in  STD_LOGIC_VECTOR(3 downto 0);
            d1         : in  STD_LOGIC_VECTOR(3 downto 0);
            d2         : in  STD_LOGIC_VECTOR(3 downto 0);
            d3         : in  STD_LOGIC_VECTOR(3 downto 0);
            seg        : out STD_LOGIC_VECTOR(6 downto 0);
            anode_out  : out STD_LOGIC_VECTOR(3 downto 0)
        );
    end component;

    -- Testbench signals
    signal clk       : STD_LOGIC := '0';
    signal reset     : STD_LOGIC := '0';
    signal d0        : STD_LOGIC_VECTOR(3 downto 0) := (others => '0');
    signal d1        : STD_LOGIC_VECTOR(3 downto 0) := (others => '0');
    signal d2        : STD_LOGIC_VECTOR(3 downto 0) := (others => '0');
    signal d3        : STD_LOGIC_VECTOR(3 downto 0) := (others => '0');
    signal seg       : STD_LOGIC_VECTOR(6 downto 0);
    signal anode_out : STD_LOGIC_VECTOR(3 downto 0);

    -- Clock generation process
    constant clk_period : time := 10 ns;

begin

    -- Instantiate the Unit Under Test (UUT)
    uut: counter4digit
        Port map (
            clk        => clk,
            reset      => reset,
            d0         => d0,
            d1         => d1,
            d2         => d2,
            d3         => d3,
            seg        => seg,
            anode_out  => anode_out
        );

    -- Clock generation
    clk_process : process
    begin
        while true loop
            clk <= '0';
            wait for clk_period/2;
            clk <= '1';
            wait for clk_period/2;
        end loop;
    end process;

    -- Stimulus process
    stimulus_process : process
    begin
        -- Initialize Inputs
        reset <= '0';
        d0 <= "0001"; -- Display 1 on 7-segment
        d1 <= "0010"; -- Display 2 on 7-segment
        d2 <= "0100"; -- Display 4 on 7-segment
        d3 <= "1000"; -- Display 8 on 7-segment

        -- Apply reset
        reset <= '1';
        wait for 20 ns;
        reset <= '0';

        -- Wait for a few clock cycles
        wait for 100 ns;

        -- Stimulate inputs, if needed

        -- End simulation
        wait;
    end process;

end Behavioral;
