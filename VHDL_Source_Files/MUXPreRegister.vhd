----------------------------------------------------------------------------------
-- Company: GMU
-- Engineer: Muhammad H. Ali
-- Module Name: MUX32bit2 - Behavioral
-- Project Name: ECE 445 Lab 5
------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_unsigned.all;

entity MUXPreRegister is
    Port ( Din0 : in STD_LOGIC_VECTOR (4 downto 0);
           Din1 : in STD_LOGIC_VECTOR (4 downto 0);
           Dout : out STD_LOGIC_VECTOR (4 downto 0);
           SwitchBit : in STD_LOGIC;
           JALop : in STD_LOGIC_VECTOR (3 downto 0)); -- Coming from the ALU Control unit
end MUXPreRegister;

architecture Behavioral of MUXPreRegister is
signal constant32 : std_logic_vector(4 downto 0);
signal jumpDetermine : std_logic_vector(4 downto 0);
begin
    constant32 <= "11111"; -- 32 in binary
    
    with JALop select
        jumpDetermine <= constant32 when "1011", -- This is for the JAL instruction opcode
                         "00000" when others; -- Don't care value.
                        
    Dout <= Din1 when ((SwitchBit = '1') and (jumpDetermine = "00000")) else
            jumpDetermine when JALop = "1011" else
            Din0 when SwitchBit = '0';
end Behavioral;
