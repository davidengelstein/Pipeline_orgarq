-------------------------------------------------------------------------------
--
-- Title       : No Title
-- Design      : Pipeline_MIPS
-- Author      : Davidengelstein
-- Company     : Davidengelstein
--
-------------------------------------------------------------------------------
--
-- File        : C:\Users\Igor Ortega\Documents\GitHub\Pipeline_orgarq\Pipeline_MIPS\Pipeline_MIPS\compile\Instruction_Execute_Stage.vhd
-- Generated   : Sun Jun 30 22:12:40 2019
-- From        : C:\Users\Igor Ortega\Documents\GitHub\Pipeline_orgarq\Pipeline_MIPS\Pipeline_MIPS\src\Instruction_Execute_Stage.bde
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
       value_1 : in STD_LOGIC;
       Ctrl_Arit : in STD_LOGIC_VECTOR(10 downto 0);
       ID_EX_Out : in STD_LOGIC_VECTOR(163 downto 0);
       Op_Code : in STD_LOGIC_VECTOR(5 downto 0)
  );
end Instruction_Execute_Stage;

architecture Instruction_Execute_Stage of Instruction_Execute_Stage is

---- Component declarations -----

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

---- Signal declarations used on the diagram ----

signal Input3 : STD_LOGIC;
signal zero : STD_LOGIC;
signal bus464 : STD_LOGIC_VECTOR(31 downto 0);
signal ext_Immed_off : STD_LOGIC_VECTOR(31 downto 0);
signal EX_MEM_In : STD_LOGIC_VECTOR(64 downto 0);
signal mux_out : STD_LOGIC_VECTOR(31 downto 0);
signal PC : STD_LOGIC_VECTOR(31 downto 0);
signal PC_mais_quatro : STD_LOGIC_VECTOR(31 downto 0);
signal RsData : STD_LOGIC_VECTOR(31 downto 0);
signal RtData : STD_LOGIC_VECTOR(31 downto 0);
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
EX_MEM_In(31 downto 0) <= PC(31 downto 0);
EX_MEM_In(63 downto 32) <= ULA_Out(31 downto 0);
EX_MEM_In(64) <= zero;

----  Component instantiations  ----

U10 : ula
  generic map(
       NB => 32
  )
  port map(
       A => RsData(31 downto 0),
       B => mux_out(31 downto 0),
       C => ULA_Out(31 downto 0),
       cUla(0) => Dangling_Input_Signal,
       cUla(1) => Dangling_Input_Signal,
       cUla(2) => Dangling_Input_Signal,
       Veum => Dangling_Input_Signal,
       Zero => zero
  );

U12 : Mux2x1
  generic map(
       NB => 32
  )
  port map(
       I0 => RtData(31 downto 0),
       I1 => ext_Immed_off(31 downto 0),
       O => mux_out(31 downto 0),
       Sel => Dangling_Input_Signal
  );

U13 : Reg_ClkEnable
  port map(
       C => Dangling_Input_Signal,
       CE => Clock,
       D => EX_MEM_In(64 downto 0),
       R => Dangling_Input_Signal,
       S => Dangling_Input_Signal
  );

U7 : ula
  generic map(
       NB => 32
  )
  port map(
       A => PC_mais_quatro(31 downto 0),
       B => bus464(31 downto 0),
       C => PC(31 downto 0),
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
       DE => Input3,
       I => ext_Immed_off(31 downto 0),
       O => bus464(31 downto 0)
  );


---- Terminal assignment ----

    -- Inputs terminals
	Input3 <= value_1;


---- Dangling input signal assignment ----

Dangling_Input_Signal <= DANGLING_INPUT_CONSTANT;

end Instruction_Execute_Stage;
