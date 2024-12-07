----------------------------------------------------------------------------------
-- Company: GMU
-- Engineer: Muhammad H. Ali
-- Module Name: contUnit - Behavioral
-- Project Name: ECE 445 Lab 5
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity contUnit is
    Port ( Opcode : in STD_LOGIC_VECTOR (5 downto 0);
           
           Jump : out STD_logic;
           RegDst : out STD_LOGIC;
           ALUSrc : out STD_LOGIC;
           MemtoReg : out STD_LOGIC;
           RegWrite : out STD_LOGIC;
           MemRead : out STD_LOGIC;
           MemWrite : out STD_LOGIC;
           Branch : out STD_LOGIC;
           ALUcu : out STD_LOGIC_VECTOR (5 downto 0)); -- Since they're 10 I-type Instructions
end contUnit;

architecture Behavioral of contUnit is
begin
    -- Using figure 4.22 from the textbook
    with Opcode select
        RegDst <= '1' when "000000", -- If R-type instruction, set to 1
                  '0' when others; -- If any other instruction, set to 0
                  
    with Opcode select
        Jump <= '1' when "000010", -- If the Opcode is 2, set jump to 1 for j
                '1' when "000000", -- If the Opcode is 0, set jump to 1 for jr
                '1' when "000011", -- If the Opcdoe is 3, set jump to 1 for jal
                '0' when others; -- If any other instruction, set to 0 
    
    with Opcode select
        ALUSrc <= '0' when "000000", -- If R-type instruction, set to 0
                  '0' when "000100", -- If BEQ set to 0
                  '0' when "000101", -- If BNE set to 0
                  '1' when others;  -- If any other I-type instruction set to 1
    
    with Opcode select
        MemtoReg <= '1' when "100011", -- If lw instruction, set to 1
                    '0' when others; -- If either R-type or sw set to 0
    
    with Opcode select
        RegWrite <= '1' when "000000", -- If R-type instruction, set to 1
                    '1' when "100011", -- If lw instruction, set to 1
                    '1' when "001000", -- If addi instruction, set to 1
                    '1' when "001001", -- If addiu instruction, set to 1
                    '1' when "001100", -- If andi instruction, set to 1
                    '1' when "001101", -- If ori instruction, set to 1
                    '1' when "001010", -- If slti instruction, set to 1
                    '1' when "001011", -- If sltiu instruction, set to 1
                    '1' when "000011", -- If jal instruction, set to 1
                    '0' when others; -- If any other instruction, set to 0
    
    with Opcode select
        MemRead <= '1' when "100011", -- If lw instruction, set to 1
                   '0' when others; -- If any other instruction, set to 0
    
    with Opcode select
        MemWrite <= '1' when "101011", -- If sw instruction, set to 1
                    '0' when others; -- If any other instruction, set to 0
    
    with Opcode select
        Branch <= '1' when "000100", -- If BEQ instruction set to 1
                  '1' when "000101", -- If BNE instruction set to 1
                  '0' when others; -- If anything else, set to 0
    
    with Opcode select
        ALUcu <=  "000000" when "000000", -- R-type instructions
                  "100011" when "100011", -- lw instruction
                  "101011" when "101011", -- sw instruction
                  "000100" when "000100", -- beq instruction
                  "000101" when "000101", -- bne instruction
                  "001000" when "001000", -- addi instruction
                  "001001" when "001001", -- addiu instruction
                  "001100" when "001100", -- andi instruction
                  "001101" when "001101", -- ori instruction
                  "001010" when "001010", -- slti instruction
                  "001011" when "001011", -- sltiu instruction
                  "010000" when "000010", -- j instruction
                  "011000" when "000011", -- jal instruction
                  "111111" when others;
end Behavioral;
