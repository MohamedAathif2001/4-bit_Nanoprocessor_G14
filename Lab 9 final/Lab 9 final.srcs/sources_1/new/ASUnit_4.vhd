----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/25/2023 02:03:25 PM
-- Design Name: 
-- Module Name: ASUnit_4 - Behavioral
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

entity ASUnit_4 is

    Port ( A : in STD_LOGIC_VECTOR(3 downto 0);
           B : in STD_LOGIC_VECTOR(3 downto 0);
           C  : in STD_LOGIC;
           S : out STD_LOGIC_VECTOR(3 downto 0);
           Overflow,Zero : out STD_LOGIC);
           --C_out : out STD_LOGIC);
           
end ASUnit_4;

architecture Behavioral of ASUnit_4 is

    component FA
    
        port (
         A: in std_logic;
         B: in std_logic;
         C_in: in std_logic;
         S: out std_logic;
         C_out: out std_logic);
     end component;

     SIGNAL FA0_S, FA0_C, FA1_S, FA1_C, FA2_S, FA2_C, FA3_S, FA3_C ,X0,X1,X2,X3 : std_logic;
     
begin

     X0 <= B(0) XOR C;
     X1 <= B(1) XOR C;
     X2 <= B(2) XOR C;
     X3 <= B(3) XOR C;

     FA_0 : FA
        port map (
         A => A(0),
         B => X0,
         C_in => C, 
         S => FA0_S,
         C_Out => FA0_C);
         
     FA_1 : FA
         port map (
         A => A(1),
         B => X1,
         C_in => FA0_C,
         S => FA1_S,
         C_Out => FA1_C);
         
     FA_2 : FA
          port map (
          A => A(2),
          B => X2,
          C_in => FA1_C,
          S => FA2_S,
          C_Out => FA2_C);
          
      FA_3 : FA
          port map (
          A => A(3),
          B => X3,
          C_in => FA2_C,
          S => FA3_S,
          C_out => FA3_C);
          
     S(0) <= FA0_S;     
     S(1) <= FA1_S;
     S(2) <= FA2_S;
     S(3) <= FA3_S;
          
     --C_out <= FA3_C;     
     Overflow <= FA3_C XOR FA2_C;
     Zero <= NOT(FA0_S OR FA1_S OR FA2_S OR FA3_S);
          
end Behavioral; 