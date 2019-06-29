-------------------------------------------------------------------------------
--
-- Title       : Unidade Funcional: Maximo - Raiz Quadrada
-- Design      : Biblioteca_de_Componentes
-- Author      : Wilson Ruggiero
-- Company     : LARC-EPUSP
--
-------------------------------------------------------------------------------
--
-- File        : C:\My_Designs\Biblioteca_de_ComponentesV4.5\compile\maximo.vhd
-- Generated   : Thu Feb  1 16:01:17 2018
-- From        : C:\My_Designs\Biblioteca_de_ComponentesV4.5\src\maximo.bde
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

entity maximo is
  generic(
       NumeroBits : integer := 8;
       Tmax : time := 2 ns
  );
  port(
       In1 : in std_logic_vector(NumeroBits - 1 downto 0);
       In2 : in std_logic_vector(NumeroBits - 1 downto 0);
       Out1 : out std_logic_vector(NumeroBits - 1 downto 0)
  );
end maximo;

architecture maximo of maximo is

begin

---- User Signal Assignments ----
Out1 <= In1 after Tmax when (In1 >= In2) else
					In2 after Tmax;

end maximo;
