----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/10/2023 08:26:06 PM
-- Design Name: 
-- Module Name: Slow_Clk_sim - Behavioral
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

entity Slow_Clk_Sim is
-- Port ( );
end Slow_Clk_Sim;

architecture Behavioral of Slow_Clk_Sim is
 -- Component Declaration for DUT
    component Slow_Clk is
        Port (
            Clk_in : in STD_LOGIC;
            Clk_out : out STD_LOGIC
              );
 end component;
 
 signal Clk_in : STD_LOGIC := '0';
 signal Clk_out : STD_LOGIC;
 
begin

 uut: Slow_Clk port map (
    Clk_in => Clk_in,
    Clk_out => Clk_out
    );
process begin

 wait for 50ns;
 
 Clk_in <= NOT(Clk_in);
 
end process;

end Behavioral;