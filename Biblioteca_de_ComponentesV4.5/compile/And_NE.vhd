-------------------------------------------------------------------------------
--
-- Title       : No Title
-- Design      : Biblioteca_de_Componentes
-- Author      : Wilson Ruggiero
-- Company     : LARC-EPUSP
--
-------------------------------------------------------------------------------
--
-- File        : C:\My_Designs\Biblioteca_de_ComponentesV4.5\compile\And_NE.vhd
-- Generated   : Thu Feb  1 16:01:25 2018
-- From        : C:\My_Designs\Biblioteca_de_ComponentesV4.5\src\And_NE.bde
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


entity And_NE is
  generic(
       NE : integer := 4
  );
  port(
       Sp : in std_logic_vector(NE - 1 downto 0);
       P : out std_logic
  );
end And_NE;

architecture And_NE of And_NE is

begin

---- Processes ----

And_NE :
process (Sp)
-- Section above this comment may be overwritten according to
-- "Update sensitivity list automatically" option status
-- declarations
variable temp: std_logic := '1';
begin
-- statements
temp := '1';
For i in 0 to NE - 1 loop
	temp := temp and Sp(i);
end loop;
P <= temp;
end process;

end And_NE;
