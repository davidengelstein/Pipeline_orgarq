-------------------------------------------------------------------------------
--
-- Title       : No Title
-- Design      : Pipeline_MIPS
-- Author      : Igor Ortega
-- Company     : POLI USP
--
-------------------------------------------------------------------------------
--
-- File        : C:\Users\Igor Ortega\Documents\GitHub\Pipeline_orgarq\Pipeline_MIPS\Pipeline_MIPS\compile\top_level.vhd
-- Generated   : Tue Jul  2 01:53:19 2019
-- From        : C:\Users\Igor Ortega\Documents\GitHub\Pipeline_orgarq\Pipeline_MIPS\Pipeline_MIPS\src\top_level.bde
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

entity top_level is
  port(
       CLK : in STD_LOGIC
  );
end top_level;

architecture top_level of top_level is

---- Component declarations -----

component Esquema_Geral
  port (
       Clock : in STD_LOGIC
  );
end component;

begin

----  Component instantiations  ----

U1 : Esquema_Geral
  port map(
       Clock => CLK
  );


end top_level;
