-------------------------------------------------------------------------------
--
-- Title       : No Title
-- Design      : Pipeline_MIPS
-- Author      : Davidengelstein
-- Company     : Davidengelstein
--
-------------------------------------------------------------------------------
--
-- File        : C:\Users\david\OneDrive\Documentos\GitHub\Pipeline_orgarq\Pipeline_MIPS\Pipeline_MIPS\compile\Instruction_Execute_Stage.vhd
-- Generated   : Tue Jul  2 02:22:54 2019
-- From        : C:\Users\david\OneDrive\Documentos\GitHub\Pipeline_orgarq\Pipeline_MIPS\Pipeline_MIPS\src\Instruction_Execute_Stage.bde
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

entity Instruction_Execute_Stage is
  port(
       Clock : in STD_LOGIC;
       ID_EX_Out : in STD_LOGIC_VECTOR(173 downto 0);
       EXE_Out : out STD_LOGIC_VECTOR(107 downto 0)
  );
end Instruction_Execute_Stage;

architecture Instruction_Execute_Stage of Instruction_Execute_Stage is

---- Component declarations -----

component ALU_Control
  port (
       ALUOp : in STD_LOGIC_VECTOR(1 downto 0);
       funct : in STD_LOGIC_VECTOR(5 downto 0);
       Controle_ALU : out STD_LOGIC_VECTOR(2 downto 0)
  );
end component;
component deslocador_combinatorio
  generic(
       NB : integer := 8;
       Tprop : time := 1 ns;
       NBD : integer := 1
  );
  port (
       DE : in STD_LOGIC;
       I : in STD_LOGIC_VECTOR(NB - 1 downto 0);
       O : out STD_LOGIC_VECTOR(NB - 1 downto 0)
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
component ula
  generic(
       NB : integer := 8;
       Tsom : time := 5 ns;
       Tsub : time := 5 ns;
       Ttrans : time := 5 ns;
       Tgate : time := 1 ns
  );
  port (
       A : in STD_LOGIC_VECTOR(NB - 1 downto 0);
       B : in STD_LOGIC_VECTOR(NB - 1 downto 0);
       Veum : in STD_LOGIC;
       cUla : in STD_LOGIC_VECTOR(2 downto 0);
       C : out STD_LOGIC_VECTOR(NB - 1 downto 0);
       Sinal : out STD_LOGIC;
       Vaum : out STD_LOGIC;
       Zero : out STD_LOGIC
  );
end component;

----     Constants     -----
constant DANGLING_INPUT_CONSTANT : STD_LOGIC := 'Z';
constant VCC_CONSTANT   : STD_LOGIC := '1';

---- Signal declarations used on the diagram ----

signal ALUSrc : STD_LOGIC;
signal Branch : STD_LOGIC;
signal NET704 : STD_LOGIC;
signal RegDst : STD_LOGIC;
signal value_um : STD_LOGIC;
signal VCC : STD_LOGIC;
signal zero : STD_LOGIC;
signal ALUOp : STD_LOGIC_VECTOR(1 downto 0);
signal Controle : STD_LOGIC_VECTOR(9 downto 0);
signal Controle_ALU : STD_LOGIC_VECTOR(2 downto 0);
signal end_jump : STD_LOGIC_VECTOR(25 downto 0);
signal ext_Immed_off : STD_LOGIC_VECTOR(31 downto 0);
signal EX_MEM_In : STD_LOGIC_VECTOR(107 downto 0);
signal funct : STD_LOGIC_VECTOR(5 downto 0);
signal jump_completo : STD_LOGIC_VECTOR(31 downto 0);
signal mux_out : STD_LOGIC_VECTOR(31 downto 0);
signal PC : STD_LOGIC_VECTOR(31 downto 0);
signal PC_branch_final : STD_LOGIC_VECTOR(31 downto 0);
signal pc_branch_inicial : STD_LOGIC_VECTOR(31 downto 0);
signal PC_mais_quatro : STD_LOGIC_VECTOR(31 downto 0);
signal Rd : STD_LOGIC_VECTOR(4 downto 0);
signal RsData : STD_LOGIC_VECTOR(31 downto 0);
signal Rt : STD_LOGIC_VECTOR(4 downto 0);
signal RtData : STD_LOGIC_VECTOR(31 downto 0);
signal sel_reg : STD_LOGIC_VECTOR(4 downto 0);
signal ULA_Out : STD_LOGIC_VECTOR(31 downto 0);

---- Declaration for Dangling input ----
signal Dangling_Input_Signal : STD_LOGIC;

begin

---- User Signal Assignments ----
Rt(4 downto 0) <=ID_EX_Out(4 downto 0);
Rd(4 downto 0) <=ID_EX_Out(9 downto 5);
ext_Immed_off(31 downto 0)<= ID_EX_Out(41 downto 10);
RtData(31 downto 0)<= ID_EX_Out(73 downto 42);
RsData(31 downto 0)<= ID_EX_Out(105 downto 74);
end_jump(25 downto 0)<= ID_EX_Out(131 downto 106);
PC_mais_quatro(31 downto 0) <= ID_EX_Out(163 downto 132);
Controle(9 downto 0) <= ID_EX_Out(173 downto 164);
funct(5 downto 0) <= ID_EX_Out(15 downto 10);
EX_MEM_In(31 downto 0) <= PC(31 downto 0);
EX_MEM_In(63 downto 32) <= ULA_Out(31 downto 0);
EX_MEM_In(68 downto 64) <= sel_reg(4 downto 0);
EX_MEM_In(100 downto 69) <= RtData(31 downto 0);
EX_MEM_In(101) <= zero;
EX_MEM_In(107 downto 102) <= Controle(9 downto 4);
jump_completo(31 downto 28) <= PC_mais_quatro(31 downto 28);
jump_completo(27 downto 2) <= end_jump(25 downto 0);
jump_completo(1) <= '0';
jump_completo(0) <='0';
RegDst <= Controle(0);
ALUOp(1 downto 0) <= Controle(2 downto 1);
ALUSrc <= Controle(3);
Branch <= Controle(4);

----  Component instantiations  ----

EXE_MEM : Reg_ClkEnable
  generic map(
       NumeroBits => 108
  )
  port map(
       C => NET704,
       CE => VCC,
       D => EX_MEM_In(107 downto 0),
       Q => EXE_Out(107 downto 0),
       R => Dangling_Input_Signal,
       S => Dangling_Input_Signal
  );

U10 : ula
  generic map(
       NB => 32
  )
  port map(
       A => RsData(31 downto 0),
       B => mux_out(31 downto 0),
       C => ULA_Out(31 downto 0),
       Veum => Dangling_Input_Signal,
       Zero => zero,
       cUla => Controle_ALU
  );

U12 : Mux2x1
  generic map(
       NB => 32
  )
  port map(
       I0 => RtData(31 downto 0),
       I1 => ext_Immed_off(31 downto 0),
       O => mux_out(31 downto 0),
       Sel => ALUSrc
  );

U2 : Mux2x1
  generic map(
       NB => 5
  )
  port map(
       I0 => Rt(4 downto 0),
       I1 => Rd(4 downto 0),
       O => sel_reg(4 downto 0),
       Sel => RegDst
  );

U3 : ALU_Control
  port map(
       ALUOp => ALUOp,
       Controle_ALU => Controle_ALU,
       funct => funct
  );

U6 : Mux2x1
  generic map(
       NB => 32
  )
  port map(
       I0 => PC_branch_final(31 downto 0),
       I1 => jump_completo(31 downto 0),
       O => PC(31 downto 0),
       Sel => Branch
  );

U7 : ula
  generic map(
       NB => 32
  )
  port map(
       A => PC_mais_quatro(31 downto 0),
       B => pc_branch_inicial(31 downto 0),
       C => PC_branch_final(31 downto 0),
       cUla(0) => Dangling_Input_Signal,
       cUla(1) => Dangling_Input_Signal,
       cUla(2) => Dangling_Input_Signal,
       Veum => Dangling_Input_Signal
  );

U8 : deslocador_combinatorio
  generic map(
       NB => 32,
       NBD => 32
  )
  port map(
       DE => value_um,
       I => ext_Immed_off(31 downto 0),
       O => pc_branch_inicial(31 downto 0)
  );


---- Power , ground assignment ----

VCC <= VCC_CONSTANT;
value_um <= VCC;

---- Terminal assignment ----

    -- Inputs terminals
	NET704 <= Clock;


---- Dangling input signal assignment ----

Dangling_Input_Signal <= DANGLING_INPUT_CONSTANT;

end Instruction_Execute_Stage;
