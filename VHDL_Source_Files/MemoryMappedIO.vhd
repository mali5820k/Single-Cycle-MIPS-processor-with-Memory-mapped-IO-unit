----------------------------------------------------------------------------------
-- Company: GMU
-- Engineer: Muhammad H. Ali
-- Module Name: MemoryMappedIO - Behavioral
-- Project Name: ECE 445 Lab 6
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_unsigned.all;

entity MemoryMappedIO is
    Port ( Clock : in STD_LOGIC;
           MemWrite : in STD_LOGIC; -- Control signal
           Din : in STD_LOGIC_VECTOR (7 downto 0); 
           ALUout : in STD_LOGIC_VECTOR (31 downto 0); -- Also the memory address since that's where it connects to in Data Memory block
           Data2 : in STD_LOGIC_VECTOR (31 downto 0); -- Register File rt input
           Read_data : in STD_LOGIC_VECTOR (31 downto 0); --Data-memory
           Dout : out STD_LOGIC_VECTOR (31 downto 0);
           Dmultiplexor: out std_logic_vector (31 downto 0));
end MemoryMappedIO;

architecture Behavioral of MemoryMappedIO is
signal internalRegister : std_logic_vector (31 downto 0):= x"00000000"; -- Will write to when clock is a 1 on a sw instruc
                                                          -- and if memwrite is also 1.
                                                      
signal zeroExtendedDin : std_logic_vector (31 downto 0);                                                      
begin
    -- Behaviour for internal register assignments
    process(clock)
    begin
        if (clock'event) and (clock = '1') and (MemWrite = '1') and (ALUout = x"00000034") then
            internalRegister <= Data2; -- Store rt input to internal register
        end if;
    end process;
    
    -- Register Value assigned to Dout   
    Dout <= internalRegister;
    
    -- Behaviour for lw instruction
    zeroExtendedDin <= x"000000"& Din;
    with ALUout select
        Dmultiplexor <= zeroExtendedDin when x"00000030",
                        Read_Data when others;
                        
    
end Behavioral;
