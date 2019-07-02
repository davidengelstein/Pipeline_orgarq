-------------------------------------------------------------------------------
--
-- Title       : No Title
-- Design      : Pipeline_MIPS
-- Author      : Davidengelstein
-- Company     : Davidengelstein
--
-------------------------------------------------------------------------------
--
-- File        : C:\Users\Igor Ortega\Documents\GitHub\Pipeline_orgarq\Pipeline_MIPS\Pipeline_MIPS\compile\Write_Back_Stage.vhd
-- Generated   : Tue Jul  2 01:31:39 2019
-- From        : C:\Users\Igor Ortega\Documents\GitHub\Pipeline_orgarq\Pipeline_MIPS\Pipeline_MIPS\src\Write_Back_Stage.bde
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

entity Write_Back_Stage is
  port(
       MEM_WB_Out : in STD_LOGIC_VECTOR(70 downto 0);
       RegWrite : out STD_LOGIC;
       Write_back : out STD_LOGIC_VECTOR(31 downto 0);
       sel_reg : out STD_LOGIC_VECTOR(4 downto 0)
  );
end Write_Back_Stage;

architecture Write_Back_Stage of Write_Back_Stage is

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

---- Signal declarations used on the diagram ----

signal MemtoReg : STD_LOGIC;
signal BusOutput1 : STD_LOGIC_VECTOR(1 downto 0);
signal Controle : STD_LOGIC_VECTOR(1 downto 0);
signal dado_memoria : STD_LOGIC_VECTOR(31 downto 0);
signal end_memoria : STD_LOGIC_VECTOR(31 downto 0);

begin

---- User Signal Assignments ----
dado_memoria(31 downto 0) <= MEM_WB_Out(31 downto 0);
sel_reg(4 downto 0) <= MEM_WB_Out(36 downto 32);
end_memoria(31 downto 0) <= MEM_WB_Out(68 downto 37);
Controle(1 downto 0) <= MEM_WB_Out(70 downto 69); 

RegWrite <= Controle(0);
MemtoReg <= Controle(1);



----  Component instantiations  ----

U1 : Mux2x1
  generic map(
       NB => 32
  )
  port map(
       I0 => end_memoria(31 downto 0),
       I1 => dado_memoria(31 downto 0),
       O => Write_back(31 downto 0),
       Sel => MemtoReg
  );


---- Terminal assignment ----

    -- Output\buffer terminals
	sel_reg(3) <= BusOutput1(0);
	sel_reg(4) <= BusOutput1(1);


end Write_Back_Stage;
