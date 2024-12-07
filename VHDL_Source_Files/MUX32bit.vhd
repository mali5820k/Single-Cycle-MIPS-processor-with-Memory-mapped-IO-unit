----------------------------------------------------------------------------------
-- Company: GMU
-- Engineer: Muhammad H. Ali
-- Module Name: MUX32bit - Behavioral
-- Project Name: ECE 445 Lab 4
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity MUX32bit is
    Port ( Din0 : in STD_LOGIC_VECTOR (31 downto 0);
           Din1 : in STD_LOGIC_VECTOR (31 downto 0);
           ALUsrc : in std_logic;
           
           Dout : out STD_LOGIC_VECTOR (31 downto 0));
end MUX32bit;

architecture Behavioral of MUX32bit is

begin
    with ALUsrc select
        Dout <= Din0 when '0',
                Din1 when others;

end Behavioral;