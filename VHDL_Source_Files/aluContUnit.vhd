----------------------------------------------------------------------------------
-- Company: GMU
-- Engineer: Muhammad H. Ali
-- Module Name: aluContUnit - Behavioral
-- Project Name: ECE 445 Lab 4
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity aluContUnit is
    Port ( ALUcu : in STD_LOGIC_VECTOR (5 downto 0);
           Rfunctionbits : in STD_LOGIC_VECTOR (5 downto 0);
           ALUop : out STD_LOGIC_VECTOR (3 downto 0));
end aluContUnit;

architecture Behavioral of aluContUnit is
signal rtypeSignal : std_logic_vector (3 downto 0);
begin
    
    with Rfunctionbits select
        -- Assigns the proper signal to rtypeSignal if the opcode is 000000 and the function code is one of the following
        rtypeSignal <= "0010" when "100000", -- Add
                       "0010" when "100001", -- Add unsigned
                       "0110" when "100010", -- Subtract
                       "0110" when "100011", -- Subtract unsigned
                       "0000" when "100100", -- AND
                       "0001" when "100101", -- OR
                       "0011" when "100110", -- XOR
                       "1100" when "100111", -- NOR
                       "0111" when "101010", -- SLT
                       "0111" when "101011", -- SLT unsigned
                       "0100" when "001000", -- JR
                       "1010" when others; -- when others
    
    -- Using figure 4.12 from the textbook                   
    with ALUcu select
            ALUop <= rtypeSignal(3 downto 0) when "000000", -- R-Type instructions
                     "0010" when "100011", -- lw instruction using add operation
                     "0010" when "101011", -- sw instruction using add operation
                     "0110" when "000100", -- beq instruction using subtract operation
                     "1111" when "000101", -- bne instruction using a number that hasn't been used before i.e. 1111
                     "0010" when "001000", -- addi instruction using add operation
                     "0010" when "001001", -- addiu instruction using same operation for addi
                     "0000" when "001100", -- andi instruction using and operation
                     "0001" when "001101", -- ori instruction using or operation
                     "0111" when "001010", -- slti instruction using slt operation
                     "0111" when "001011", -- sltiu instruction using same operation for slti
                     "1001" when "010000", -- j instruction
                     "1001" when "011000", -- jal instruction
                     "1010" when others;
    
end Behavioral;
