-------------------------------------------------------------------------------
--
-- Title       : No Title
-- Design      : Pipeline_MIPS
-- Author      : Davidengelstein
-- Company     : Davidengelstein
--
-------------------------------------------------------------------------------
--
-- File        : C:\Users\david\OneDrive\Documentos\GitHub\Pipeline_orgarq\Pipeline_MIPS\Pipeline_MIPS\compile\Acesso_Memoria_Stage.vhd
-- Generated   : Tue Jul  2 02:22:58 2019
-- From        : C:\Users\david\OneDrive\Documentos\GitHub\Pipeline_orgarq\Pipeline_MIPS\Pipeline_MIPS\src\Acesso_Memoria_Stage.bde
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

entity Acesso_Memoria is
  port(
       Clock : in STD_LOGIC;
       EX_MEM_Out : in STD_LOGIC_VECTOR(107 downto 0);
       MemRead : out STD_LOGIC;
       PCSrc : out STD_LOGIC;
       MEM_WB_Out : out STD_LOGIC_VECTOR(70 downto 0);
       PC : out STD_LOGIC_VECTOR(31 downto 0)
  );
end Acesso_Memoria;

architecture Acesso_Memoria of Acesso_Memoria is

---- Component declarations -----

component cache_D
  port (
       MemRead : in STD_LOGIC;
       MemWrite : in STD_LOGIC;
       addr : in STD_LOGIC_VECTOR(31 downto 0);
       data_IN : in STD_LOGIC_VECTOR(31 downto 0);
       data_OUT : out STD_LOGIC_VECTOR(31 downto 0)
  );
end component;
component Reg_ClkEnable
  generic(
       NumeroBits : INTEGER := 8
-- synthesis translate_off
       ;
       Tprop : TIME := 5 ns;
       Tsetup : TIME := 2 ns
-- synthesis translate_on
  );
  port (
       C : in STD_LOGIC;
       CE : in STD_LOGIC;
       D : in STD_LOGIC_VECTOR(NumeroBits-1 downto 0);
       R : in STD_LOGIC;
       S : in STD_LOGIC;
       Q : out STD_LOGIC_VECTOR(NumeroBits-1 downto 0)
  );
end component;

----     Constants     -----
constant DANGLING_INPUT_CONSTANT : STD_LOGIC := 'Z';
constant VCC_CONSTANT   : STD_LOGIC := '1';

---- Signal declarations used on the diagram ----

signal Branch : STD_LOGIC;
signal Jump : STD_LOGIC;
signal MemWrite : STD_LOGIC;
signal NET467 : STD_LOGIC;
signal NET522 : STD_LOGIC;
signal VCC : STD_LOGIC;
signal zero : STD_LOGIC;
signal Controle : STD_LOGIC_VECTOR(5 downto 0);
signal dado_memoria : STD_LOGIC_VECTOR(31 downto 0);
signal end_memoria : STD_LOGIC_VECTOR(31 downto 0);
signal EXE_Out : STD_LOGIC_VECTOR(107 downto 0);
signal MEM_WB_In : STD_LOGIC_VECTOR(70 downto 0);
signal RtData : STD_LOGIC_VECTOR(31 downto 0);
signal sel_reg : STD_LOGIC_VECTOR(4 downto 0);

---- Declaration for Dangling input ----
signal Dangling_Input_Signal : STD_LOGIC;

begin

---- User Signal Assignments ----
PC(31 downto 0) <= EX_MEM_Out(31 downto 0);
end_memoria(31 downto 0) <= EX_MEM_Out(63 downto 32);
sel_reg(4 downto 0) <= EX_MEM_Out(68 downto 64);
RtData(31 downto 0) <= EX_MEM_Out(100 downto 69);
zero <= EX_MEM_Out(101);
Controle(5 downto 0) <= EX_MEM_Out(107 downto 102);
MEM_WB_In(31 downto 0) <= dado_memoria(31 downto 0);
MEM_WB_In(36 downto 32) <= sel_reg(4 downto 0);
MEM_WB_In(68 downto 37) <= end_memoria(31 downto 0);
MEM_WB_In(70 downto 69) <= Controle(5 downto 4);
Branch <= Controle(0);
Jump <= Controle(1);
MemRead <= Controle(2);
MemWrite <= Controle(3);

----  Component instantiations  ----

MEM_WB : Reg_ClkEnable
  generic map(
       NumeroBits => 71
  )
  port map(
       C => NET522,
       CE => VCC,
       D => MEM_WB_In(70 downto 0),
       Q => MEM_WB_Out(70 downto 0),
       R => Dangling_Input_Signal,
       S => Dangling_Input_Signal
  );

U1 : cache_D
  port map(
       addr(0) => Dangling_Input_Signal,
       addr(1) => Dangling_Input_Signal,
       addr(2) => Dangling_Input_Signal,
       addr(3) => Dangling_Input_Signal,
       addr(4) => Dangling_Input_Signal,
       addr(5) => Dangling_Input_Signal,
       addr(6) => Dangling_Input_Signal,
       addr(7) => Dangling_Input_Signal,
       addr(8) => Dangling_Input_Signal,
       addr(9) => Dangling_Input_Signal,
       addr(10) => Dangling_Input_Signal,
       addr(11) => Dangling_Input_Signal,
       addr(12) => Dangling_Input_Signal,
       addr(13) => Dangling_Input_Signal,
       addr(14) => Dangling_Input_Signal,
       addr(15) => Dangling_Input_Signal,
       addr(16) => Dangling_Input_Signal,
       addr(17) => Dangling_Input_Signal,
       addr(18) => Dangling_Input_Signal,
       addr(19) => Dangling_Input_Signal,
       addr(20) => Dangling_Input_Signal,
       addr(21) => Dangling_Input_Signal,
       addr(22) => Dangling_Input_Signal,
       addr(23) => Dangling_Input_Signal,
       addr(24) => Dangling_Input_Signal,
       addr(25) => Dangling_Input_Signal,
       addr(26) => Dangling_Input_Signal,
       addr(27) => Dangling_Input_Signal,
       addr(28) => Dangling_Input_Signal,
       addr(29) => Dangling_Input_Signal,
       addr(30) => Dangling_Input_Signal,
       addr(31) => Dangling_Input_Signal,
       data_IN(0) => Dangling_Input_Signal,
       data_IN(1) => Dangling_Input_Signal,
       data_IN(2) => Dangling_Input_Signal,
       data_IN(3) => Dangling_Input_Signal,
       data_IN(4) => Dangling_Input_Signal,
       data_IN(5) => Dangling_Input_Signal,
       data_IN(6) => Dangling_Input_Signal,
       data_IN(7) => Dangling_Input_Signal,
       data_IN(8) => Dangling_Input_Signal,
       data_IN(9) => Dangling_Input_Signal,
       data_IN(10) => Dangling_Input_Signal,
       data_IN(11) => Dangling_Input_Signal,
       data_IN(12) => Dangling_Input_Signal,
       data_IN(13) => Dangling_Input_Signal,
       data_IN(14) => Dangling_Input_Signal,
       data_IN(15) => Dangling_Input_Signal,
       data_IN(16) => Dangling_Input_Signal,
       data_IN(17) => Dangling_Input_Signal,
       data_IN(18) => Dangling_Input_Signal,
       data_IN(19) => Dangling_Input_Signal,
       data_IN(20) => Dangling_Input_Signal,
       data_IN(21) => Dangling_Input_Signal,
       data_IN(22) => Dangling_Input_Signal,
       data_IN(23) => Dangling_Input_Signal,
       data_IN(24) => Dangling_Input_Signal,
       data_IN(25) => Dangling_Input_Signal,
       data_IN(26) => Dangling_Input_Signal,
       data_IN(27) => Dangling_Input_Signal,
       data_IN(28) => Dangling_Input_Signal,
       data_IN(29) => Dangling_Input_Signal,
       data_IN(30) => Dangling_Input_Signal,
       data_IN(31) => Dangling_Input_Signal,
       MemRead => Dangling_Input_Signal,
       MemWrite => MemWrite,
       data_OUT => dado_memoria
  );

NET467 <= zero and Branch;

PCSrc <= NET467 or Jump;


---- Power , ground assignment ----

VCC <= VCC_CONSTANT;

---- Terminal assignment ----

    -- Inputs terminals
	NET522 <= Clock;
	EXE_Out <= EX_MEM_Out;


---- Dangling input signal assignment ----

Dangling_Input_Signal <= DANGLING_INPUT_CONSTANT;

end Acesso_Memoria;
