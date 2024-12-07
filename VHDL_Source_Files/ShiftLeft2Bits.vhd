----------------------------------------------------------------------------------
-- Company: GMU
-- Engineer: Muhammad H. Ali
-- Module Name: ShiftLeft2Bits - Behavioral
-- Project Name: ECE 445 Lab 4
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ShiftLeft2Bits is
    Port ( Din : in STD_LOGIC_VECTOR (31 downto 0);
           Dout : out STD_LOGIC_VECTOR (31 downto 0));
end ShiftLeft2Bits;

architecture Behavioral of ShiftLeft2Bits is
signal leftShifted : std_logic_vector (31 downto 2);
begin
    leftShifted <= Din(29 downto 0);
    Dout <= leftShifted & "00";

end Behavioral;
