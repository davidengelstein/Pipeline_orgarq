-------------------------------------------------------------------------------
--
-- Title       : No Title
-- Design      : Biblioteca_de_Componentes
-- Author      : Wilson Ruggiero
-- Company     : LARC-EPUSP
--
-------------------------------------------------------------------------------
--
-- File        : C:\My_Designs\Biblioteca_de_ComponentesV4.5\compile\Decodificador.vhd
-- Generated   : Thu Feb  1 16:01:24 2018
-- From        : C:\My_Designs\Biblioteca_de_ComponentesV4.5\src\Decodificador.bde
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

entity Decodificador is
  port(
       In0 : in std_logic_vector(2 downto 0);
       Sai : out std_logic_vector(7 downto 0)
  );
end Decodificador;

architecture Decodificador of Decodificador is

begin

---- User Signal Assignments ----
With In0 select
		sai <=	"00000001" 		when "000" ,
						 "00000010" 		when "001" ,
						 "00000100" 		when "010" ,
						 "00001000" 		when "011" ,
						 "00010000" 		when "100" ,
						 "00100000" 		when "101" ,
						 "01000000" 		when "110" ,
						 "10000000" 		when "111" ,
						 "XXXXXXXX"    when others;

end Decodificador;
