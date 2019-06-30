-------------------------------------------------------------------------------
--
-- Title       : No Title
-- Design      : Pipeline_MIPS
-- Author      : Davidengelstein
-- Company     : Davidengelstein
--
-------------------------------------------------------------------------------
--
-- File        : c:\Users\david\OneDrive\Documentos\GitHub\Pipeline_orgarq\Pipeline_MIPS\Pipeline_MIPS\compile\Instruction_Fetch_stage.vhd
-- Generated   : Sun Jun 30 16:52:14 2019
-- From        : c:\Users\david\OneDrive\Documentos\GitHub\Pipeline_orgarq\Pipeline_MIPS\Pipeline_MIPS\src\Instruction_Fetch_stage.bde
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
       B : in STD_LOGIC_VECTOR(NumeroBits - 1 downto 0)
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

signal bus1 : STD_LOGIC_VECTOR(NumeroBits - 1 downto 0);
signal bus2222 : STD_LOGIC_VECTOR(NumeroBits - 1 downto 0);
signal bus660 : STD_LOGIC_VECTOR(NumeroBits - 1 downto 0);
signal dados : STD_LOGIC_VECTOR(NumeroBits - 1 downto 0);
signal INST : STD_LOGIC_VECTOR(NumeroBits-1 downto 0);

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
       D => bus660(NumeroBits - 1 downto 0),
       Q => bus2222(NumeroBits - 1 downto 0),
       R => Dangling_Input_Signal,
       S => Dangling_Input_Signal
  );

U2 : Reg_ClkEnable
  generic map(
       NumeroBits => 64
  )
  port map(
       C => Dangling_Input_Signal,
       CE => Dangling_Input_Signal,
       D => dados(NumeroBits - 1 downto 0),
       R => Dangling_Input_Signal,
       S => Dangling_Input_Signal
  );

U3 : Mux2x1
  generic map(
       NB => 35
  )
  port map(
       I0 => bus1(NumeroBits - 1 downto 0),
       O => bus660(NumeroBits - 1 downto 0),
       Sel => Dangling_Input_Signal
  );

U4 : somador
  generic map(
       NumeroBits => 32
  )
  port map(
       A => bus2222(NumeroBits - 1 downto 0),
       B => B(NumeroBits - 1 downto 0),
       C => bus1(NumeroBits - 1 downto 0),
       S => Dangling_Input_Signal,
       Vum => Dangling_Input_Signal
  );

U5 : ram
  generic map(
       BP => 32,
       BE => 32
  )
  port map(
       Clock => Dangling_Input_Signal,
       dado => INST(NumeroBits-1 downto 0),
       enable => Dangling_Input_Signal,
       ender => bus2222(NumeroBits - 1 downto 0),
       rw => Dangling_Input_Signal
  );


---- Dangling input signal assignment ----

Dangling_Input_Signal <= DANGLING_INPUT_CONSTANT;

end Instruction_Fetch_stage;
