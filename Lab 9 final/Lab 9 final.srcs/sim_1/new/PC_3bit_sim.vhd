----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/30/2023 10:30:06 PM
-- Design Name: 
-- Module Name: PC_3bit_sim - Behavioral
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

entity PC_3bit_sim is
-- Port ( );
end PC_3bit_sim;

architecture Behavioral of PC_3bit_sim is

component PC_3bit

 Port ( D : in STD_LOGIC_VECTOR (2 downto 0);
 Clk : in STD_LOGIC;
 Clr : in STD_LOGIC;
 Q : out STD_LOGIC_VECTOR (2 downto 0)); 
end component;

signal Clk : STD_LOGIC :='0';
signal Clr : STD_LOGIC;
signal D,Q : STD_LOGIC_VECTOR(2 downto 0);

begin

UUT : PC_3bit
 PORT MAP(
    D => D,
    Clk => Clk,
    Clr => Clr,
    Q => Q
    );
 
 process 
 begin
 
 wait for 5ns;
 
 Clk <= not (Clk);
 end process;

 process
 begin
                 --110 011 010 001 010 001 ; 210001R
                 --110 011 010 101 110 010 ; 210290A
                 
 Clr <= '1';
 wait for 100ns;
 
 D <= "001";
 Clr <= '0';
 
 wait for 100ns;
 
 D <= "010";
 wait for 100ns;
 
 D <= "110";
 wait for 100ns;
 
 D <= "101";
 wait for 100ns;
 
 D <= "011";
 wait for 100ns;
 
 D <= "100";
 wait for 100ns;
 
 end process;
 
end Behavioral;

