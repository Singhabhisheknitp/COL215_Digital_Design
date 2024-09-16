----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09/01/2024 10:45:00 PM
-- Design Name: counter4digit
-- Module Name: counter4digit - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: Top-level design integrating mux, decoder7seg, and timer with 4-digit counter
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

entity counter4digit is
    Port (
        clk    : in STD_LOGIC; -- Clock input
        reset  : in STD_LOGIC; -- Reset input
        d0     : in STD_LOGIC_VECTOR(3 downto 0); -- 4-bit Data input 0
        d1     : in STD_LOGIC_VECTOR(3 downto 0); -- 4-bit Data input 1
        d2     : in STD_LOGIC_VECTOR(3 downto 0); -- 4-bit Data input 2
        d3     : in STD_LOGIC_VECTOR(3 downto 0); -- 4-bit Data input 3
        seg    : out STD_LOGIC_VECTOR(6 downto 0); -- 7-segment display output
        anode_out: out STD_LOGIC_VECTOR(3 downto 0)
    );
end counter4digit;



architecture Behavioral of counter4digit is

-- Component Declarations
component mux is
    Port (
        sel : in STD_LOGIC_VECTOR(1 downto 0); -- 2-bit selector
        d0  : in STD_LOGIC_VECTOR(3 downto 0); -- 4-bit Data input 0
        d1  : in STD_LOGIC_VECTOR(3 downto 0); -- 4-bit Data input 1
        d2  : in STD_LOGIC_VECTOR(3 downto 0); -- 4-bit Data input 2
        d3  : in STD_LOGIC_VECTOR(3 downto 0); -- 4-bit Data input 3
        y   : out STD_LOGIC_VECTOR(3 downto 0) -- 4-bit Output
    );
end component;

component decoder7seg is
    Port (
        sw : in STD_LOGIC_VECTOR(3 downto 0); -- 4-bit binary input
        seg : out STD_LOGIC_VECTOR(6 downto 0) -- 7-segment display output
    );
end component;

component timer is
    Port (
        clk_in : in STD_LOGIC;
        reset : in STD_LOGIC;
        anode_out: out STD_LOGIC_VECTOR(3 downto 0);
        mux_select : out STD_LOGIC_VECTOR (1 downto 0) -- Signal for the mux
    );
end component;

    -- Signals for interconnecting components
    signal mux_sel       : STD_LOGIC_VECTOR(1 downto 0); --timer to mux
    signal mux_y         : STD_LOGIC_VECTOR(3 downto 0);  --mux to 7seg
    

begin

    -- Instantiate the timer
    u_timer: timer
        Port map (
            clk_in => clk,
            reset => reset,
            anode_out => anode_out,
            mux_select => mux_sel
        );

    -- Instantiate the mux
    u_mux: mux
        Port map (
            sel => mux_sel,
            d0 => d0,
            d1 => d1,
            d2 => d2,
            d3 => d3,
            y => mux_y
        );

    -- Instantiate the decoder7seg
    u_decoder7seg: decoder7seg
        Port map (
            sw => mux_y, -- 4-bit output from the mux
            seg => seg -- 7-segment display output
        );

end Behavioral;
