-------------------------------------------------------------------------------
--
-- Title       : Unidade Funcional - Projeto Raiz Quadrada
-- Design      : Biblioteca_de_Componentes
-- Author      : Wilson Ruggiero
-- Company     : LARC-EPUSP
--
-------------------------------------------------------------------------------
--
-- File        : C:\My_Designs\Biblioteca_de_ComponentesV4.5\compile\absminmaxsomsub.vhd
-- Generated   : Thu Feb  1 16:01:24 2018
-- From        : C:\My_Designs\Biblioteca_de_ComponentesV4.5\src\absminmaxsomsub.bde
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

entity absminmaxsomsub is
  generic(
       NumeroBits : integer := 8;
       Tsom : time := 5 ns;
       Tabs : time := 2 ns;
       Tsub : time := 5 ns;
       Tmm : time := 3 ns
  );
  port(
       C : in std_logic_vector(2 downto 0);
       a : in std_logic_vector(NumeroBits - 1 downto 0);
       b : in std_logic_vector(NumeroBits - 1 downto 0);
       f : out std_logic_vector(NumeroBits - 1 downto 0)
  );
end absminmaxsomsub;

architecture absminmaxsomsub of absminmaxsomsub is

---- Architecture declarations -----
signal min, max, absa, absb : std_logic_vector(NumeroBits - 1 downto 0);


begin

---- User Signal Assignments ----
min <= a 		when (a <= b) else -- Calcula valor m�nimo
				b;
max <= a 		when (a >= b) else -- Calcula valor M�ximo
				 b;
absa <= a 		when (a(NumeroBits - 1) = '0') else -- Calcula valor absoluto
					(not a + 1);
absb <= b		when (b(NumeroBits - 1) = '0') else -- Calcula valor absoluto
					(not b + 1);
unidade_funcional:
with C select
	f <=	(a + b)	after Tsom 	when "001", -- Executa SOMA
				absb		after Tabs	 when "010", -- Executa Valor absoluto b
				(b - a)	 after Tsub	 when "011", -- Executa subtra��o
   			absa		after Tabs 	when "100",  -- Executa Valor absoluto a
				(a - b)	 after Tsub 	when "101", -- Executa Subtra��o
				min		  after Tmm 	when "110", -- Executa M�nimo
				max		 after Tmm 	when "111" , -- Executa M�ximo
				(others => '0') 			  when others;



end absminmaxsomsub;
