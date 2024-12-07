----------------------------------------------------------------------------------
-- Company: GMU
-- Engineer: Muhammad H. Ali
-- 
-- Create Date: 09/24/2020 03:07:22 PM
-- Module Name: pcadd - Behavioral
-- Project Name: Lab 2

-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_unsigned.all;

entity pcadd is
    Port ( Din : in STD_LOGIC_VECTOR (31 downto 0);
           Dout : out STD_LOGIC_VECTOR (31 downto 0));
end pcadd;

architecture Behavioral of pcadd is
begin
    Dout <= Din + x"00000004";
end Behavioral;
