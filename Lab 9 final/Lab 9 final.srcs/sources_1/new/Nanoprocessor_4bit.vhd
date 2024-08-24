----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/01/2023 11:01:46 AM
-- Design Name: 
-- Module Name: Nanoprocessor_4bit - Behavioral
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

entity Nanoprocessor_4bit is
    Port ( Clk_in : in STD_LOGIC;
           Reset : in STD_LOGIC;
           Overflow : out STD_LOGIC;
           Zero : out STD_LOGIC;
           R7_out : out STD_LOGIC_VECTOR (3 downto 0));
end Nanoprocessor_4bit;

architecture Behavioral of Nanoprocessor_4bit is

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

component Mux_8_to_1_4bit
    Port ( 
        R0 : in STD_LOGIC_VECTOR(3 downto 0); 
        R1 : in STD_LOGIC_VECTOR(3 downto 0); 
        R2 : in STD_LOGIC_VECTOR(3 downto 0); 
        R3 : in STD_LOGIC_VECTOR(3 downto 0); 
        R4 : in STD_LOGIC_VECTOR(3 downto 0); 
        R5 : in STD_LOGIC_VECTOR(3 downto 0); 
        R6 : in STD_LOGIC_VECTOR(3 downto 0); 
        R7 : in STD_LOGIC_VECTOR(3 downto 0); 
        Sel : in STD_LOGIC_VECTOR (2 downto 0);
        Y : out STD_LOGIC_VECTOR (3 downto 0));
end component;

component ASUnit_4 is

    Port ( A : in STD_LOGIC_VECTOR(3 downto 0);
           B : in STD_LOGIC_VECTOR(3 downto 0);
           C  : in STD_LOGIC;
           S : out STD_LOGIC_VECTOR(3 downto 0);
           Overflow,Zero : out STD_LOGIC);
end component;

component Mux_2_to_1_4bit is
    Port ( Sel : in STD_LOGIC;
            R0 : in STD_LOGIC_VECTOR (3 downto 0);
            R1 : in STD_LOGIC_VECTOR (3 downto 0);
            Y : out STD_LOGIC_VECTOR (3 downto 0));
end component;

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

component Adder_3 is

  Port ( A : in STD_LOGIC_VECTOR (2 downto 0);
       B : in STD_LOGIC_VECTOR (2 downto 0);
       S : out STD_LOGIC_VECTOR (2 downto 0);
       Carry_in : in STD_LOGIC;
       Carry_out : out STD_LOGIC);
 
end component;

component Mux_2_to_1_3bit is
    Port ( 
        R0 : in STD_LOGIC_VECTOR(2 downto 0);
        R1 : in STD_LOGIC_VECTOR(2 downto 0);
        Sel : in STD_LOGIC;
        Y : out STD_LOGIC_VECTOR (2 downto 0));
end component;

component PC_3bit is

 Port ( D : in STD_LOGIC_VECTOR (2 downto 0);
        Clk : in STD_LOGIC;
        Clr : in STD_LOGIC;
        Q : out STD_LOGIC_VECTOR (2 downto 0));
end component;

component Slow_Clk is
    Port ( Clk_in : in STD_LOGIC;
           Clk_out : out STD_LOGIC);
end component;

component Prog_Rom is
    Port ( Address : in STD_LOGIC_VECTOR (2 downto 0);
           Ins_Bus : out STD_LOGIC_VECTOR (11 downto 0));
end component;
 -- For the Register Bank
signal Mux_Reg_Bank: STD_LOGIC_VECTOR (3 downto 0);
signal Decoder_Reg_Bank: STD_LOGIC_VECTOR (2 downto 0);
signal Reg_0_out, Reg_1_out, Reg_2_out, Reg_3_out, Reg_4_out, Reg_5_out, Reg_6_out, Reg_7_out:  STD_LOGIC_VECTOR (3 downto 0);  
--  For the Mux_8_way_4_Bit
signal Reg_Sel_0,Reg_Sel_1: STD_LOGIC_VECTOR (2 downto 0);
signal Reg_Sel_0_out,Reg_Sel_1_out: STD_LOGIC_VECTOR (3 downto 0);
 -- For the AddSubUnit_4
signal AddSubSel: STD_LOGIC;
signal AddSubOut: STD_LOGIC_VECTOR (3 downto 0);
 -- For the Mux_2_way_4_Bit
signal Immediate_Value: STD_LOGIC_VECTOR (3 downto 0);
signal Mux_Decoder_Sel: STD_LOGIC;
 -- For the Instruction Decoder
signal Rom_out: STD_LOGIC_VECTOR (11 downto 0);
signal JumpAddress: STD_LOGIC_VECTOR (2 downto 0);
signal JumpFlag: STD_LOGIC;
 -- For the Bit_3_adder
signal Bit_3_adder_out: STD_LOGIC_VECTOR (2 downto 0);
-- For the Program Counter
signal PC_in,PC_out: STD_LOGIC_VECTOR (2 downto 0);

signal Clk: STD_LOGIC;



begin 
Slow_Clk_0: Slow_Clk
Port Map(
       Clk_in => Clk_in,
       Clk_out => Clk
);

Reg_Bank_0: Reg_Bank
Port Map(
       Clk => Clk,
       D => Mux_Reg_Bank,
       Reg_EN => Decoder_Reg_Bank,
       R0 => Reg_0_out,
       R1 => Reg_1_out,
       R2 => Reg_2_out, 
       R3 => Reg_3_out, 
       R4 => Reg_4_out, 
       R5 => Reg_5_out, 
       R6 => Reg_6_out, 
       R7 => Reg_7_out,
       Reset => Reset, 
       EN => '1'
);

Mux_8_to_1_4bit_0: Mux_8_to_1_4bit
Port Map(
           R0 => Reg_0_out, 
           R1 => Reg_1_out, 
           R2 => Reg_2_out, 
           R3 => Reg_3_out, 
           R4 => Reg_4_out, 
           R5 => Reg_5_out, 
           R6 => Reg_6_out, 
           R7 => Reg_7_out, 
           Sel  => Reg_Sel_0,
           Y => Reg_Sel_0_out
           --EN => '1'
);

Mux_8_to_1_4bit_1: Mux_8_to_1_4bit
Port Map(
           R0 => Reg_0_out, 
           R1 => Reg_1_out, 
           R2 => Reg_2_out, 
           R3 => Reg_3_out, 
           R4 => Reg_4_out, 
           R5 => Reg_5_out, 
           R6 => Reg_6_out, 
           R7 => Reg_7_out, 
           Sel  => Reg_Sel_1,
           Y => Reg_Sel_1_out
           --EN => '1'
);

ASunit_4_0:ASUnit_4
Port Map( 
           A => Reg_Sel_0_out,
           B => Reg_Sel_1_out,
           C => AddSubSel,
           S => AddSubOut,
           Overflow => Overflow,
           Zero => Zero
           --C_out => C_out
);

Mux_2_to_1_4bit_0 : Mux_2_to_1_4bit
Port Map( 
           R0 => AddSubOut,
           R1 => Immediate_Value,
           Y => Mux_Reg_Bank,
           Sel => Mux_Decoder_Sel
           --EN => '1'
    );

Ins_Decoder_0 : Ins_Decoder
Port Map ( 
           Ins_Bus => Rom_out,
           Reg_Jump_Check =>Reg_Sel_0_out, 
           Reg_En => Decoder_Reg_Bank,
           Load_Sel => Mux_Decoder_Sel,
           Immediate_Value => Immediate_Value,
           RegS_Mux_A => Reg_Sel_0,
           RegS_Mux_B => Reg_Sel_1,
           AS_Sel => AddSubSel,
           Jump_Flag => JumpFlag,
           Jump_Address =>JumpAddress
);

Adder_3_0: Adder_3
Port Map (
       A => PC_out,
       B => "001",
       S => Bit_3_adder_out,
       Carry_in => '0'
--       Carry_out =>  -- Not mapped
);

Mux_2_to_1_3bit_0:Mux_2_to_1_3bit
Port Map( 
           R0 => Bit_3_adder_out,
           R1 => JumpAddress,
           Y => PC_in,
           Sel => JumpFlag
           --EN => '1'
);

PC_3bit_0: PC_3bit
Port Map( 
           D => PC_in,
           Q => PC_out,
           clr => Reset,
           Clk => Clk
);

Prog_ROM_0:Prog_ROM
Port Map(
           Address => PC_out,
           Ins_Bus => Rom_out
);

R7_out <= Reg_7_out;

end Behavioral;