library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity banco_regs is
  port(
    outA        : out std_logic_vector(31 downto 0);
    outB        : out std_logic_vector(31 downto 0);
    input       : in  std_logic_vector(31 downto 0);
    writeEnable : in  std_logic;
    regASel     : in  std_logic_vector(4 downto 0);
    regBSel     : in  std_logic_vector(4 downto 0);
    writeRegSel : in  std_logic_vector(4 downto 0);
    clk         : in  std_logic
    );
end banco_regs;


architecture banco_regs of banco_regs is
  type registerFile is array(0 to 31) of std_logic_vector(31 downto 0);
  signal registers : registerFile := ((others=> (others=>'0')));
  signal outDataA: std_logic_vector(31 downto 0) := (others=>'0');
  signal outDataB: std_logic_vector(31 downto 0) := (others=>'0');
  signal inputData: std_logic_vector(31 downto 0) := (others=>'0');
  signal regSel: std_logic_vector(4 downto 0) := (others=>'0');
  signal writeEn: std_logic := '0';
begin
 
  outA <= outDataA after 5ns;
  outB <= outDataB after 5ns;
  inputData <= input after 10ns;
  writeEn <= writeEnable after 10ns;
  regSel <=	writeRegSel after 10ns;
	
  process (clk)
  begin	
	if writeEn = '1' then 
		-- outA
        if regASel = regSel then  -- Bypass for read A
        	outDataA <= inputData;
		else
			outDataA <= registers(to_integer(unsigned(regASel)));
        end if;
		-- outB
        if regBSel = regSel then  -- Bypass for read B
         	outDataB <= inputData;
		else
			outDataB <= registers(to_integer(unsigned(regBSel)));
        end if;	
	-- se writeEnable não for 1, não olha o input
	else 
		outDataA <= registers(to_integer(unsigned(regASel)));
    	outDataB <= registers(to_integer(unsigned(regBSel)));
	end if;
	
    if rising_edge(clk) then
      -- Write
      if writeEnable = '1' then
        registers(to_integer(unsigned(regSel))) <= inputData;  -- Write
      end if;
    end if;	 
	
  end process;
end banco_regs;
