-------------------------------------------------------------------------------
--
-- Title       : Registrador
-- Design      : Pipeline_MIPS
-- Author      : Davidengelstein
-- Company     : Davidengelstein
--
-------------------------------------------------------------------------------
--
-- File        : C:\Users\david\OneDrive\Documentos\GitHub\Pipeline_orgarq\Pipeline_MIPS\Pipeline_MIPS\src\Registrador.vhd
-- Generated   : Thu Jul 11 23:11:11 2019
-- From        : interface description file
-- By          : Itf2Vhdl ver. 1.22
--
-------------------------------------------------------------------------------
--
-- Description : 
--
-------------------------------------------------------------------------------

--{{ Section below this comment is automatically maintained
--   and may be overwritten
--{entity {Registrador} architecture {Registrador}}	 
library IEEE;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;



entity Registrador is
	generic(
       NumeroBits : INTEGER := 32;
       Tprop : time := 5 ns;
       Tsetup : time := 2 ns
  );
	port(
		D : in STD_LOGIC_VECTOR(31 downto 0);
		CE : in STD_LOGIC;
		C : in STD_LOGIC;
		R : in STD_LOGIC;
		S : in STD_LOGIC;
		Q : out STD_LOGIC_VECTOR(31 downto 0)
		  );
end Registrador;

--}} End of automatically maintained section

architecture Registrador of Registrador is	
signal qi : std_logic_vector (31 downto 0) := (others => '0');
begin
	process (C, S, R, CE)
	-- Section above this comment may be overwritten according to
	-- "Update sensitivity list automatically" option status
	begin
		if R='1' then	-- 	Reset assíncrono
			qi(NumeroBits - 1 downto 0) <= (others => '0');-- Inicialização com zero	
		elsif S = '1' then -- Set assíncrono
			qi(NumeroBits - 1 downto 0) <= (others => '1'); -- Inicialização com um
		elsif (C'event and C='1') then  -- Clock na borda de subida
			if CE = '1' then
				qi <= D;
			else
				null;
			end if;
		end if;	  
		Q <= qi;
	end process;

end Registrador;
