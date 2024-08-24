----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/30/2023 03:58:42 PM
-- Design Name: 
-- Module Name: Reg_4bit_sim - Behavioral
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

entity Reg_4bit_sim is
--  Port ( );
end Reg_4bit_sim;

architecture Behavioral of Reg_4bit_sim is

component Reg_4bit is
 Port ( D : in STD_LOGIC_VECTOR (3 downto 0);
        Clk : in STD_LOGIC;
        Reset : in STD_LOGIC;
        EN : in STD_LOGIC;
        Q : out STD_LOGIC_VECTOR (3 downto 0)
        );
        
    end component;

signal D : STD_LOGIC_VECTOR (3 downto 0);
signal Clk : STD_LOGIC:= '0';
signal Reset : STD_LOGIC;
signal EN : STD_LOGIC:='1';
signal Q : STD_LOGIC_VECTOR (3 downto 0):="0000";

begin

UUT: Reg_4bit
Port map(
 D => D, 
 Clk => Clk, 
 Reset => Reset,
 EN => EN, 
 Q => Q
    );

process begin

Clk <= not Clk;

wait for 50ns;

end process;

                --11 0011 0100 0101 0001 ; 210001R
                --11 0011 0101 0111 0010 ; 210290A

process begin

D <= "0001";
Reset <= '1';

wait for 100ns;

D<= "0010";
Reset <= '0';

wait for 100ns;

D<= "0101";

wait for 100ns;
D<= "0111";

wait for 100ns;

end process;
end Behavioral;


