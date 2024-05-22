library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity led_counter is
    generic(
        N_WIDTH : positive := 8;
        N_RES : positive := 8);
    port (
        iVec:  in unsigned(N_WIDTH-1 downto 0);
        oVec: out std_logic_vector(N_RES-1 downto 0));
end entity led_counter;

architecture comb of led_counter is
    constant resolution : positive := 2**N_RES/N_RES;
    signal msVec : unsigned(N_RES-1 downto 0); -- most significan portion of the input
begin
    msVec <= iVec(N_WIDTH-1 downto N_WIDTH-N_RES);
    
    MUX: process(iVec) is
        variable ledArr : std_logic_vector(N_RES-1 downto 0);
    begin
        ledArr := (others=>'0');

        for i in N_RES downto 1 loop
            if msVec > resolution*i then
                ledArr(i-1) := '1';
            end if;
        end loop;
        
        oVec <= ledArr;
    end process MUX;
end architecture comb;