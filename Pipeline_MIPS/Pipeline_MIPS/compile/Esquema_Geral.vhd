-------------------------------------------------------------------------------
--
-- Title       : 
-- Design      : Pipeline_MIPS
-- Author      : 
-- Company     : 
--
-------------------------------------------------------------------------------
--
-- File        : C:\Users\Igor Ortega\Documents\GitHub\Pipeline_orgarq\Pipeline_MIPS\Pipeline_MIPS\compile\Esquema_Geral.vhd
-- Generated   : Tue Jul  2 01:31:38 2019
-- From        : C:\Users\Igor Ortega\Documents\GitHub\Pipeline_orgarq\Pipeline_MIPS\Pipeline_MIPS\src\Esquema_Geral.bde
-- By          : Bde2Vhdl ver. 2.6
--
-------------------------------------------------------------------------------
--
-- Description : 
--
-------------------------------------------------------------------------------
-- Design unit header --
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_signed.all;
use IEEE.std_logic_unsigned.all;

entity Esquema_Geral is
  port(
       Clock : in STD_LOGIC
  );
end Esquema_Geral;

architecture Esquema_Geral of Esquema_Geral is

---- Component declarations -----

component Acesso_Memoria
  port (
       Clock : in STD_LOGIC;
       EX_MEM_Out : in STD_LOGIC_VECTOR(107 downto 0);
       MEM_WB_Out : out STD_LOGIC_VECTOR(70 downto 0);
       MemRead : out STD_LOGIC;
       PC : out STD_LOGIC_VECTOR(31 downto 0);
       PCSrc : out STD_LOGIC
  );
end component;
component Instruction_Decode_Stage
  port (
       CLK : in STD_LOGIC;
       OutIF : in STD_LOGIC_VECTOR(63 downto 0);
       RegWrite : in STD_LOGIC;
       regDst : in STD_LOGIC_VECTOR(4 downto 0);
       regDstData : in STD_LOGIC_VECTOR(31 downto 0);
       Ctrl_Arit : out STD_LOGIC_VECTOR(10 downto 0);
       OutID : out STD_LOGIC_VECTOR(173 downto 0)
  );
end component;
component Instruction_Execute_Stage
  port (
       Clock : in STD_LOGIC;
       ID_EX_Out : in STD_LOGIC_VECTOR(173 downto 0);
       EXE_Out : out STD_LOGIC_VECTOR(107 downto 0)
  );
end component;
component Instruction_Fetch_sstage
  port (
       Clock : in STD_LOGIC;
       OUT_MEM : in STD_LOGIC_VECTOR(31 downto 0);
       PCSrc : in STD_LOGIC;
       OUT_IF : out STD_LOGIC_VECTOR(63 downto 0)
  );
end component;
component Write_Back_Stage
  port (
       MEM_WB_Out : in STD_LOGIC_VECTOR(70 downto 0);
       RegWrite : out STD_LOGIC;
       Write_back : out STD_LOGIC_VECTOR(31 downto 0);
       sel_reg : out STD_LOGIC_VECTOR(4 downto 0)
  );
end component;

---- Signal declarations used on the diagram ----

signal NET498 : STD_LOGIC;
signal NET650 : STD_LOGIC;
signal BUS486 : STD_LOGIC_VECTOR(4 downto 0);
signal BUS510 : STD_LOGIC_VECTOR(63 downto 0);
signal BUS518 : STD_LOGIC_VECTOR(107 downto 0);
signal BUS632 : STD_LOGIC_VECTOR(70 downto 0);
signal BUS640 : STD_LOGIC_VECTOR(173 downto 0);
signal BUS662 : STD_LOGIC_VECTOR(31 downto 0);
signal BUS718 : STD_LOGIC_VECTOR(31 downto 0);

begin

----  Component instantiations  ----

U2 : Instruction_Fetch_sstage
  port map(
       Clock => Clock,
       OUT_MEM => BUS718,
       PCSrc => NET498
  );

U3 : Instruction_Decode_Stage
  port map(
       CLK => Clock,
       OutID => BUS640,
       OutIF => BUS510,
       RegWrite => NET650,
       regDst => BUS486,
       regDstData => BUS662
  );

U4 : Instruction_Execute_Stage
  port map(
       Clock => Clock,
       EXE_Out => BUS518,
       ID_EX_Out => BUS640
  );

U6 : Acesso_Memoria
  port map(
       Clock => Clock,
       EX_MEM_Out => BUS518,
       MEM_WB_Out => BUS632,
       PC => BUS718,
       PCSrc => NET498
  );

U7 : Write_Back_Stage
  port map(
       MEM_WB_Out => BUS632,
       RegWrite => NET650,
       Write_back => BUS662,
       sel_reg => BUS486
  );


end Esquema_Geral;
