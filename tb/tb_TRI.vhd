library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity tb_TRI is
end entity;

architecture sim of tb_TRI is
  signal clk : std_logic := '0';
  signal KI, DI, GI, BI : std_logic_vector(2 downto 0);
begin
  
  clk <= not clk after 41.666 ns;

  uut: entity work.TRI
    port map (
      Clk => clk,
      KI  => KI,
      DI  => DI,
      GI  => GI,
      BI  => BI
    );
	
  process
  begin
    wait for 70 ms; 
    assert false report "SIM DONE" severity failure;
  end process;
end architecture;
