----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/01/2023 10:15:32 AM
-- Design Name: 
-- Module Name: Prog_Rom_sim - Behavioral
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

entity Prog_Rom_sim is
--  Port ( );
end Prog_Rom_sim;

architecture Behavioral of Prog_Rom_sim is

component Prog_Rom is
    Port ( Address : in STD_LOGIC_VECTOR (2 downto 0);
           Ins_Bus : out STD_LOGIC_VECTOR (11 downto 0));
end component;

signal Address :STD_LOGIC_VECTOR (2 downto 0);
signal Ins_Bus : STD_LOGIC_VECTOR (11 downto 0);

begin

UUT: Prog_Rom
port map(
    Address => Address,
    Ins_Bus => Ins_Bus
    );
    
process 
begin    

Address <= "000";
wait for 20ns;

Address <= "001";
wait for 20ns;

Address <= "010";
wait for 20ns;

Address <= "011";
wait for 20ns;

Address <= "100";
wait for 20ns;

Address <= "101";
wait for 20ns;

Address <= "110";
wait for 20ns;

Address <= "111";
wait for 20ns;

end process;

end Behavioral;
