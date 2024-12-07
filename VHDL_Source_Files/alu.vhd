----------------------------------------------------------------------------------
-- Company: George Mason University
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use ieee.NUMERIC_STD.all;

entity ALU is
    Port (A, B     : in  STD_LOGIC_VECTOR (31 downto 0);
          ALUCntl  : in  STD_LOGIC_VECTOR (3 downto 0);
          Carryin  : in  STD_LOGIC;
          ALUOut   : out  STD_LOGIC_VECTOR (31 downto 0);
          Zero     : out  STD_LOGIC;
          Carryout : out std_logic;
          Overflow : out  STD_LOGIC);
end ALU; 


architecture Behavioral of ALU is
signal ALU_Result : std_logic_vector (31 downto 0);
signal add_result,sub_result,a32,b32: std_logic_vector(32 downto 0);
signal c32: std_logic_vector(32 downto 0):=(others=>'0');
signal add_ov,sub_ov:std_logic;
signal slt:std_logic_vector(31 downto 0);
signal bne: std_logic_vector(31 downto 0);

begin
   -- SLT operation logic:
   slt <= x"00000001" when A < B else
          x"00000000";
          
   -- BNE operation logic:
   bne <= x"00000000" when ((A-B) = 0) else
          (A-B);
   
   -- Since the J, JR, and JAL instructions are independent of the ALU, no need to modify the ALU here.
   with ALUCntl select
   ALU_Result <=add_result(31 downto 0) when "0010", --Add
                sub_result(31 downto 0) when "0110", --sub
                A AND B when "0000",
                A OR  B when "0001",
                A XOR B when "0011",
                A NOR B when "1100",
                slt when "0111", -- SLT instruction
                bne when "1111", -- BNE instruction
                A when others;---condition for all other alu control signals
ALUOut  <= ALU_Result; 
----Addition Operation and carry out generation-----	
   a32   <='0'& A;
   b32   <='0'& B;
   c32(0)<=Carryin;
   add_result<=a32 + b32 + c32;
   sub_result<=a32 - b32;
---Zero flag-----------------------------	
   Zero <= '1' when ALU_Result =x"00000000" else '0';
---Overflow flag---------------------------------------
   add_ov<= (A(31)and B(31)       and (not alu_result(31))) or ((not A(31))and (not B(31)) and alu_result(31));
   sub_ov<= (A(31)and (not B(31)) and (not alu_result(31))) or ((not A(31))and B(31)       and alu_result(31)); 
   with ALUCntl select
      Overflow<= add_ov when "0010",
                 sub_ov when "0110",
                 'Z' when others;
---Carryout-------------------------------------------------
  With ALUCntl select 
     Carryout<= add_result(32) when "0010",
                sub_result(32) when "0110",
                'Z' when others;
end Behavioral;

