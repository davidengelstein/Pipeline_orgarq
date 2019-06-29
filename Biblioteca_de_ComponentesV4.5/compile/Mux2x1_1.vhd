-------------------------------------------------------------------------------
--
-- Title       : No Title
-- Design      : componentes
-- Author      : Wilson Ruggiero
-- Company     : Larc-Epusp
--
-------------------------------------------------------------------------------
--
-- File        : C:\My_Designs\Componentes\componentes\compile\Mux2x1_1.vhd
-- Generated   : Thu Nov 19 16:45:46 2015
-- From        : C:/My_Designs/Componentes/componentes/src/Mux2x1_1.bde
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

entity Mux2x1 is
  generic(
       Tsel : time := 2 ns
  );
  port(
       I0 : in std_logic;
       I1 : in std_logic;
       S : in STD_LOGIC;
       O : out std_logic
  );
end Mux2x1;

architecture Mux2x1 of Mux2x1 is

begin

---- Processes ----

Multiplexador2x1_1 :
process (I0, I1, S)
-- Section above this comment may be overwritten according to
-- "Update sensitivity list automatically" option status
-- declarations
begin
-- statements
case S is
		when '0' 	=> O <= I0 				after Tsel;
		when '1' 	=> O <= I1 				after Tsel;
		when others => O <= 'X'             after Tsel;
	end case;
end process Multiplexador2x1_1;

end Mux2x1;
