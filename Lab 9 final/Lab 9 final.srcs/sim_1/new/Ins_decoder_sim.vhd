----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/31/2023 09:58:43 PM
-- Design Name: 
-- Module Name: Ins_decoder_sim - Behavioral
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

entity Ins_decoder_sim is
--  Port ( );
end Ins_decoder_sim;

architecture Behavioral of Ins_decoder_sim is

component Ins_Decoder is
    Port ( Ins_Bus : in STD_LOGIC_VECTOR (11 downto 0);
           Reg_Jump_Check : in STD_LOGIC_VECTOR (3 downto 0);
           Reg_EN : out STD_LOGIC_VECTOR (2 downto 0);
           AS_Sel : out STD_LOGIC;
           RegS_Mux_A : out STD_LOGIC_VECTOR (2 downto 0);
           RegS_Mux_B : out STD_LOGIC_VECTOR (2 downto 0);
           Immediate_Value :out STD_LOGIC_Vector(3 downto 0);
           Load_Sel : out STD_LOGIC;
           Jump_Flag : out STD_LOGIC;
           Jump_Address : out STD_LOGIC_VECTOR (2 downto 0));
end component;

signal Ins_Bus : STD_LOGIC_VECTOR(11 downto 0);
signal Reg_Jump_Check,Immediate_Value : STD_LOGIC_VECTOR(3 downto 0); 
signal Reg_En, RegS_Mux_A,RegS_Mux_B, Jump_Address : STD_LOGIC_VECTOR(2 downto 0);
signal Load_Sel, AS_Sel, Jump_Flag : STD_LOGIC;

begin

uut:Ins_Decoder
    port map(
           Ins_Bus => Ins_Bus,
           Reg_Jump_Check => Reg_Jump_Check,
           Reg_En => Reg_En,
           Load_Sel => Load_Sel,
           Immediate_Value => Immediate_Value,
           RegS_Mux_A  => RegS_Mux_A,
           RegS_Mux_B => RegS_Mux_B,
           AS_Sel => AS_Sel,
           Jump_Flag => Jump_Flag,
           Jump_Address => Jump_Address  
    );

    process
    begin
        Ins_Bus <= "101110000000";
        wait for 20 ns;
        
        Ins_Bus <= "100010000001";
         wait for 20 ns;
        
        Ins_Bus <= "100100000010";
            wait for 20 ns;
            
        Ins_Bus <= "100110000011";
        wait for 20 ns;
        
        Ins_Bus <= "001110010000";
        wait for 20 ns;
            
        Ins_Bus <=  "001110100000";
        wait for 20 ns;
                        
        
        Ins_Bus <=  "001110110000";
        wait for 20 ns;
           
        Ins_Bus <= "110000000111";
        Reg_Jump_Check <= "0000"; 
        wait for 20 ns;
                        
        wait;                                                        
    end process;
end Behavioral;
