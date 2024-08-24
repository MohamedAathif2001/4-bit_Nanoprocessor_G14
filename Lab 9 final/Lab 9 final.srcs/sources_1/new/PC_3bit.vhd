----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/30/2023 02:19:45 PM
-- Design Name: 
-- Module Name: PC_3bit - Behavioral
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

entity PC_3bit is

 Port ( D : in STD_LOGIC_VECTOR (2 downto 0);
        Clk : in STD_LOGIC;
        Clr : in STD_LOGIC;
        Q : out STD_LOGIC_VECTOR (2 downto 0));
 
end PC_3bit;

architecture Behavioral of PC_3bit is
    component D_FF
        Port (  D : in STD_LOGIC;
                Res : in STD_LOGIC;
                Clk : in STD_LOGIC;
                Q : out STD_LOGIC;
                Qbar : out STD_LOGIC
                );
end component;

begin
D_FF_0:D_FF
    port map(
        D=>D(0),
        Q=>Q(0),
        Res=>clr,
        Clk=>Clk
    );
D_FF_1:D_FF
    port map(
        D=>D(1),
        Q=>Q(1),
        Res=>clr,
        Clk=>Clk
    );
D_FF_2:D_FF
    port map(
        D=>D(2),
        Q=>Q(2),
        Res=>clr,
        Clk=>Clk
    );


end Behavioral;
