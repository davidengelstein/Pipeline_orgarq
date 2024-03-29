-------------------------------------------------------------------------------
--
-- Title       : Registrador com processo - Projeto Raiz Quadrada
-- Design      : Biblioteca_de_Componentes
-- Author      : Wilson Ruggiero
-- Company     : LARC-EPUSP
--
-------------------------------------------------------------------------------
--
-- File        : C:\My_Designs\Biblioteca_de_ComponentesV4.5\compile\registrador.vhd
-- Generated   : Thu Feb  1 16:01:24 2018
-- From        : C:\My_Designs\Biblioteca_de_ComponentesV4.5\src\registrador.bde
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


entity registrador is
  generic(
       NumeroBits : INTEGER := 8;
       Tprop : time := 5 ns;
       Tsetup : time := 2 ns
  );
  port(
       C : in std_logic;
       R : in std_logic;
       S : in std_logic;
       D : in std_logic_vector(NumeroBits - 1 downto 0);
       Q : out std_logic_vector(NumeroBits - 1 downto 0)
  );
end registrador;

architecture registrador of registrador is

---- Signal declarations used on the diagram ----

signal qi : std_logic_vector(NumeroBits - 1 downto 0);

begin

---- Processes ----

Registrador :
process (C, S, R)
-- Section above this comment may be overwritten according to
-- "Update sensitivity list automatically" option status
begin
	if R='1' then	-- 	Reset assíncrono
		qi(NumeroBits -1 downto 0) <= (others => '0');-- Inicialização com zero
	elsif S = '1' then -- Set assíncrono
		qi(NUmeroBits - 1 downto 0) <= (others => '1'); -- Inicialização com um
	elsif (C'event and C='1') then  -- Clock na borda de subida
		if D'last_event < Tsetup then 
			report "Violação de Set-up time no registrador, valor da saída indefinido = U.";
			qi <= (others => 'U');
		else
			 qi <= D;
		end if;
	end if;
end process;

---- User Signal Assignments ----
Q <= qi after Tprop;

end registrador;
