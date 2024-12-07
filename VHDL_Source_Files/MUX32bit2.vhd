----------------------------------------------------------------------------------
-- Company: GMU
-- Engineer: Muhammad H. Ali
-- Module Name: MUX32bit2 - Behavioral
-- Project Name: ECE 445 Lab 5
------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_unsigned.all;

-- Ideally, this MUX is supposed to behave like a 4-to-1 multiplexor, however, I've implmemented it 
-- slightly differently.
entity MUX32bit2 is
    Port ( CUjump : in STD_logic; -- Jump signal from the control unit
           jumpControl: in STD_logic_vector(3 downto 0); -- This is so that the ALU control can send ALU Op codes to this MUX
           
           JAddress : in STD_LOGIC_VECTOR (31 downto 0);
           JRAddress : in std_logic_vector(31 downto 0);
           Din0 : in STD_LOGIC_Vector(31 downto 0);
           Dout : out STD_LOGIC_VECTOR (31 downto 0));
end MUX32bit2;

architecture Behavioral of MUX32bit2 is
signal jumpDetermine : std_logic_vector(31 downto 0);

begin
    with jumpControl select
        jumpDetermine <= JRAddress when "0100", -- This is for the JR instruction opcode
                         JAddress when "1001", -- This is for the J  and JAL instructions opcode
                         Din0 when others; -- Don't care value.
    
    with CUjump select
        Dout <= jumpDetermine when '1',
                Din0 when others;


end Behavioral;
