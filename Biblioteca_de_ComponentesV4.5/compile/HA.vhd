-------------------------------------------------------------------------------
--
-- Title       : No Title
-- Design      : Biblioteca_de_Componentes
-- Author      : Wilson Ruggiero
-- Company     : LARC-EPUSP
--
-------------------------------------------------------------------------------
--
-- File        : C:\My_Designs\Biblioteca_de_ComponentesV4.5\compile\HA.vhd
-- Generated   : Thu Feb  1 16:01:25 2018
-- From        : C:\My_Designs\Biblioteca_de_ComponentesV4.5\src\HA.bde
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


entity HA is
  generic(
       Tgate: time := 1 ns
  );
  port(
       x : in std_logic;
       y : in std_logic;
       g : out std_logic;
       p : out std_logic
  );
end HA;

architecture HA of HA is

begin

---- User Signal Assignments ----
p <= x xor y after 2*Tgate;
g <= x and y after Tgate;

end HA;
