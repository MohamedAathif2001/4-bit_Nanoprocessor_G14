----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/25/2023 02:09:29 PM
-- Design Name: 
-- Module Name: ASUnit_4_sim - Behavioral
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

entity ASUnit_4_sim is
--  Port ( );
end ASUnit_4_sim;

architecture Behavioral of ASUnit_4_sim is

component ASUnit_4 is

    Port ( A : in STD_LOGIC_VECTOR(3 downto 0);
           B : in STD_LOGIC_VECTOR(3 downto 0);
           C  : in STD_LOGIC;
           S : out STD_LOGIC_VECTOR(3 downto 0);
           Overflow,Zero : out STD_LOGIC);
           
end component;

signal A : STD_LOGIC_VECTOR (3 downto 0);
signal B : STD_LOGIC_VECTOR (3 downto 0);
signal C : STD_LOGIC;
signal Overflow,Zero : STD_LOGIC;
signal S : STD_LOGIC_VECTOR (3 downto 0);

begin

UUT: ASUnit_4

port map(
    A => A,
    B => B,
    C => C,
    --C_out => C_out,
    Overflow => Overflow,
    Zero => Zero,
    S => S
 );

process 

begin
                --11 0011 0100 0101 0001 ; 210001R
                --11 0011 0101 0111 0010 ; 210290A

A <= "0011"; -- 3 - 3
B <= "0011";
C <= '1';

wait for 100ns;

A <= "0100"; -- 4 + 5
B <= "0101";
C <= '0';

wait for 100ns;

A <= "0101"; -- 5 - 7
B <= "0101";
C <= '1';

wait for 100ns;

A <= "0001"; -- 1 + 2
B <= "0010";
C <= '0';

wait for 100ns;

end process;

end Behavioral;
