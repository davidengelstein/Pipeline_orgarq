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
begin
 
  outA <= outDataA;
  outB <= outDataB;
	
  process (clk)
  begin
    if rising_edge(clk) then
	  -- Read A and B before bypass
      outDataA <= registers(to_integer(unsigned(regASel)));
      outDataB <= registers(to_integer(unsigned(regBSel)));
      -- Write and bypass
      if writeEnable = '1' then
        registers(to_integer(unsigned(writeRegSel))) <= input;  -- Write
        if regASel = writeRegSel then  -- Bypass for read A
          outDataA <= input;
        end if;
        if regBSel = writeRegSel then  -- Bypass for read B
          outDataB <= input;
        end if;
      end if;
    end if;
  end process;
end banco_regs;
