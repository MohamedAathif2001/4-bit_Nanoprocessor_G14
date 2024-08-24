----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/25/2023 03:15:55 PM
-- Design Name: 
-- Module Name: Adder_3_sim - Behavioral
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

entity Adder_3_sim is
--  Port ( );
end Adder_3_sim;

architecture Behavioral of Adder_3_sim is

component Adder_3

    Port ( A : in STD_LOGIC_VECTOR (2 downto 0);
           B : in STD_LOGIC_VECTOR (2 downto 0);
           S : out STD_LOGIC_VECTOR (2 downto 0);
           Carry_in : in STD_LOGIC;
           Carry_out : out STD_LOGIC);
           
end component;

signal A : STD_LOGIC_VECTOR(2 downto 0);
signal B : STD_LOGIC_VECTOR (2 downto 0);
signal S : STD_LOGIC_VECTOR (2 downto 0);
signal Carry_in : STD_LOGIC;
signal Carry_out : STD_LOGIC;

begin

UUT: Adder_3
    port map(
        A => A,
        B =>B,
        S => S,
        Carry_in => Carry_in,
        Carry_out => Carry_out
        );
        
process 
begin

                --110 011 010 001 010 001 ; 210001R
                --110 011 010 101 110 010 ; 210290A

    Carry_in <= '0';
    A <= "001"; --1
    B <= "010"; --2
    
wait for 100ns;
    
    A <= "010"; --2
    B <= "011"; --3

wait for 100ns;

    A <= "110"; --6
    B <= "101"; --5

wait for 100ns;

end process;

end Behavioral;
