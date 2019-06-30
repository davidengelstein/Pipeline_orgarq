-------------------------------------------------------------------------------
--
-- Title       : No Title
-- Design      : Pipeline_MIPS
-- Author      : Davidengelstein
-- Company     : Davidengelstein
--
-------------------------------------------------------------------------------
--
-- File        : C:\Users\david\OneDrive\Documentos\GitHub\Pipeline_orgarq\Pipeline_MIPS\Pipeline_MIPS\compile\Instruction_Fetch_stage.vhd
-- Generated   : Sun Jun 30 15:41:15 2019
-- From        : C:\Users\david\OneDrive\Documentos\GitHub\Pipeline_orgarq\Pipeline_MIPS\Pipeline_MIPS\src\Instruction_Fetch_stage.bde
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

-- other libraries declarations
library BIBLIOTECA_DE_COMPONENTES;

entity Instruction_Fetch_stage is
  port(
       Input_value4 : in STD_LOGIC := 4
  );
end Instruction_Fetch_stage;

architecture Instruction_Fetch_stage of Instruction_Fetch_stage is

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

signal BUS29838 : STD_LOGIC_VECTOR(NumeroBits downto 0);
signal BUS29869 : STD_LOGIC_VECTOR(NumeroBits downto 0);
signal C : STD_LOGIC_VECTOR(63 downto 0);
signal INST : STD_LOGIC_VECTOR(31 downto 0);
signal PC : STD_LOGIC_VECTOR(31 downto 0);

---- Declaration for Dangling input ----
signal Dangling_Input_Signal : STD_LOGIC;

begin

---- User Signal Assignments ----
C(31 downto 0)<=PC(31 downto 0);
C(63 downto 32)<=INST(31 downto 0); 

----  Component instantiations  ----

U1 : Reg_ClkEnable
  generic map(
       NumeroBits => 32
  )
  port map(
       C => Dangling_Input_Signal,
       CE => Dangling_Input_Signal,
       D => BUS29838(NumeroBits downto 0),
       Q => BUS29869(NumeroBits downto 0),
       R => Dangling_Input_Signal,
       S => Dangling_Input_Signal
  );

U3 : Mux2x1
  port map(
       I0 => PC(31 downto 0),
       O => BUS29838(NumeroBits downto 0),
       Sel => Dangling_Input_Signal
  );

U4 : somador
  port map(
       A => BUS29869(31 downto 0),
       B => Input_value4,
       C => PC(31 downto 0),
       S => Dangling_Input_Signal,
       Vum => Dangling_Input_Signal
  );

U5 : ram
  port map(
       Clock => Dangling_Input_Signal,
       enable => Dangling_Input_Signal,
       ender => BUS29869(NumeroBits downto 0),
       pronto => INST(31),
       rw => Dangling_Input_Signal
  );

U6 : Reg_ClkEnable
  generic map(
       NumeroBits => 64
  )
  port map(
       C => Dangling_Input_Signal,
       CE => Dangling_Input_Signal,
       D => C(63 downto 0),
       R => Dangling_Input_Signal,
       S => Dangling_Input_Signal
  );


---- Dangling input signal assignment ----

Dangling_Input_Signal <= DANGLING_INPUT_CONSTANT;

end Instruction_Fetch_stage;
