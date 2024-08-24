----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/23/2023 11:06:35 AM
-- Design Name: 
-- Module Name: MUX_8_to_1 - Behavioral
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

entity MUX_8_to_1 is
    Port ( S : in STD_LOGIC_VECTOR (7 downto 0);
           D : in STD_LOGIC_VECTOR (2 downto 0);
           EN : in STD_LOGIC;
           Y : out STD_LOGIC);
end MUX_8_to_1;

architecture Behavioral of MUX_8_to_1 is

COMPONENT Decoder_3_to_8
    PORT (
        I : in STD_LOGIC_VECTOR (2 downto 0);
        EN : in STD_LOGIC;
        Y : out STD_LOGIC_VECTOR (7 downto 0)
    );
    
end COMPONENT;

signal en_switch : STD_LOGIC;
signal YD : STD_LOGIC_VECTOR(7 downto 0);

begin

    Decoder_3_to_8_1 : Decoder_3_to_8
    PORT MAP(
            I => D(2 downto 0),
            Y => YD(7 downto 0),
            EN => en_switch
            
     );
     
     en_switch <= '1';
     
     Y <= EN AND
          (
                (YD(0) AND S(0)) OR
                (YD(1) AND S(1)) OR 
                (YD(2) AND S(2)) OR 
                (YD(3) AND S(3)) OR 
                (YD(4) AND S(4)) OR 
                (YD(5) AND S(5)) OR 
                (YD(6) AND S(6)) OR 
                (YD(7) AND S(7))
            );             
                
end Behavioral;


