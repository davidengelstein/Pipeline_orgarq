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

	Controle <= "1100000010" when OpCode = "000000" else    --tipo R
				"0001001011" when OpCode = "100011" else    --load (lw)
				"X00100010X" when OpCode = "101011"	else	--store (sw)
				"X01010000X" when OpCode = "000100" else    -- beq
				"X01001000X" when OpCode = "000010" else	-- jump	 
				"0000000000";

end Controle;
