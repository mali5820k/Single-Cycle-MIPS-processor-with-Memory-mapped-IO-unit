----------------------------------------------------------------------------------
-- Company: GMU
-- Engineer: Muhammad H. Ali
-- Module Name: MUX32bit2 - Behavioral
-- Project Name: ECE 445 Lab 5
------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_unsigned.all;

entity MUXPostALU is
    Port ( Din0 : in STD_LOGIC_VECTOR (31 downto 0);
           Din1 : in STD_LOGIC_VECTOR (31 downto 0);
           JAddress : in std_logic_vector(31 downto 0);
           Dout : out STD_LOGIC_VECTOR (31 downto 0);
           MemToReg : in STD_LOGIC;
           JALop : in STD_LOGIC_VECTOR (3 downto 0)); -- Coming from the ALU Control unit
end MUXPostALU;

architecture Behavioral of MUXPostALU is
signal jumpDetermine : std_logic_vector(31 downto 0);
begin
    
    with JALop select
        jumpDetermine <= JAddress when "1011", -- This is for the JAL instruction opcode
                         x"00000000" when others; -- Don't care value.
                        
    Dout <= Din1 when ((MemToReg = '1') and (jumpDetermine = x"00000000")) else
            jumpDetermine when JALop = "1011" else
            Din0 when MemToReg = '0';



end Behavioral;
