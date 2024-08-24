----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/01/2023 12:08:28 PM
-- Design Name: 
-- Module Name: Final_Project - Behavioral
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

entity Final_Project is
    Port ( Clk_in : in STD_LOGIC;
       Reset : in STD_LOGIC;
       Overflow : out STD_LOGIC;
       Zero : out STD_LOGIC;
       R7_out : out STD_LOGIC_VECTOR (3 downto 0);
       Sev_Seg_Out:out STD_LOGIC_VECTOR (6 downto 0);
       an : out STD_LOGIC_VECTOR (3 downto 0)
       );
       
end Final_Project;

architecture Behavioral of Final_Project is

component LUT_16_7 
    Port ( address : in STD_LOGIC_VECTOR (3 downto 0);
       data : out STD_LOGIC_VECTOR (6 downto 0));
end component;

component Nanoprocessor_4bit 
    Port ( Clk_in : in STD_LOGIC;
       Reset : in STD_LOGIC;
       Overflow : out STD_LOGIC;
       Zero : out STD_LOGIC;
       R7_out : out STD_LOGIC_VECTOR (3 downto 0));
end component;


signal Reg_7_Out: STD_LOGIC_VECTOR (3 downto 0);


begin
LUT_16_7_0:LUT_16_7
    Port Map( 
        address => Reg_7_Out,
        data => Sev_Seg_Out
    );

Nanoprocessor_4bit_0:Nanoprocessor_4bit
    Port Map( 
       Clk_in =>Clk_in,
       Reset  =>Reset,
       Overflow =>Overflow,
       Zero =>Zero,
       R7_out  => Reg_7_Out
   );
an<="1110";
R7_out<=Reg_7_Out;
end Behavioral;