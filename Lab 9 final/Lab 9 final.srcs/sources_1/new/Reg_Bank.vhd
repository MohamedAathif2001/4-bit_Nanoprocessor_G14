----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/31/2023 03:51:49 PM
-- Design Name: 
-- Module Name: Reg_Bank - Behavioral
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

entity Reg_Bank is
    Port ( EN : in STD_LOGIC;
           D : in STD_LOGIC_VECTOR (3 downto 0);
           Clk : in STD_LOGIC;
           Reset : in STD_LOGIC;
           Reg_En : in STD_LOGIC_VECTOR (2 downto 0);
           R0 : out STD_LOGIC_VECTOR (3 downto 0);
           R1 : out STD_LOGIC_VECTOR (3 downto 0);
           R2 : out STD_LOGIC_VECTOR (3 downto 0);
           R3 : out STD_LOGIC_VECTOR (3 downto 0);
           R4 : out STD_LOGIC_VECTOR (3 downto 0);
           R5 : out STD_LOGIC_VECTOR (3 downto 0);
           R6 : out STD_LOGIC_VECTOR (3 downto 0);
           R7 : out STD_LOGIC_VECTOR (3 downto 0));
end Reg_Bank;

architecture Behavioral of Reg_Bank is

component Reg_4bit
    Port (  D : in STD_LOGIC_VECTOR (3 downto 0);
            Clk : in STD_LOGIC;
            Reset : in STD_LOGIC;
            EN : in STD_LOGIC;
            Q : out STD_LOGIC_VECTOR (3 downto 0));
        
    end component;
    
component Decoder_3_to_8
    Port ( I : in STD_LOGIC_VECTOR (2 downto 0);
           EN : in STD_LOGIC;
           Y : out STD_LOGIC_VECTOR (7 downto 0));
end component;

signal RS : STD_LOGIC_VECTOR(7 downto 0);

begin

Decoder_3_to_8_0 : Decoder_3_to_8
    PORT MAP(
        I => Reg_En,
        EN => EN,
        Y => RS
        );

Reg_4bit_0 : Reg_4bit
    PORT MAP(
        D => "0000",
        Clk => Clk,
        Reset => Reset,
        EN => RS(0),
        Q => R0
        );      
        
Reg_4bit_1 : Reg_4bit
    PORT MAP(
        D => D,
        Clk => Clk,
        Reset => Reset,
        EN => RS(1),
        Q => R1
        );
                
Reg_4bit_2 : Reg_4bit
    PORT MAP(
        D => D,
        Clk => Clk,
        Reset => Reset,
        EN => RS(2),
        Q => R2
        );
                        
Reg_4bit_3 : Reg_4bit
    PORT MAP(
        D => D,
        Clk => Clk,
        Reset => Reset,
        EN => RS(3),
        Q => R3
        );
                                                                                
Reg_4bit_4 : Reg_4bit
    PORT MAP(
        D => D,
        Clk => Clk,
        Reset => Reset,
        EN => RS(4),
        Q => R4
        );        

Reg_4bit_5 : Reg_4bit
    PORT MAP(
        D => D,
        Clk => Clk,
        Reset => Reset,
        EN => RS(5),
        Q => R5
        );
        
Reg_4bit_6 : Reg_4bit
    PORT MAP(
        D => D,
        Clk => Clk,
        Reset => Reset,
        EN => RS(6),
        Q => R6
        );
                
Reg_4bit_7 : Reg_4bit
    PORT MAP(
        D => D,
        Clk => Clk,
        Reset => Reset,
        EN => RS(7),
        Q => R7
        );
        
end Behavioral;
