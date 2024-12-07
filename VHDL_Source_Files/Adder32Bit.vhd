----------------------------------------------------------------------------------
-- Company: GMU
-- Engineer: Muhammad H. Ali
-- Module Name: Adder32Bit - Behavioral
-- Project Name: ECE 445 Lab 4
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_unsigned.all;

entity Adder32Bit is
    Port ( DinA : in STD_LOGIC_VECTOR (31 downto 0);
           DinB : in STD_LOGIC_VECTOR (31 downto 0);
           Dout : out STD_LOGIC_VECTOR (31 downto 0));
end Adder32Bit;

architecture Behavioral of Adder32Bit is

begin
    Dout <= DinA + DinB;

end Behavioral;
