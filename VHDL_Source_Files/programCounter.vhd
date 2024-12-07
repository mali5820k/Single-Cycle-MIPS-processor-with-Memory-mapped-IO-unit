----------------------------------------------------------------------------------
-- Company: GMU
-- Engineer: Muhammad H. Ali
-- 
-- Create Date: 09/24/2020 03:07:22 PM
-- Module Name: programCounter - Behavioral
-- Project Name: Lab 2

-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_unsigned.all;

entity programCounter is
    Port ( clock : in STD_LOGIC;
           Reset : in STD_LOGIC;
           Din : in STD_LOGIC_VECTOR (31 downto 0);
           Dout : out STD_LOGIC_VECTOR (31 downto 0));
end programCounter;

architecture Behavioral of programCounter is

begin
    -- Using Dr. Lorie's ECE 331 ppt lecture 17 slide 49 as reference for clk signal declaration
    process(clock)
    begin
        if (clock'event) and (clock = '1') and (Reset = '0') then
            Dout <= Din; -- Input from the Pcadd
        end if;
        if (Reset = '1') then 
            Dout <= x"00000000";
        end if;
    end process;      
end Behavioral;
