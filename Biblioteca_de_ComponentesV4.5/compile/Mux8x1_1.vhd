-------------------------------------------------------------------------------
--
-- Title       : No Title
-- Design      : componentes
-- Author      : Wilson Ruggiero
-- Company     : Larc-Epusp
--
-------------------------------------------------------------------------------
--
-- File        : C:\My_Designs\Componentes\componentes\compile\Mux8x1_1.vhd
-- Generated   : Thu Feb  1 16:31:27 2018
-- From        : C:\My_Designs\Componentes\componentes\src\Mux8x1_1.bde
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

entity Mux8x1_1 is
  generic(
       Tsel : time := 2 ns
  );
  port(
       I0 : in std_logic;
       I1 : in std_logic;
       I2 : in std_logic;
       I3 : in std_logic;
       I4 : in std_logic;
       I5 : in std_logic;
       I6 : in std_logic;
       I7 : in std_logic;
       S : in STD_LOGIC_VECTOR(2 downto 0);
       O : out std_logic
  );
end Mux8x1_1;

architecture Mux8x1_1 of Mux8x1_1 is

begin

---- Processes ----

Multiplexador8x1 :
process (S, I7, I6, I5, I4, I3, I2, I1, I0)
-- Section above this comment may be overwritten according to
-- "Update sensitivity list automatically" option status
-- declarations
begin
-- statements
case S is
		when "000" 	=> O <= I0 				after Tsel;
		when "001" 	=> O <= I1 				after Tsel;
		when "010"	=> O <= I2				after Tsel;
		when "011"	=> O <= I3				after Tsel;
		when "100"	=> O <= I4				after Tsel;
		when "101"	=> O <= I5				after Tsel;
		when "110"	=> O <= I6				after Tsel;
		when "111"	=> O <= I7				after Tsel;
		when others => O <= 'X'             after Tsel;
	end case;
end process Multiplexador8x1;


end Mux8x1_1;
