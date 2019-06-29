-------------------------------------------------------------------------------
--
-- Title       : No Title
-- Design      : Biblioteca_de_Componentes
-- Author      : Wilson Ruggiero
-- Company     : LARC-EPUSP
--
-------------------------------------------------------------------------------
--
-- File        : C:\My_Designs\Biblioteca_de_ComponentesV4.5\compile\FA.vhd
-- Generated   : Thu Feb  1 16:01:25 2018
-- From        : C:\My_Designs\Biblioteca_de_ComponentesV4.5\src\FA.bde
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


-- active library clause
library Biblioteca_de_Componentes;

entity FA is
  port(
       ci : in std_logic;
       x : in std_logic;
       y : in std_logic;
       co : out std_logic;
       s : out std_logic
  );
end FA;

architecture FA of FA is

---- Component declarations -----

component ha
  generic(
       Tgate : time := 1 ns
  );
  port (
       x : in STD_LOGIC;
       y : in STD_LOGIC;
       g : out STD_LOGIC;
       p : out STD_LOGIC
  );
end component;

---- Signal declarations used on the diagram ----

signal NET103 : STD_LOGIC;
signal NET83 : STD_LOGIC;
signal NET95 : STD_LOGIC;

begin

----  Component instantiations  ----

U1 : ha
  port map(
       g => NET95,
       p => NET83,
       x => x,
       y => y
  );

U2 : ha
  port map(
       g => NET103,
       p => s,
       x => NET83,
       y => ci
  );

co <= NET95 or NET103;


end FA;
