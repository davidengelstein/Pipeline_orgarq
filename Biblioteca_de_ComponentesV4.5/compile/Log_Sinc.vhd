-------------------------------------------------------------------------------
--
-- Title       : No Title
-- Design      : Biblioteca_de_Componentes
-- Author      : Wilson Ruggiero
-- Company     : LARC-EPUSP
--
-------------------------------------------------------------------------------
--
-- File        : C:\My_Designs\Biblioteca_de_ComponentesV4.5\compile\Log_Sinc.vhd
-- Generated   : Thu Feb  1 16:01:22 2018
-- From        : C:\My_Designs\Biblioteca_de_ComponentesV4.5\src\Log_Sinc.bde
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


entity Log_Sinc is
  generic(
       NSb : integer := 8;
       Tprop : time := 1 ns
  );
  port(
       clk : in std_logic;
       PCborda : in std_logic_vector(NSb - 1 downto 0);
       Sborda : out std_logic_vector(NSb - 1 downto 0)
  );
end Log_Sinc;

architecture Log_Sinc of Log_Sinc is

begin

---- User Signal Assignments ----
Sborda <= PCborda after Tprop when clk = '1' else
						(others => '0');

end Log_Sinc;
