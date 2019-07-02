-------------------------------------------------------------------------------
--
-- Title       : Fub2
-- Design      : Pipeline_MIPS
-- Author      : Davidengelstein
-- Company     : Davidengelstein
--
-------------------------------------------------------------------------------
--
-- File        : C:\Users\david\OneDrive\Documentos\GitHub\Pipeline_orgarq\Pipeline_MIPS\Pipeline_MIPS\src\Fub2.vhd
-- Generated   : Mon Jul  1 18:45:18 2019
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
--{entity {Fub2} architecture {Fub2}}

library IEEE;
use IEEE.std_logic_1164.all;

entity ALU_Control is
	 port(
		 ALUOp : in STD_LOGIC_VECTOR(1 downto 0);
		 Controle_ALU : out STD_LOGIC_VECTOR(2 downto 0);
		 funct : in STD_LOGIC_VECTOR(5 downto 0)
	     );
end ALU_Control;

--}} End of automatically maintained section

architecture ALU_Control of ALU_Control is
begin
	Controle_ALU <= "010" when ALUOp = "00" else
					"110" when ALUOp = "X1" else
					"010" when ALUOp = "1X" and funct = "XX0000" else
					"110" when ALUOp = "1X" and funct = "XX0010" else
					"000" when ALUOp = "1X" and funct = "XX0100" else
					"001" when ALUOp = "1X" and funct = "XX0101" else
					"111" when ALUOp = "1X" and funct = "XX1010";
	 -- enter your statements here --

end ALU_Control;





