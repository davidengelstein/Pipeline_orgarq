library IEEE;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;

entity tBank is
	 port(
	 	 endA : in STD_LOGIC_VECTOR(4 downto 0);
	 	 endB : in STD_LOGIC_VECTOR(4 downto 0); 
		 endW : in STD_LOGIC_VECTOR(4 downto 0);
		 dadoIn: in STD_LOGIC_VECTOR(31 downto 0);
		 we: in STD_logic;
		 clk : in STD_logic;
		 dadoOutA: out STD_LOGIC_VECTOR(31 downto 0);
		 dadoOutB: out STD_LOGIC_VECTOR(31 downto 0)
	     );
end tBank;


architecture tBank of tBank is
	type ram_type is array (0 to 31)
        of std_logic_vector (31 downto 0);
	signal ram :ram_type := ((others=> (others=>'0'))); 
begin	   
	dadoOutA <= ram(to_integer(unsigned(endA)));
	dadoOutB <= ram(to_integer(unsigned(endB)));

	process (clk)

	begin  
		 if (clk'event and clk = '0') then
	        if (we = '1') then
	           ram(to_integer(unsigned(endW))) <= dadoIn;
	        end if;
	     end if;
	end process;
	
end tBank;

