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



entity Reg is
	generic(
       NumeroBits : INTEGER := 32;
       Tprop : time := 5 ns;
       Tsetup : time := 2 ns
  );
	port(
		D : in STD_LOGIC_VECTOR(NumeroBits - 1 downto 0);
		CE : in STD_LOGIC;
		C : in STD_LOGIC;
		Q : out STD_LOGIC_VECTOR(NumeroBits - 1 downto 0)
		  );
end Reg;

--}} End of automatically maintained section

architecture Reg of Reg is	
signal qi : std_logic_vector (NumeroBits - 1 downto 0) := (others => '0');
begin
	process (C)
	-- Section above this comment may be overwritten according to
	-- "Update sensitivity list automatically" option status
	begin
		if rising_edge(C) then  -- Clock na borda de subida
			if CE = '1' then
				qi <= D;
			else
				null;
			end if;
		end if;	  
		Q <= qi;
	end process;

end Reg;
