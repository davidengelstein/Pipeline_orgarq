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

entity cache_D is
	 port(
	 	 addr : in STD_LOGIC_VECTOR(31 downto 0);
	 	 data_IN : in STD_LOGIC_VECTOR(31 downto 0);
		 MemWrite: in STD_logic;
		 MemRead: in STD_logic;
		 data_OUT : out STD_LOGIC_VECTOR(31 downto 0)
	     );
end cache_D;

--}} End of automatically maintained section

architecture cache_D of cache_D is
	signal dados: std_logic_vector(31 downto 0);
	signal seletor : std_logic_vector(7 downto 0);
begin	 
	 -- enter your statements here --
	 data_OUT <= dados;
	 seletor <= addr(7 downto 0);

	 process(seletor)
	 begin		 
		 case seletor is
			 when "00000000" =>	
			 	dados <= "00000000000000000000000000000010";
			 when "00000100" =>	 
			 	dados <= "00000000000000000000000000000100";
		     when others =>
			 	dados <= "00000000000000000000000000000000";
		 end case;
	end process;
end cache_D;

