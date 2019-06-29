-------------------------------------------------------------------------------
--
-- Title       : No Title
-- Design      : Biblioteca_de_Componentes
-- Author      : Wilson Ruggiero
-- Company     : LARC-EPUSP
--
-------------------------------------------------------------------------------
--
-- File        : C:\Aldec\Active-HDL-Student-Edition\vlib\Biblioteca_de_ComponentesV4.5\compile\ROM.vhd
-- Generated   : Tue Mar  6 12:02:56 2018
-- From        : C:\Aldec\Active-HDL-Student-Edition\vlib\Biblioteca_de_ComponentesV4.5\src\ROM.bde
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
--use IEEE.numeric_std.all;
use IEEE.std_logic_unsigned.all;
use ieee.math_real.all;
use std.textio.all;
use ieee.std_logic_arith.all;


entity ROM is
  generic(
       BE : integer := 8;
       BP : integer := 16;
       Tacesso : time := 5 ns;
       NA : string := "mrom.txt"
  );
  port(
       ender : in std_logic_vector(BE - 1 downto 0);
       dado : out std_logic_vector(BP - 1 downto 0)
  );
end ROM;

architecture ROM of ROM is

---- Architecture declarations -----
type tipo_memoria  is array (0 to 2**BE - 1) of std_logic_vector(BP - 1 downto 0);
signal mrom: tipo_memoria := (others => (others => '0'));
signal endereco: integer := 0;


begin

---- Processes ----

Carga_inicial :process -- Roda somente uma vez na inicializa��o
function fill_memory return tipo_memoria is
	type HexTable is array (character range <>) of integer;
	-- Caracteres HEX v�lidos: 0, 1, 2 , 3, 4, 5, 6, 6, 7, 8, 9, A, B, C, D, E, F  (somente caracteres mai�sculos)
	constant lookup: HexTable ('0' to 'F') :=
		(0, 1, 2, 3, 4, 5, 6, 7, 8, 9, -1, -1, -1, -1, -1, -1, -1, 10, 11, 12, 13, 14, 15);
	file infile: text open read_mode is NA; -- Abre o arquivo para leitura
	variable buff: line; 
	variable addr_s: string ((integer(ceil(real(BE)/4.0)) + 1) downto 1); -- Digitos de endere�o mais um espa�o
	variable data_s: string ((integer(ceil(real(BP)/4.0)) + 1) downto 1); -- �ltimo byte sempre tem um espa�o separador
	variable addr_1, pal_cnt: integer;
	variable data: std_logic_vector((BP - 1) downto 0);
	variable up: integer;
	variable upreal: real;
	variable Mem: tipo_memoria := ( others  => (others => '0')) ;
	begin
		while (not endfile(infile)) loop
			readline(infile,buff); -- L� um linha do infile e coloca no buff
			read(buff, addr_s); -- Leia o conteudo de buff at� encontrar um espa�o e atribui � addr_s, ou seja, leio o endere�o
			read(buff, pal_cnT); -- Leia o n�mero de bytes da pr�xima linha
			addr_1 := 0;
			upreal := real(BE)/4.0;
			up := integer((ceil(upreal)));
			--report "Valor teto = " & real'image(upreal) & " Endereco = " & integer'image(up);
			for i in (up + 1) downto 2 loop
				--report "Indice i = " & integer'image(i);
				addr_1 := addr_1 + lookup(addr_s(i))*16**(i - 2);
			end loop;
			readline(infile, buff);
			for i in 1 to pal_cnt loop
				read(buff, data_s); -- Leia dois d�gitos Hex e o espa�o separador
				data := (others => '0');
				upreal := real(BP)/4.0;
				up := integer((ceil(upreal)));
				--report "Indice de conteudo = " & real'image(upreal) & " Indice de conteudo inteiro = " & integer'image(up);
				for i in (up + 1) downto 2 loop
					data((4*(i-2))+3 downto 4*(i-2)) := conv_std_logic_vector(lookup(data_s(i)),4);
				end loop;
				Mem(addr_1) := data; -- Converte o conte�do da palavra para std_logic_vector
				addr_1 := addr_1 + 1;	-- Endere�a a pr�xima palavra a ser carregada
			end loop;
		end loop;
	return Mem;
end fill_memory;
begin
	mrom <= fill_memory;
	-- Insere o conte�do na mem�ria
	wait;
end process;











---- User Signal Assignments ----
dado <= mrom(conv_integer(ender)) after Tacesso;

end ROM;
