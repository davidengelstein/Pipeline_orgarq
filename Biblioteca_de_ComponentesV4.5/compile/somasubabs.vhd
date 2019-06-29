-------------------------------------------------------------------------------
--
-- Title       : No Title
-- Design      : Biblioteca_de_Componentes
-- Author      : Wilson Ruggiero
-- Company     : LARC-EPUSP
--
-------------------------------------------------------------------------------
--
-- File        : c:\Aldec\Active-HDL-Student-Edition\vlib\Biblioteca_de_ComponentesV4.5\compile\somasubabs.vhd
-- Generated   : Sun Mar 25 16:31:44 2018
-- From        : c:\Aldec\Active-HDL-Student-Edition\vlib\Biblioteca_de_ComponentesV4.5\src\somasubabs.bde
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

entity somasubabs is
  generic(
       NumeroBits : integer := 8;
       Tsom : time := 4 ns;
       Tabs : time := 4 ns;
       Tsub : time := 4 ns;
       Tmm : time := 6 ns
  );
  port(
       C : in STD_LOGIC_VECTOR(1 downto 0);
       a : in std_logic_vector(NumeroBits - 1 downto 0);
       b : in std_logic_vector(NumeroBits - 1 downto 0);
       f : out std_logic_vector(NumeroBits - 1 downto 0)
  );
end somasubabs;

architecture somasubabs of somasubabs is

---- Architecture declarations -----
signal  absb : std_logic_vector(NumeroBits - 1 downto 0);


begin

---- User Signal Assignments ----


absb <= b		when (b(NumeroBits - 1) = '0') else -- Calcula valor absoluto
					(not b + 1);

unidade_funcional:
with C select

	f <=	(a + b)	after Tsom 	when "10" , -- Executa SOMA
				(a - b)	 after Tsub 	when "11", -- Executa Subtração
				absb		after Tabs	 when "01", -- Executa Valor absoluto b
				(others => '0') 			  when others;



end somasubabs;
