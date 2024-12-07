----------------------------------------------------------------------------------
-- Company: GMU
-- Engineer: Muhammad H. Ali
-- Module Name: signExtensionUnit - Behavioral
-- Project Name: ECE 445 Lab 4
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity signExtensionUnit is
    Port ( Din : in STD_LOGIC_VECTOR (15 downto 0);
           Dout : out STD_LOGIC_VECTOR (31 downto 0));
end signExtensionUnit;

architecture Behavioral of signExtensionUnit is
signal MSB : std_logic;
begin
    
    -- Going to use the MSB to determine whether or not to append F's or 0's to the beginning
    -- of Din
    with Din(15) select
        Dout <= (x"FFFF" & Din) when '1',
                (x"0000" & Din) when others;
end Behavioral;
