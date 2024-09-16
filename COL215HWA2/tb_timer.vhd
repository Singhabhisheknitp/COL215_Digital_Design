library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_timer is
end tb_timer;

architecture Behavioral of tb_timer is
    -- Component declaration for the timer to be tested
    component timer
        Port (
            clk_in : in STD_LOGIC;
            reset : in STD_LOGIC;
            anode_out : out STD_LOGIC_VECTOR(3 downto 0);
            mux_select : out STD_LOGIC_VECTOR (1 downto 0)
        );
    end component;

    -- Signals for connecting the testbench to the timer
    signal clk_in : STD_LOGIC := '0';
    signal reset : STD_LOGIC := '0';
    signal anode_out : STD_LOGIC_VECTOR(3 downto 0);
    signal mux_select:STD_LOGIC_VECTOR (1 downto 0); 

    -- Clock period for simulation
    constant clk_period : time := 10 ns;

begin
    -- Instantiate the timer
    uut: timer
        Port map (
            clk_in => clk_in,
            reset => reset,
            anode_out => anode_out,
            mux_select => mux_select
        );

    -- Clock generation process
    clk_process : process
    begin
        while true loop
            clk_in <= not clk_in;
            wait for clk_period / 2;
        end loop;
    end process;

    -- Stimulus process to drive inputs and monitor outputs
    stim_proc : process
    begin
        -- Apply reset
        reset <= '1';
        wait for 20 ns;
        reset <= '0';
        wait for 100 ns;

        -- Observe the behavior of anode_out
        -- Wait and observe output
        wait for 200 ns;

        -- Test finished
        wait;
    end process;

end Behavioral;
