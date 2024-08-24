----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/31/2023 05:02:00 PM
-- Design Name: 
-- Module Name: Reg_Bank_sim - Behavioral
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

entity Reg_Bank_sim is
--  Port ( );
end Reg_Bank_sim;

architecture Behavioral of Reg_Bank_sim is

component Reg_Bank is
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
end component;

signal EN: STD_LOGIC:='1';
signal Clk: STD_LOGIC:='0';
signal Reset: STD_LOGIC:='0';
signal D,R0,R1,R2,R3,R4,R5,R6,R7:STD_LOGIC_VECTOR (3 downto 0):="0000"; --setting all to 0000
signal Reg_En : STD_LOGIC_VECTOR (2 downto 0);

begin

UUT:Reg_Bank port map(
    Clk => Clk,
    D => D,
    R0 => R0,
    R1 => R1,
    R2 => R2,
    R3 => R3,
    R4 => R4,
    R5 => R5,
    R6 => R6,
    R7 => R7,
    Reg_EN => Reg_EN,
    Reset => Reset,
    EN => EN
    );

process
begin

Clk <= NOT(Clk);
wait for 5ns;

end process;

process begin

                --11 0011 0100 0101 0001 ; 210001R
                --11 0011 0101 0111 0010 ; 210290A
                
    D <= "0001"; -- 1
    Reg_EN <= "000"; -- reg0
    
    wait for 20ns;        
    
    D <= "0010"; -- 2 
    Reg_EN <= "001";  -- reg1
    
    wait for 20ns;
    
    D <= "0101";     --5
    Reg_EN <= "010"; -- reg2
    
    wait for 20ns;
    
    D <= "0111"; -- 7
    Reg_EN <= "011"; --reg3
    
    wait for 20ns;
    
    D <= "0100"; -- 4
    Reg_EN <= "100"; --reg4
    
    wait for 20ns;
    
    D <= "0101"; -- 5
    Reg_EN <= "101"; --reg5
    
    wait for 20ns;    

    D <= "0011"; -- 3
    Reg_EN <= "110"; --reg6
    
    wait for 20ns;
    
    D <= "0011"; -- 3
    Reg_EN <= "111"; --reg7
    
    wait for 20ns;
    
    D <= "1111"; -- 15
    Reg_EN <= "000"; -- reg0
    
    wait for 20ns;
    
    Reset <= '1';
    
    wait for 20ns;
    
end process;    
        
end Behavioral;
