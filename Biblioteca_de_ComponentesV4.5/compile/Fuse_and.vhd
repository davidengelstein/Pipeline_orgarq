-------------------------------------------------------------------------------
--
-- Title       : Fusivel
-- Design      : Biblioteca_de_Componentes
-- Author      : Wilson Ruggiero
-- Company     : LARC-EPUSP
--
-------------------------------------------------------------------------------
--
-- File        : C:\My_Designs\Biblioteca_de_ComponentesV4.5\compile\Fuse_and.vhd
-- Generated   : Thu Feb  1 16:01:22 2018
-- From        : C:\My_Designs\Biblioteca_de_ComponentesV4.5\src\Fuse_and.bde
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


entity Fuse is
  port(
       FI : in std_logic;
       FIL : in std_logic;
       I : in std_logic;
       S : out std_logic
  );
end Fuse;

architecture Fuse of Fuse is

---- Signal declarations used on the diagram ----

signal IL : std_logic;
signal IL_F : std_logic;
signal I_F : std_logic;

begin

----  Component instantiations  ----

IL <= not(I);

IL_F <= not(FIL) or IL;

S <= I_F and IL_F;

I_F <= not(FI) or I;


end Fuse;
