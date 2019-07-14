-------------------------------------------------------------------------------
--
-- Title       : Fub1
-- Design      : Pipeline_MIPS
-- Author      : Davidengelstein
-- Company     : Davidengelstein
--
-------------------------------------------------------------------------------
--
-- File        : c:\Users\david\OneDrive\Documentos\GitHub\Pipeline_orgarq\Pipeline_MIPS\Pipeline_MIPS\src\Controle.vhd
-- Generated   : Mon Jul  1 22:48:38 2019
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
--{entity {Fub1} architecture {Controle}}

library IEEE;
use IEEE.std_logic_1164.all;

entity Controle is
	 port(
		 OpCode : in STD_LOGIC_VECTOR(5 downto 0);
		 Controle : out STD_LOGIC_VECTOR(9 downto 0)
	     );
end Controle;

--}} End of automatically maintained section

architecture Controle of Controle is
begin

	Controle <= "0100000011" when OpCode = "000000" else    --tipo R
				"1101001000" when OpCode = "100011" else    --load (lw)
				"0010001000" when OpCode = "101011"	else	--store (sw)
				"0000010100" when OpCode = "000100" else    -- beq
				"0000100100" when OpCode = "000010" else	-- jump	 
				"0000000000";

end Controle;
