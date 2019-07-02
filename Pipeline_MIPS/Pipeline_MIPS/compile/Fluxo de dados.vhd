-------------------------------------------------------------------------------
--
-- Title       : 
-- Design      : Pipeline_MIPS
-- Author      : 
-- Company     : 
--
-------------------------------------------------------------------------------
--
-- File        : C:\Users\david\OneDrive\Documentos\GitHub\Pipeline_orgarq\Pipeline_MIPS\Pipeline_MIPS\compile\Fluxo de dados.vhd
-- Generated   : Tue Jul  2 02:28:28 2019
-- From        : C:\Users\david\OneDrive\Documentos\GitHub\Pipeline_orgarq\Pipeline_MIPS\Pipeline_MIPS\src\Fluxo de dados.bde
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

signal PCSsc : STD_LOGIC;
signal RegWrite : STD_LOGIC;
signal EXE_MEM : STD_LOGIC_VECTOR(107 downto 0);
signal ID_EXE : STD_LOGIC_VECTOR(173 downto 0);
signal IF_ID : STD_LOGIC_VECTOR(63 downto 0);
signal MEM_WB : STD_LOGIC_VECTOR(70 downto 0);
signal PC : STD_LOGIC_VECTOR(31 downto 0);
signal RegDst : STD_LOGIC_VECTOR(4 downto 0);
signal RegDstData : STD_LOGIC_VECTOR(31 downto 0);

begin

----  Component instantiations  ----

U2 : Instruction_Fetch_sstage
  port map(
       Clock => Clock,
       OUT_MEM => PC,
       PCSrc => PCSsc
  );

U3 : Instruction_Decode_Stage
  port map(
       CLK => Clock,
       OutID => ID_EXE,
       OutIF => IF_ID,
       RegWrite => RegWrite,
       regDst => RegDst,
       regDstData => RegDstData
  );

U4 : Instruction_Execute_Stage
  port map(
       Clock => Clock,
       EXE_Out => EXE_MEM,
       ID_EX_Out => ID_EXE
  );

U6 : Acesso_Memoria
  port map(
       Clock => Clock,
       EX_MEM_Out => EXE_MEM,
       MEM_WB_Out => MEM_WB,
       PC => PC,
       PCSrc => PCSsc
  );

U7 : Write_Back_Stage
  port map(
       MEM_WB_Out => MEM_WB,
       RegWrite => RegWrite,
       Write_back => RegDstData,
       sel_reg => RegDst
  );


end Esquema_Geral;
