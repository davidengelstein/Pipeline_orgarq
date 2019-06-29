-------------------------------------------------------------------------------
--
-- Title       : No Title
-- Design      : componentes
-- Author      : Wilson Ruggiero
-- Company     : Larc-Epusp
--
-------------------------------------------------------------------------------
--
-- File        : C:\My_Designs\Componentes\componentes\compile\FFD.vhd
-- Generated   : Thu Feb  1 16:31:27 2018
-- From        : C:\My_Designs\Componentes\componentes\src\FFD.bde
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


entity FFD is
  generic(
       Tprop : time := 5 ns;
       Tsetup : time := 2 ns
  );
  port(
       C : in std_logic;
       D : in STD_LOGIC;
       R : in std_logic;
       S : in std_logic;
       Q : out STD_LOGIC
  );
end FFD;

architecture FFD of FFD is

---- Signal declarations used on the diagram ----

signal qi : std_logic;

begin

---- Processes ----

FlipFlopD :
process (S, R, C, D)
-- Section above this comment may be overwritten according to
-- "Update sensitivity list automatically" option status
begin
	if R='1' then	-- 	Reset assíncrono
		qi <= '0';-- Inicialização com zero
	elsif S = '1' then -- Set assíncrono
		qi <= '1'; -- Inicialização com um
	elsif (C'event and C='1') then  -- Clock na borda de subida
		qi <= D;
	end if;
end process FlipFlopD;

---- User Signal Assignments ----
Q <= qi after Tprop;

end FFD;
