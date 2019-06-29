-------------------------------------------------------------------------------
--
-- Title       : No Title
-- Design      : Biblioteca_de_Componentes
-- Author      : Wilson Ruggiero
-- Company     : LARC-EPUSP
--
-------------------------------------------------------------------------------
--
-- File        : C:\My_Designs\Biblioteca_de_ComponentesV4.5\compile\xzero.vhd
-- Generated   : Thu Feb  1 16:01:18 2018
-- From        : C:\My_Designs\Biblioteca_de_ComponentesV4.5\src\xzero.bde
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


entity xzero is
  generic(
       NBE : integer := 8;
       NBS : integer := 16
  );
  port(
       I : in std_logic_vector(NBE - 1 downto 0);
       O : out std_logic_vector(NBS - 1 downto 0)
  );
end xzero;

architecture xzero of xzero is

begin

---- User Signal Assignments ----
O(NBE - 1 downto 0) <= I(NBE - 1 downto 0);
O(NBS - 1 downto NBE) <= (others => '0');

end xzero;
