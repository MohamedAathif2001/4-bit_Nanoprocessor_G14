----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/01/2023 09:39:07 AM
-- Design Name: 
-- Module Name: Prog_Rom - Behavioral
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Prog_Rom is
    Port ( Address : in STD_LOGIC_VECTOR (2 downto 0);
           Ins_Bus : out STD_LOGIC_VECTOR (11 downto 0));
end Prog_Rom;

architecture Behavioral of Prog_Rom is

type rom_type is array(0 to 7) of STD_LOGIC_VECTOR(11 downto 0);
signal Rom_Instruction: rom_type := (

        --instruction set 1
        
--    "100010000011",-- mov 3 to reg1
--    "100100000001",-- mov 1 to reg2
--    "010100000000",-- negative of reg2
--    "001110010000",-- adding reg1 to reg7 , store in 1
--    "000010100000",--adding reg2 to reg1 and store in 1
--    "110010000111",--if value in reg1 is 0 pc=7 , else increment pc
--    "110000000011",--
--    "110000000111" --if value in reg0 is 0(always) pc=7 => stay in
    
        --instruction set2
   
   "101110000000", -- mov 0 to reg7
   "100010000001", -- mov 1 to reg1 
   "001110010000", -- add reg 1 and 7 and store in 7 ==> reg7=1
   "100100000010", -- mov 2 to reg2
   "001110100000", -- add reg 2 and 7 and store in 7 ==> reg7=3
   "100110000011", -- mov 3 to reg3
   "001110110000", -- add reg 3 and 7 and store in 7 ==> reg7=6
   "110000000111" -- if reg 0 is 0 pc=7
   

    );
    
begin

    Ins_Bus <= Rom_Instruction(to_integer(unsigned(Address)));


end Behavioral;
