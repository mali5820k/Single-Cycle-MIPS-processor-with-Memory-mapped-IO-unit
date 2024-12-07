----------------------------------------------------------------------------------
-- Company: GMU
-- Engineer: Muhammad H. Ali
-- Module Name: ANDGate - Behavioral
-- Project Name: ECE 445 Lab 4
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ANDGate is
    Port ( ALUZero : in STD_LOGIC;
           Branch : in STD_LOGIC;
           Dout : out STD_LOGIC);
end ANDGate;

architecture Behavioral of ANDGate is

begin
    Dout <= (ALUZero and Branch); -- Simply an AND operation between the two inputs

end Behavioral;
