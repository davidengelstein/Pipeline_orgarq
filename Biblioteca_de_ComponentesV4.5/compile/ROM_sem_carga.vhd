-------------------------------------------------------------------------------
--
-- Title       : No Title
-- Design      : Biblioteca_de_Componentes
-- Author      : Wilson Ruggiero
-- Company     : LARC-EPUSP
--
-------------------------------------------------------------------------------
--
-- File        : c:\Aldec\Active-HDL-Student-Edition\vlib\Biblioteca_de_ComponentesV4.5\compile\ROM_sem_carga.vhd
-- Generated   : Sun Mar 18 19:06:06 2018
-- From        : c:\Aldec\Active-HDL-Student-Edition\vlib\Biblioteca_de_ComponentesV4.5\src\ROM_sem_carga.bde
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
--use IEEE.numeric_std.all;
use IEEE.std_logic_unsigned.all;
use ieee.math_real.all;
use std.textio.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_arith.all;


entity ROM_sem_carga is
  generic(
       BE : integer := 8;
       BP : integer := 16;
       Tacesso : time := 5 ns;
       NA : string := "mrom.txt"
  );
  port(
       ender : in std_logic_vector(BE - 1 downto 0);
       dado : out std_logic_vector(BP - 1 downto 0)
  );
end ROM_sem_carga;

architecture ROM_sem_carga of ROM_sem_carga is

---- Architecture declarations -----
type tipo_memoria  is array (0 to 2**BE - 1) of std_logic_vector(BP - 1 downto 0);
signal mrom: tipo_memoria := (others => (others => '0'));
signal endereco: integer := 0;


begin

---- User Signal Assignments ----
dado <= mrom(conv_integer(ender)) after Tacesso;

end ROM_sem_carga;
