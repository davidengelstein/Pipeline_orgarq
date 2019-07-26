-------------------------------------------------------------------------------
--
-- Title       : Fub1
-- Design      : Pipeline_MIPS
-- Author      : Igor Ortega
-- Company     : POLI USP
--
-------------------------------------------------------------------------------
--
-- File        : C:\Users\Igor Ortega\Documents\GitHub\Pipeline_orgarq\Pipeline_MIPS\Pipeline_MIPS\src\Fub1.vhd
-- Generated   : Mon Jul  1 23:28:27 2019
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
--{entity {Fub1} architecture {Fub1}}




library IEEE;
use IEEE.std_logic_1164.all;

entity Cache_I is
	 port(
		 PC : in STD_LOGIC_VECTOR(31 downto 0);
		 instrucao : out STD_LOGIC_VECTOR(31 downto 0)
	     );
end Cache_I;

--}} End of automatically maintained section

architecture Cache_I of Cache_I is
	signal prox_instrucao: std_logic_vector(31 downto 0);
	signal seletor : std_logic_vector(7 downto 0);
begin	 
	 -- enter your statements here --
	 instrucao <= prox_instrucao;
	 seletor <= PC(7 downto 0);

	 process(seletor)
	 begin		 
		 case seletor is
			 when "00000000" =>	 -- lw   $1,0($0) --
			 	prox_instrucao <= "10001100000000010000000000000000";
			 when "00000100" =>	 -- lw   $2,4($0) --
			 	prox_instrucao <= "10001100000000100000000000000100";
			 when "00001000" =>	-- nop (beq $0,$0,3)
			 	prox_instrucao <= "00010000000000000000000000000011";
			 when "00001100" =>	-- nop (beq $0,$0,3)
			    prox_instrucao <= "00010000000000000000000000000011";
			 when "00010000" =>	-- add   $3,$1,$2 --
			 	prox_instrucao <= "00000000001000100001100000100000";
		     when others =>
			 	prox_instrucao <= "00010000000000000000000000000011";
		 end case;
	end process;
end Cache_I;

