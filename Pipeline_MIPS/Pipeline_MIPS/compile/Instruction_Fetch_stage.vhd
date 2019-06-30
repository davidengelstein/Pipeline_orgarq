-------------------------------------------------------------------------------
--
-- Title       : No Title
-- Design      : Pipeline_MIPS
-- Author      : Igor Ortega
-- Company     : POLI USP
--
-------------------------------------------------------------------------------
--
-- File        : C:\Users\Igor Ortega\Documents\GitHub\Pipeline_orgarq\Pipeline_MIPS\Pipeline_MIPS\compile\Instruction_Fetch_stage.vhd
-- Generated   : Sun Jun 30 19:16:38 2019
-- From        : C:\Users\Igor Ortega\Documents\GitHub\Pipeline_orgarq\Pipeline_MIPS\Pipeline_MIPS\src\Instruction_Fetch_stage.bde
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

entity Instruction_Fetch_sstage is
  port(
       Clock : in STD_LOGIC;
       PCSrc : in STD_LOGIC;
       OUT_MEM : in STD_LOGIC_VECTOR(31 downto 0);
       OUT_IF : out STD_LOGIC_VECTOR(63 downto 0)
  );
end Instruction_Fetch_sstage;

architecture Instruction_Fetch_sstage of Instruction_Fetch_sstage is

---- Component declarations -----

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
component ram
  generic(
       BP : integer := 16;
       BE : integer := 8;
       Tread : time := 5 ns;
       Twrite : time := 5 ns;
       Tsetup : time := 2 ns;
       NA : string := "mram.txt";
       Tz : time := 2 ns
  );
  port (
       Clock : in STD_LOGIC;
       enable : in STD_LOGIC;
       ender : in STD_LOGIC_VECTOR(BE - 1 downto 0);
       rw : in STD_LOGIC;
       pronto : out STD_LOGIC;
       dado : inout STD_LOGIC_VECTOR(BP - 1 downto 0)
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
component somador
  generic(
       NumeroBits : integer := 8;
       Tsoma : time := 3 ns;
       Tinc : time := 2 ns
  );
  port (
       A : in STD_LOGIC_VECTOR(NumeroBits - 1 downto 0);
       B : in STD_LOGIC_VECTOR(NumeroBits - 1 downto 0);
       S : in STD_LOGIC;
       Vum : in STD_LOGIC;
       C : out STD_LOGIC_VECTOR(NumeroBits - 1 downto 0)
  );
end component;

----     Constants     -----
constant DANGLING_INPUT_CONSTANT : STD_LOGIC := 'Z';

---- Signal declarations used on the diagram ----

signal IF_ID_In : STD_LOGIC_VECTOR(63 downto 0);
signal INST : STD_LOGIC_VECTOR(31 downto 0);
signal PC : STD_LOGIC_VECTOR(31 downto 0);
signal PC_in : STD_LOGIC_VECTOR(31 downto 0);
signal PC_mais_quatro : STD_LOGIC_VECTOR(31 downto 0);
signal value_quatro : STD_LOGIC_VECTOR(31 downto 0);

---- Declaration for Dangling input ----
signal Dangling_Input_Signal : STD_LOGIC;

begin

---- User Signal Assignments ----
IF_ID_In(31 downto 0)<=PC_mais_quatro(31 downto 0);
IF_ID_In(63 downto 32)<=INST(31 downto 0); 
value_quatro(31 downto 0)<="00000000000000000000000000000100";

----  Component instantiations  ----

U10 : ram
  port map(
       Clock => Clock,
       dado => INST(31 downto 0),
       enable => Dangling_Input_Signal,
       ender => PC(31 downto 0),
       rw => Dangling_Input_Signal
  );

U6 : Reg_ClkEnable
  generic map(
       NumeroBits => 32
  )
  port map(
       C => Clock,
       CE => Dangling_Input_Signal,
       D => PC_in(31 downto 0),
       Q => PC(31 downto 0),
       R => Dangling_Input_Signal,
       S => Dangling_Input_Signal
  );

U7 : Mux2x1
  generic map(
       NB => 35
  )
  port map(
       I0 => PC_mais_quatro(31 downto 0),
       I1 => OUT_MEM(31 downto 0),
       O => PC_in(31 downto 0),
       Sel => PCSrc
  );

U8 : somador
  generic map(
       NumeroBits => 32
  )
  port map(
       A => PC(31 downto 0),
       B => value_quatro(31 downto 0),
       C => PC_mais_quatro(31 downto 0),
       S => Dangling_Input_Signal,
       Vum => Dangling_Input_Signal
  );

U9 : Reg_ClkEnable
  generic map(
       NumeroBits => 64
  )
  port map(
       C => Clock,
       CE => Dangling_Input_Signal,
       D => IF_ID_In(63 downto 0),
       Q => OUT_IF(63 downto 0),
       R => Dangling_Input_Signal,
       S => Dangling_Input_Signal
  );


---- Dangling input signal assignment ----

Dangling_Input_Signal <= DANGLING_INPUT_CONSTANT;

end Instruction_Fetch_sstage;
