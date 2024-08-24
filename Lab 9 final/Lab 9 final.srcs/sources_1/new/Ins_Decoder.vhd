----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/31/2023 09:29:13 PM
-- Design Name: 
-- Module Name: Ins_Decoder - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Ins_Decoder is
    Port ( Ins_Bus : in STD_LOGIC_VECTOR (11 downto 0);
           Reg_Jump_Check : in STD_LOGIC_VECTOR (3 downto 0);
           Reg_EN : out STD_LOGIC_VECTOR (2 downto 0);
           AS_Sel : out STD_LOGIC;
           RegS_Mux_A : out STD_LOGIC_VECTOR (2 downto 0);
           RegS_Mux_B : out STD_LOGIC_VECTOR (2 downto 0);
           Immediate_Value :out STD_LOGIC_Vector(3 downto 0);
           Load_Sel : out STD_LOGIC;
           Jump_Flag : out STD_LOGIC;
           Jump_Address : out STD_LOGIC_VECTOR (2 downto 0));
end Ins_Decoder;

architecture Behavioral of Ins_Decoder is

signal Instruction : STD_LOGIC_VECTOR(1 downto 0);
signal Reg_1,Reg_2 : STD_LOGIC_VECTOR(2 downto 0);
signal Data : STD_LOGIC_VECTOR(3 downto 0);

begin

process(Instruction,Reg_1,Reg_2, Reg_Jump_Check,Data,Data(2 downto 0)) 

begin

 --initialize jump to 0
        Jump_Flag <='0';
        Reg_EN <= "000";
        if (Instruction = "00") then --ADDITION
            AS_Sel <= '0';
            RegS_Mux_A <= Reg_1;
            RegS_Mux_B <= Reg_2; 
             --TIME FOR ATITHMETIC OPERATION
            
            Reg_En <= Reg_1;
            
                 
            Load_Sel<= '0';  --MUX SELECTOR    


        elsif (Instruction = "10") then --MOVE     
            Immediate_Value <=Data; 
            Reg_En <= Reg_1;  
            Load_Sel<= '1';  --MUX SELECTOR               
       


        elsif (Instruction = "01") then --NEGATION     
            RegS_Mux_A <= "000";
            RegS_Mux_B <= Reg_1; 
             --TIME FOR ATITHMETIC OPERATION
            Reg_En <= Reg_1;
            AS_Sel <= '1';     
            Load_Sel<= '0';  --MUX SELECTOR  


         
        elsif (Instruction = "11") then --JUMPZ
            RegS_Mux_A <= Reg_1;        
            if (Reg_Jump_Check="0000") then    
                Jump_Flag <='1';       
                Jump_Address <=Data(2 downto 0);
                Load_Sel<= '0';  --MUX SELECTOR  

            end if;
        end if;
    
             
end process;

Instruction <= Ins_Bus(11 downto 10);
Reg_1 <= Ins_Bus(9 downto 7);
Reg_2 <= Ins_Bus(6 downto 4);
Data<= Ins_Bus(3 downto 0);

end Behavioral;
