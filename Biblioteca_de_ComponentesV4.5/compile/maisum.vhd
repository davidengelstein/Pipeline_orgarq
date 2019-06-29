-------------------------------------------------------------------------------
--
-- Title       : No Title
-- Design      : Biblioteca_de_Componentes
-- Author      : Wilson Ruggiero
-- Company     : LARC-EPUSP
--
-------------------------------------------------------------------------------
--
-- File        : C:\My_Designs\Biblioteca_de_ComponentesV4.5\compile\maisum.vhd
-- Generated   : Thu Feb  1 16:01:22 2018
-- From        : C:\My_Designs\Biblioteca_de_ComponentesV4.5\src\maisum.bde
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

entity maisum is
  generic(
       NB : integer := 8;
       Tprop : time := 2 ns
  );
  port(
       I : in std_logic_vector(NB - 1 downto 0);
       O : out std_logic_vector(NB - 1 downto 0)
  );
end maisum;

architecture maisum of maisum is

begin

---- User Signal Assignments ----
O <= I + 1 after Tprop;

end maisum;
