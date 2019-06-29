-------------------------------------------------------------------------------
--
-- Title       : No Title
-- Design      : Biblioteca_de_Componentes
-- Author      : Wilson Ruggiero
-- Company     : LARC-EPUSP
--
-------------------------------------------------------------------------------
--
-- File        : C:\Aldec\Active-HDL-Student-Edition\vlib\Biblioteca_de_ComponentesV4.5\compile\TesteMem.vhd
-- Generated   : Tue Mar  6 11:49:35 2018
-- From        : C:\Aldec\Active-HDL-Student-Edition\vlib\Biblioteca_de_ComponentesV4.5\src\TesteMem.bde
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


-- active library clause
library Biblioteca_de_Componentes;

entity TesteMem is
  port(
       RW : in STD_LOGIC;
       clock : in STD_LOGIC;
       enable : in STD_LOGIC;
       Ender : in STD_LOGIC_VECTOR(7 downto 0);
       Endereco : in STD_LOGIC_VECTOR(2 downto 0);
       Pronto : out STD_LOGIC;
       DadoRom : out STD_LOGIC_VECTOR(4 downto 0);
       Dado : inout STD_LOGIC_VECTOR(15 downto 0)
  );
end TesteMem;

architecture TesteMem of TesteMem is

---- Component declarations -----

component ram
  generic(
       BP : integer := 16;
       BE : integer := 8;
       Tread : time := 5 ns;
       Twrite : time := 5 ns;
       Tsetup : time := 2 ns;
       NA : string := "mram.txt";
       Tz : time := 2 ns
  );
  port (
       Clock : in STD_LOGIC;
       enable : in STD_LOGIC;
       ender : in STD_LOGIC_VECTOR(BE - 1 downto 0);
       rw : in STD_LOGIC;
       pronto : out STD_LOGIC;
       dado : inout STD_LOGIC_VECTOR(BP - 1 downto 0)
  );
end component;
component rom
  generic(
       BE : integer := 8;
       BP : integer := 16;
       Tacesso : time := 5 ns;
       NA : string := "mrom.txt"
  );
  port (
       ender : in STD_LOGIC_VECTOR(BE - 1 downto 0);
       dado : out STD_LOGIC_VECTOR(BP - 1 downto 0)
  );
end component;

begin

---- User Signal Assignments ----
DadoRom(4 downto 0) <= dado(4 downto 0);

----  Component instantiations  ----

U1 : ram
  generic map(
       BP => 16,
       BE => 8,
       Tread => 0 ns,
       Twrite => 0 ns,
       Tsetup => 0 ns,
       Tz => 0 ns
  )
  port map(
       Clock => clock,
       dado => Dado(15 downto 0),
       enable => enable,
       ender => Ender(7 downto 0),
       pronto => Pronto,
       rw => RW
  );

U2 : rom
  generic map(
       BE => 3,
       BP => 8,
       Tacesso => 0 ns,
       NA => "mrom1.txt"
  )
  port map(
       dado => dado(7 downto 0),
       ender => Endereco(2 downto 0)
  );


end TesteMem;
