library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity led_counter_tb is
end led_counter_tb;
library xil_defaultlib;


architecture tb of led_counter_tb is 
    -- compoennt constats
    constant N_WIDTH : positive := 8;
    constant N_RES : positive := 8;
    
    -- simulation constants
    -- edit the following two to configure simulated value steps.
    constant STEP_SIZE_EXP : positive := N_WIDTH-N_RES;
    constant N_STEPS_EXP : positive := N_WIDTH-STEP_SIZE_EXP;
    constant N_CNT_WIDTH : positive := 32;
    
    constant STEP_SIZE : positive := 2**(STEP_SIZE_EXP);
    constant N_STEPS : positive := 2**(N_STEPS_EXP);
    
    -- the component
    component led_counter
        generic(
           N_WIDTH : positive;
           N_RES : positive);
        port (
            iVec:  in unsigned(N_WIDTH-1 downto 0);
            oVec: out std_logic_vector(N_RES-1 downto 0));
    end component;
    
    -- component ports
    signal iVec : unsigned(N_WIDTH-1 downto 0);
    signal oVec : std_logic_vector(N_RES-1 downto 0);
    
    
    -- stimulus signal
    signal cntVec : unsigned(N_CNT_WIDTH-1 downto 0) := (others => '0');
    -- clock
    signal clk : std_logic := '0';

begin
    -- describe clocking
    clk <= not clk after 10 ns;
    
    -- instantiate component block
    DUT: led_counter
        generic map (
            N_WIDTH => N_WIDTH,
            N_RES => N_RES
        )
        port map (
            iVec => iVec,
            oVec => oVec
        );
        
    -- input data generation
    STIMULI : process
        constant allOnes : unsigned(N_CNT_WIDTH-1 downto 0) := (others => '1');
    begin
        while cntVec /= allOnes loop
            cntVec <= cntVec + 1;
            wait until rising_edge(clk);
        end loop;
    
--        for i in 0 to N_STEPS loop
--            iVec <= to_unsigned(i*STEP_SIZE, N_WIDTH);
--            wait until rising_edge(clk);
--        end loop;
    end process STIMULI;
    
    -- create connection from stimulus to component
    iVec <= cntVec(N_WIDTH-1 downto 0);
end architecture tb;