--------------------------------------------------------------------------------------------------
-- Autor: DTE
-- Version:3.0
-- Fecha: 17-02-2021
--------------------------------------------------------------------------------------------------
-- Estimulos para el test del controlador de teclado.
-- El reloj y el reset as�ncrono se aplican directamente en elnivel superior de la jerarquia del
-- test
--------------------------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use work.pack_test_teclado.all;

entity estimulos is port (
  clk           : in std_logic;
  tic           : in std_logic;
  duracion_test : buffer time;
  tecla_test    : buffer std_logic_vector(3 downto 0);
  tecla_id      : buffer std_logic_vector(3 downto 0);
  pulsar_tecla  : buffer std_logic
);
end entity;

architecture test of estimulos is
  signal tecla_larga std_logic_vector(3 downto 0);
  signal tecla_corta std_logic_vector(3 downto 0);

begin

  stim : process
  begin
    tecla_id     <= (others => '0');
    pulsar_tecla <= '0';
    wait for 30 * T_CLK;
    wait until clk'event and clk = '1';
    -- Para completar por los estudiantes (inicio)
    tecla_larga <= X'0';
    tecla_corta <= X'0';

    for i in 0 to 16 loop
      pulsa_tecla(clk, tecla_corta, pulsacion_corta, tecla_test, duracion_test, pulsar_tecla);
      espera_tick(clk, tick, 20);
      tecla_corta <= tecla_corta + 1;
    end loop;

    for i in 0 to 16 loop
      pulsa_tecla(clk, tecla_larga, pulsacion_larga, tecla_test, duracion_test, pulsar_tecla);
      espera_tick(clk, tick, 20);
      tecla_larga <= tecla_larga + 1;
    end loop;

    -- Para completar por los estudiantes (fin) 
    assert(false) report "******************************Fin del test************************" severity failure;
  end process;

end test;