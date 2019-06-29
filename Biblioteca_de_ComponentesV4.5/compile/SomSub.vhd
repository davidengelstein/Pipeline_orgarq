-------------------------------------------------------------------------------
--
-- Title       : No Title
-- Design      : Biblioteca_de_Componentes
-- Author      : Wilson Ruggiero
-- Company     : LARC-EPUSP
--
-------------------------------------------------------------------------------
--
-- File        : c:\Aldec\Active-HDL-Student-Edition\vlib\Biblioteca_de_ComponentesV4.5\compile\SomSub.vhd
-- Generated   : Wed Feb 28 10:14:16 2018
-- From        : c:\Aldec\Active-HDL-Student-Edition\vlib\Biblioteca_de_ComponentesV4.5\src\SomSub.bde
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


entity SomSub is
  generic(
       NB : integer := 8;
       Tsom : time := 5 ns;
       Tsub : time := 5 ns;
       Ttrans : time := 5 ns
  );
  port(
       Veum : in std_logic;
       A : in std_logic_vector(NB - 1 downto 0);
       B : in std_logic_vector(NB - 1 downto 0);
       cUla : in std_logic_vector(1 downto 0);
       Sinal : out std_logic;
       Vaum : out std_logic;
       Zero : out std_logic;
       C : out std_logic_vector(NB - 1 downto 0)
  );
end SomSub;

architecture SomSub of SomSub is

---- Architecture declarations -----
signal S_NB : std_logic_vector (NB downto 0);
signal Zer : std_logic_vector (NB downto 0) := (others => '0');


begin

---- User Signal Assignments ----
With cUla select
		S_NB <= '0' & (A + Veum)				when "00",
							 '0' & (A + B + Veum)	when "01",
							 '0' & (B + Veum)			  when "10",
							 '0' & (A - B + Veum)	  when "11",
							(others => '0')					when others;
-- Sa�da de Vai um
Vaum <= S_NB(NB) after Tsom;
-- Resultado da Opera��o
C <= S_NB(NB - 1 downto 0) after Ttrans  when cUla = "00" else
			S_NB(NB - 1 downto 0) after Tsom  when cUla = "01" else
			S_NB(NB - 1 downto 0) after Ttrans  when cUla = "10" else
			S_NB(NB - 1 downto 0) after Tsub  when cUla = "11" else;
-- Atualiza��o do sinal
Sinal <= S_NB(NB - 1) after Tsom;
-- Atualiza��o de Zero
Zero <= '1'  after Tsom when S_NB = Zer else
					'0' after Tsom ;


end SomSub;
