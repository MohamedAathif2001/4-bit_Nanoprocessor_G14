----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/31/2023 01:53:34 PM
-- Design Name: 
-- Module Name: Mux_2_to_1_3bit_sim - Behavioral
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

entity Mux_2_to_1_3bit_sim is
--  Port ( );
end Mux_2_to_1_3bit_sim;

architecture Behavioral of Mux_2_to_1_3bit_sim is

component Mux_2_to_1_3bit is
    Port ( 
        R0 : in STD_LOGIC_VECTOR(2 downto 0);
        R1 : in STD_LOGIC_VECTOR(2 downto 0);
        Sel : in STD_LOGIC;
        Y : out STD_LOGIC_VECTOR (2 downto 0));
        
    end component;
    
                --110 011 010 001 010 001 ; 210001R
                --110 011 010 101 110 010 ; 210290A

signal Sel: STD_LOGIC;
signal R0 : STD_LOGIC_VECTOR(2 downto 0):= "001";
signal R1 : STD_LOGIC_VECTOR(2 downto 0):= "010";
signal Y : STD_LOGIC_VECTOR(2 downto 0);

begin

UUT:Mux_2_to_1_3bit
port map(
    Sel => Sel,
    R0 => R0,
    R1 => R1,
    Y => Y
    );
    
process begin

Sel <= '0';

wait for 100ns;

Sel <= '1';

wait for 100ns;

end process;    
end Behavioral;
