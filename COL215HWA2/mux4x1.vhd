----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09/01/2024 09:23:49 PM
-- Design Name: 
-- Module Name: mux - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 4-to-1 MUX with 4-bit data inputs
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
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity mux is
    Port (
        sel : in STD_LOGIC_VECTOR(1 downto 0); -- 2-bit selector
        d0  : in STD_LOGIC_VECTOR(3 downto 0); -- 4-bit Data input 0
        d1  : in STD_LOGIC_VECTOR(3 downto 0); -- 4-bit Data input 1
        d2  : in STD_LOGIC_VECTOR(3 downto 0); -- 4-bit Data input 2
        d3  : in STD_LOGIC_VECTOR(3 downto 0); -- 4-bit Data input 3
        y   : out STD_LOGIC_VECTOR(3 downto 0) -- 4-bit Output
    );
end mux;

architecture Behavioral of mux is
begin
    process (sel, d0, d1, d2, d3)
    begin
        case sel is
            when "00" =>
                y <= d0; -- Output d0 when sel is "00"
            when "01" =>
                y <= d1; -- Output d1 when sel is "01"
            when "10" =>
                y <= d2; -- Output d2 when sel is "10"
            when "11" =>
                y <= d3; -- Output d3 when sel is "11"
            when others =>
                y <= (others => '0'); -- Default case (shouldn't be needed)
        end case;
    end process;
end Behavioral;
