----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/01/2023 11:37:58 AM
-- Design Name: 
-- Module Name: Nanoprocessor_4bit_sim - Behavioral
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

entity Nanoprocessor_4bit_sim is
--  Port ( );
end Nanoprocessor_4bit_sim;

architecture Behavioral of Nanoprocessor_4bit_sim is

component Nanoprocessor_4bit is
    Port ( Clk_in : in STD_LOGIC;
           Reset : in STD_LOGIC;
           Overflow : out STD_LOGIC;
           Zero : out STD_LOGIC;
           R7_out : out STD_LOGIC_VECTOR (3 downto 0));
end component;

signal Clk_in,Reset,Overflow,Zero : STD_LOGIC:='0';
signal R7_out :STD_LOGIC_VECTOR (3 downto 0);

begin

UUT:Nanoprocessor_4bit
port map(
        R7_out=>R7_out,
        Clk_in => Clk_in,
        Overflow => Overflow,
        Zero => Zero,
        Reset => Reset
        );
        
process 
begin
        Clk_in <= not Clk_in;
        wait for 5ns;
        end process;
        
process 
begin
        Reset <= '1';
        wait for 50ns;
        
        Reset <= '0';
        wait for 3000ns;
        
        wait;
        end process; 
        
end Behavioral;        

