-------------------------------------------------------------------------------
--
-- Title       : No Title
-- Design      : Pipeline_MIPS
-- Author      : Igor Ortega
-- Company     : POLI USP
--
-------------------------------------------------------------------------------
--
-- File        : C:\Users\Igor Ortega\Documents\GitHub\Pipeline_orgarq\Pipeline_MIPS\Pipeline_MIPS\compile\Instruction_Decode_Stage.vhd
-- Generated   : Sun Jun 30 21:56:07 2019
-- From        : C:\Users\Igor Ortega\Documents\GitHub\Pipeline_orgarq\Pipeline_MIPS\Pipeline_MIPS\src\Instruction_Decode_Stage.bde
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

entity Instruction_Decode_Stage is
  port(
       CLK : in STD_LOGIC;
       WE : in STD_LOGIC;
       OutIF : in STD_LOGIC_VECTOR(63 downto 0);
       regDst : in STD_LOGIC_VECTOR(4 downto 0);
       regDstData : in STD_LOGIC_VECTOR(31 downto 0);
       Ctrl_Arit : out STD_LOGIC_VECTOR(10 downto 0);
       OpCode : out STD_LOGIC_VECTOR(5 downto 0);
       OutID : out STD_LOGIC_VECTOR(163 downto 0)
  );
end Instruction_Decode_Stage;

architecture Instruction_Decode_Stage of Instruction_Decode_Stage is

---- Component declarations -----

component dualregfile
  generic(
       NBend : integer := 4;
       NBdado : integer := 8;
       Tread : time := 5 ns;
       Twrite : time := 5 ns
  );
  port (
       clk : in STD_LOGIC;
       dadoina : in STD_LOGIC_VECTOR(NBdado - 1 downto 0);
       enda : in STD_LOGIC_VECTOR(NBend - 1 downto 0);
       endb : in STD_LOGIC_VECTOR(NBend - 1 downto 0);
       we : in STD_LOGIC;
       dadoouta : out STD_LOGIC_VECTOR(NBdado - 1 downto 0);
       dadooutb : out STD_LOGIC_VECTOR(NBdado - 1 downto 0)
  );
end component;
component Mux2x1
  generic(
       NB : INTEGER := 8
  );
  port (
       I0 : in STD_LOGIC_VECTOR(NB-1 downto 0);
       I1 : in STD_LOGIC_VECTOR(NB-1 downto 0);
       Sel : in STD_LOGIC;
       O : out STD_LOGIC_VECTOR(NB-1 downto 0)
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
component xsign
  generic(
       NBE : integer := 8;
       NBS : integer := 16
  );
  port (
       I : in STD_LOGIC_VECTOR(NBE - 1 downto 0);
       O : out STD_LOGIC_VECTOR(NBS - 1 downto 0)
  );
end component;

----     Constants     -----
constant DANGLING_INPUT_CONSTANT : STD_LOGIC := 'Z';

---- Signal declarations used on the diagram ----

signal BUS370 : STD_LOGIC_VECTOR(7 downto 0);
signal endJump : STD_LOGIC_VECTOR(25 downto 0);
signal ext_immed_off : STD_LOGIC_VECTOR(31 downto 0);
signal ID_EX_In : STD_LOGIC_VECTOR(163 downto 0);
signal immed_offset : STD_LOGIC_VECTOR(15 downto 0);
signal Inst : STD_LOGIC_VECTOR(31 downto 0);
signal PC_mais_quatro : STD_LOGIC_VECTOR(31 downto 0);
signal rd : STD_LOGIC_VECTOR(4 downto 0);
signal Rs : STD_LOGIC_VECTOR(4 downto 0);
signal RsData : STD_LOGIC_VECTOR(31 downto 0);
signal Rt : STD_LOGIC_VECTOR(4 downto 0);
signal RtData : STD_LOGIC_VECTOR(31 downto 0);

---- Declaration for Dangling input ----
signal Dangling_Input_Signal : STD_LOGIC;

begin

---- User Signal Assignments ----
Inst(31 downto 0)<=OutIF(31 downto 0);
PC_mais_quatro(31 downto 0)<=OutIF(63 downto 32);
Rs(4 downto 0)<=Inst(25 downto 21);
Rt(4 downto 0)<=Inst(20 downto 16);
Rd(4 downto 0)<=Inst(15 downto 11);
immed_offset(15 downto 0)<=Inst(15 downto 0);
endJump(25 downto 0)<=Inst(25 downto 0);
OpCode(5 downto 0)<=Inst(31 downto 26);
Ctrl_Arit(10 downto 0)<=Inst(10 downto 0);
ID_EX_In(4 downto 0)<=Rt(4 downto 0);
ID_EX_In(9 downto 5)<=Rd(4 downto 0);
ID_EX_In(41 downto 10)<=ext_Immed_off(31 downto 0);
ID_EX_In(73 downto 42)<=RtData(31 downto 0);
ID_EX_In(105 downto 74)<=RsData(31 downto 0);
ID_EX_In(131 downto 106)<=endJump(25 downto 0);
ID_EX_In(163 downto 132)<=PC_mais_quatro(31 downto 0);

----  Component instantiations  ----

Banco_De_Registradores : dualregfile
  generic map(
       NBend => 5,
       NBdado => 32
  )
  port map(
       clk => CLK,
       dadoina => regDstData(31 downto 0),
       dadoouta => RtData(31 downto 0),
       dadooutb => RsData(31 downto 0),
       enda => BUS370(7 downto 0),
       endb => Rs(4 downto 0),
       we => WE
  );

Extende_sinal : xsign
  generic map(
       NBE => 16,
       NBS => 32
  )
  port map(
       I => immed_offset(15 downto 0),
       O => ext_immed_off(31 downto 0)
  );

ID_EX : Reg_ClkEnable
  generic map(
       NumeroBits => 164
  )
  port map(
       C => CLK,
       CE => Dangling_Input_Signal,
       D => ID_EX_In(163 downto 0),
       Q => OutID(92 downto 0),
       R => Dangling_Input_Signal,
       S => Dangling_Input_Signal
  );

Read_Write_Mux : Mux2x1
  generic map(
       NB => 5
  )
  port map(
       I0 => Rt(4 downto 0),
       I1 => regDst(4 downto 0),
       O => BUS370(7 downto 0),
       Sel => WE
  );


---- Dangling input signal assignment ----

Dangling_Input_Signal <= DANGLING_INPUT_CONSTANT;

end Instruction_Decode_Stage;
