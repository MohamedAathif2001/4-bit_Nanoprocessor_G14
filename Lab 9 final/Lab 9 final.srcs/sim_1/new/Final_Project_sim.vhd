----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/01/2023 12:13:17 PM
-- Design Name: 
-- Module Name: Final_Project_sim - Behavioral
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

entity Final_Project_sim is
--  Port ( );
end Final_Project_sim;

architecture Behavioral of Final_Project_sim is
    component Final_Project
        Port ( Clk_in : in STD_LOGIC;
               Reset : in STD_LOGIC;
               Overflow : out STD_LOGIC;
               Zero : out STD_LOGIC;
               R7_out : out STD_LOGIC_VECTOR (3 downto 0);
               Sev_Seg_Out:out STD_LOGIC_VECTOR (6 downto 0);
               an : out STD_LOGIC_VECTOR (3 downto 0)
               );
    end component;
      
    signal Clk_in: STD_LOGIC:='0';
    signal Reset,Overflow,Zero:  STD_LOGIC;   
    signal R7_out,an :  STD_LOGIC_VECTOR (3 downto 0); 
    signal Sev_Seg_Out: STD_LOGIC_VECTOR (6 downto 0);
    
    
begin
    uut:Final_Project
     port map(
              Clk_in =>Clk_in,
              Reset => Reset,
              Overflow => Overflow,
              Zero => Zero,
              R7_out => R7_out,
              Sev_Seg_Out => Sev_Seg_Out,
              an => an
    );
    
    process
    begin
         Clk_in <= not(Clk_in);
         wait for 1ns;        
    end process;
    
    process
    begin
        Reset<='1';
        wait for 10ns;
        Reset<='0';
        wait;
    end process;
    
    
    
end Behavioral;

