library IEEE;
library Synopsys;
use ieee.std_logic_1164.all;
use synopsys.std_logic_signed.all;
use synopsys.std_logic_arith.all;
use std.textio.all;

entity testfill is
	generic (NP_Mem : integer := 256;
			 NBP_Mem: integer := 16	 );
end testfill;

architecture fillmem of testfill is

type tipo_memoria is array (0 to NP_Mem) of std_logic_vector(NBP_Mem - 1 downto 0);
signal Mem: tipo_memoria := (others => (others => '0'));

procedure fill_memory (signal mem: inout tipo_memoria) is
type HexTable is array (character range <>) of integer;
-- Caracteres HEX v�lidos: o, 1, 2 , 3, 4, 5, 6, 6, 7, 8, 9, A, B, C, D, E, F  (somente caracteres mai�sculos)
constant lookup: HexTable ('0' to 'F') :=
	(0, 1, 2, 3, 4, 5, 6, 7, 8, 9, -1, -1, -1, -1, -1, -1, -1, 10, 11, 12, 13, 14, 15);
file infile: text open read_mode is "mem.txt"; -- Abre o arquivo para leitura
variable buff: line; 
variable addr_s: string (4 downto 1);
variable data_s: string (3 downto 1);
variable addr_1, byte_cnt: integer;
variable data: integer range 256 downto 0;
begin
	while (not endfile(infile)) loop
		readline(infile,buff); -- L� um linha do infile e coloca no buff
		read(buff, addr_s); -- Leia o conteudo de buff at� encontrar um espa�o e atribui � addr_s, ou seja, leio o endere�o
		read(buff, byte_cnT); -- Leia o n�mero de bytes da pr�xima linha
		addr_1 := lookup(addr_s(4)) * 4096 + lookup(addr_s(3)) * 256 + lookup(addr_s(2)) * 16 + lookup(addr_s(1));
		readline(infile, buff);
		for i in 1 to byte_cnt loop
			read(buff, data_s); -- Leia dois d�gitos Hex e o espa�o separador
			data := lookup(data_s(3)) * 16 + lookup(data_s(2)); -- Converte o valor lido em Hex para inteiro
			Mem(addr_1) <= CONV_STD_LOGIC_VECTOR(data, NBP_Mem); -- Converte o conte�do da palavra para std_logic_vector
			addr_1 := addr_1 + 1;	-- Endere�a a p�roxima palavra a ser carregada
		end loop;
	end loop;
end fill_memory;
begin
	testbench: process
	begin
		fill_memory(Mem);
		-- Insere o conte�do na mem�ria
		wait;
	end process;
end fillmem;
