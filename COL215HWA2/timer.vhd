library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity timer is
    Port (
        clk_in : in STD_LOGIC;
        reset : in STD_LOGIC;
        anode_out: out STD_LOGIC_VECTOR(3 downto 0);
        mux_select : out STD_LOGIC_VECTOR (1 downto 0) -- Signal for the mux
--        
    );
end timer;

architecture Behavioral of timer is


signal count : STD_LOGIC_VECTOR(1 downto 0) := "11"; --used for genrating the clk_out
signal clk_out: std_logic;
signal count1 : STD_LOGIC_VECTOR(1 downto 0) := "11"; --used for generating the anode signal

begin
process (clk_in, reset)
    begin
        if reset = '1' then
            count <= "00"; -- Reset internal counter
            clk_out <= '0'; -- Reset divided clock
        elsif rising_edge(clk_in) then
            -- Increment internal counter
           count <=count + 1;
            
            -- Set clk_div to the MSB of internal_count
            clk_out <= count(1); -- MSB of the 2-bit counter
            
        end if;
    end process;
    
    
    
process (clk_out)
    begin
        if rising_edge(clk_out) then
            -- Increment internal counter
           count1 <=count1 + 1;
           case count1 is
                when "00" =>
                    anode_out <= "0001"; -- Only anode[0] is high
                    mux_select <= "00";
                when "01" =>
                    anode_out <= "0010"; -- Only anode[1] is high
                     mux_select <= "01";
                when "10" =>
                    anode_out <= "0100"; -- Only anode[2] is high
                     mux_select <= "10";
                   
                when "11" =>
                    anode_out <= "1000"; -- Only anode[3] is high
                    mux_select <= "11";
                   
                when others =>
                    anode_out <= "0000"; -- Default case (shouldn't be needed)
                   
            end case;         
        end if;
    end process;

end Behavioral;
