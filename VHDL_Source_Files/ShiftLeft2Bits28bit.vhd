----------------------------------------------------------------------------------
-- Company: GMU
-- Engineer: Muhammad H. Ali
-- Module Name: ShiftLeft2Bits - Behavioral
-- Project Name: ECE 445 Lab 5
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity ShiftLeft2Bits28bit is
    Port ( Din : in STD_LOGIC_VECTOR (25 downto 0);
           JAddress : out STD_LOGIC_VECTOR (27 downto 0));
end ShiftLeft2Bits28bit;

architecture Behavioral of ShiftLeft2Bits28bit is

begin
    JAddress <= Din & "00";
    
end Behavioral;
