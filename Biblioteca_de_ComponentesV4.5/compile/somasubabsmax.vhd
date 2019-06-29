-------------------------------------------------------------------------------
--
-- Title       : No Title
-- Design      : Biblioteca_de_Componentes
-- Author      : Wilson Ruggiero
-- Company     : LARC-EPUSP
--
-------------------------------------------------------------------------------
--
-- File        : c:\Aldec\Active-HDL-Student-Edition\vlib\Biblioteca_de_ComponentesV4.5\compile\somasubabsmax.vhd
-- Generated   : Sun Mar 25 16:38:32 2018
-- From        : c:\Aldec\Active-HDL-Student-Edition\vlib\Biblioteca_de_ComponentesV4.5\src\somasubabsmax.bde
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

entity somasubabsmax is
  generic(
       NumeroBits : integer := 8;
       Tsom : time := 2 ns;
       Tabs : time := 4 ns;
       Tsub : time := 2 ns;
       Tmm : time := 4 ns
  );
  port(
       C : in STD_LOGIC_VECTOR(1 downto 0);
       a : in std_logic_vector(NumeroBits - 1 downto 0);
       b : in std_logic_vector(NumeroBits - 1 downto 0);
       f : out std_logic_vector(NumeroBits - 1 downto 0)
  );
end somasubabsmax;

architecture somasubabsmax of somasubabsmax is

---- Architecture declarations -----
signal  max,  absb : std_logic_vector(NumeroBits - 1 downto 0);


begin

---- User Signal Assignments ----
max <= a 		when (a >= b) else -- Calcula valor Máximo
				 b;

absb <= b		when (b(NumeroBits - 1) = '0') else -- Calcula valor absoluto
					(not b + 1);

unidade_funcional:
with C select

	f <=	(a + b)	after Tsom 	when "00", -- Executa SOMA
				max		 after Tmm 	when "01" , -- Executa Máximo
				(a - b)	 after Tsub 	when "10", -- Executa Subtração
				absb		after Tabs	 when "11", -- Executa Valor absoluto b
				(others => '0') 			  when others;



end somasubabsmax;
