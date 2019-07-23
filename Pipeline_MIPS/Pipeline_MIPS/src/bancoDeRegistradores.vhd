library IEEE;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;

entity bancoDeRegistradores is
	 port(
	 	 endA : in STD_LOGIC_VECTOR(4 downto 0);
	 	 endB : in STD_LOGIC_VECTOR(4 downto 0);
		 dadoInA: in STD_LOGIC_VECTOR(31 downto 0);
		 we: in STD_logic;
		 clk : in STD_logic;
		 dadoOutA: out STD_LOGIC_VECTOR(31 downto 0);
		 dadoOutB: out STD_LOGIC_VECTOR(31 downto 0)
	     );
end bancoDeRegistradores;


architecture bancoDeRegistradores of bancoDeRegistradores is
	type ram_type is array (0 to 31)
        of std_logic_vector (31 downto 0);
	signal ram :ram_type := ((others=> (others=>'0'))); 
	signal enda_reg: std_logic_vector(4 downto 0);
	signal endb_reg: std_logic_vector(4 downto 0);
begin	   
	dadoOutA <= ram(to_integer(unsigned(enda_reg)));
	dadooutb <= ram(to_integer(unsigned(endb_reg)));

	process (clk)

	begin
		 if (clk'event and clk = '0') then
	        if (we = '1') then
	           ram(to_integer(unsigned(endA))) <= dadoInA;
	        end if;
	        enda_reg <= endA;
	        endb_reg <= endB;
	     end if;
	end process;
	
end bancoDeRegistradores;

