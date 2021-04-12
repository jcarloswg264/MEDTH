library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity ctrl_tec is 
generic(
    TICS_2s : natural := 400 -- 2 s son 400 tics de 5 ms
);
port(
  clk: in std_logic;
  nRst: in std_logic;
  tic: in std_logic;
  fila: out std_logic_vector(3 downto 0);
  columna: in  std_logic_vector(3 downto 0);
  tecla_pulsada : out std_logic;
  tecla         : out std_logic_vector(3 downto 0);
  pulso_largo   : out std_logic 
  );
end entity;

architecture rtl of ctrl_tec is
  signal comienzo_pulsacion  : std_logic;
  signal final_pulsacion  : std_logic;
  signal tecla_no_puls : std_logic;
  signal pulso_largo_reg: std_logic;
  signal tecla_aux  : std_logic_vector(3 downto 0);
  signal contador_fila  : std_logic_vector(1 downto 0);
  signal columna_aux  : std_logic_vector(3 downto 0);
  signal columna_aux2  : std_logic_vector(3 downto 0);
  signal cnt_largo : std_logic_vector(8 downto 0);
  signal enable  : std_logic;----------deteccion de pulsacion de tecla
  signal fin_tic_2s: natural:= 400; -- 2 s son 400 tics de 5 ms
begin
  
----------------------------- FILTRO DE SINCRONIA DE RELOJ -------------------  
process (clk,nRst)
 begin 
	if nRst='0' then 
	  columna_aux <= "0000";
  elsif clk'event and clk ='1' then 
    columna_aux <= columna;
  end if;
end process;


process (clk,nRst)
 begin 
	if nRst='0' then 
	  columna_aux2 <= "0000";
  elsif clk'event and clk ='1' then 
    if tic = '1' then  ---MUESTREA LA SEÑAL
       columna_aux2 <= columna_aux;
    end if;
  end if;
end process;
-------------------------------------------------------------------------------

enable <= columna_aux2(0)AND columna_aux2(1)AND columna_aux2(2)AND columna_aux2(3);

process (clk,nRst)
	begin 
	if nRst='0' then 
	 tecla<="0000";
	 contador_fila <="00";
	 comienzo_pulsacion <='0';
	 final_pulsacion <='0';
	elsif clk'event and clk ='1' then 
	 if enable ='1' then
	  case contador_fila is
		 when "00" => 
		   fila(0)<='0';
		   if columna_aux2= "0111" or columna_aux2="1011" or columna_aux2="1101" or columna_aux2="1110" then 
		     fila (0)<='0';
		     case columna_aux2 is 
		       when "1110" => tecla_aux <= "0001";
		       when "1101" => tecla_aux <= "0010";
		       when "1011" => tecla_aux <= "0011";
		       when "0111" => tecla_aux <= "1111";
		       when others => tecla_aux <= "0000";
		     end case; 
		     contador_fila <="00";
		     comienzo_pulsacion <='1';
		   else
		     fila (0)<='1';
		     if comienzo_pulsacion = '1' then 
		       comienzo_pulsacion <= '0'; 
		       if columna_aux2 = "1111" then 
		         final_pulsacion <= '1'; 
		       end if;
		     end if; 
		     if final_pulsacion = '1' then 
		       final_pulsacion <= '0';
		     end if;
		     contador_fila <= contador_fila+1;	   
		    end if;  
		 when "01" =>
		    fila(1)<='0';
		   if columna_aux2= "0111" or columna_aux2="1011" or columna_aux2="1101" or columna_aux2="1110" then 
		     fila (1)<='0';
		     case columna_aux2 is 
		       when "1110" => tecla_aux <= "0100";
		       when "1101" => tecla_aux <= "0101";
		       when "1011" => tecla_aux <= "0110";
		       when "0111" => tecla_aux <= "1110";
		       when others => tecla_aux <= "0000";
		     end case;  
		     contador_fila <="01";
		     comienzo_pulsacion <='1';	     
		   else
		     fila (1)<='1';
		     if comienzo_pulsacion = '1' then 
		       comienzo_pulsacion <= '0'; 
		       if columna_aux2 = "1111" then 
		         final_pulsacion <= '1'; 
		       end if;
		     end if; 
		     if final_pulsacion = '1' then 
		       final_pulsacion <= '0';
		     end if;
		     contador_fila <= contador_fila+1;	
		   end if;

	  	when "10" => 
		   fila(2)<='0';
		   if columna_aux2= "0111" or columna_aux2="1011" or columna_aux2="1101" or columna_aux2="1110" then 
		     fila (2)<='0';
		     case columna_aux2 is 
		       when "1110" => tecla_aux <= "0111";
		       when "1101" => tecla_aux <= "1000";
		       when "1011" => tecla_aux <= "1001";
		       when "0111" => tecla_aux <= "1101";
		       when others => tecla_aux <= "0000";
		     end case;  
		     contador_fila <="10";
		     comienzo_pulsacion <='1';
		   else
		     fila (2)<='1';
		     if comienzo_pulsacion = '1' then 
		       comienzo_pulsacion <= '0';
		       if columna_aux2 = "1111" then 
		         final_pulsacion <= '1'; 
		       end if; 
		     end if; 
		     if final_pulsacion = '1' then 
		       final_pulsacion <= '0';
		     end if;
		     contador_fila <= contador_fila+1;	
		   end if;
		 when "11" =>
		   fila(3)<='0';
		   if columna_aux2= "0111" or columna_aux2="1011" or columna_aux2="1101" or columna_aux2="1110" then 
		     fila (3)<='0';
		     case columna_aux2 is 
		       when "1110" => tecla_aux <= "1010";
		       when "1101" => tecla_aux <= "0000";
		       when "1011" => tecla_aux <= "1011";
		       when "0111" => tecla_aux <= "1100";
		       when others => tecla_aux <= "0000";
		     end case;  
		     contador_fila <="11";
		     comienzo_pulsacion <='1';
		   else
		     fila(3)<='1';
		     if comienzo_pulsacion = '1' then 
		       comienzo_pulsacion <= '0'; 
		       if columna_aux2 = "1111" then 
		         final_pulsacion <= '1'; 
		       end if; 
		     end if; 
		     if final_pulsacion = '1' then 
		       final_pulsacion <= '0';
		     end if;
		     contador_fila <="00";
		   end if;
		 when others => 
		 tecla_aux <= "0000";
		 contador_fila <="00";
		 comienzo_pulsacion <='0';
		 final_pulsacion <= '0';
	  end case; 
	 end if; 
	end if;
 end process;

tecla_no_puls <= '1' when columna_aux2 = "1111" else '0';
pulso_largo<=pulso_largo_reg;

process(clk, nRst)
  begin
    if nRst = '0' then
      tecla <= (others =>'0');
    elsif clk'event and clk = '1' then
      if tecla_no_puls = '1' then
        tecla <= tecla_aux;
      end if;
    end if;
  end process;
process(clk, nRst)
  begin
    if nRst = '0' then
      cnt_largo <= (others =>'0');
    elsif clk'event and clk = '1' then
      if comienzo_pulsacion = '1' then
        cnt_largo <= (0 => '1', others =>'0');
      elsif final_pulsacion = '1' then
        cnt_largo <= (others =>'0');
      elsif tic = '1' then
         if pulso_largo_reg = '0' and cnt_largo /= 0 then
           cnt_largo <= cnt_largo + 1;
         else
           cnt_largo <= (others =>'0');
         end if;
     end if;
   end if;
end process;
process(clk, nRst)
  begin
    if nRst = '0' then
      pulso_largo_reg <= '0';
    elsif clk'event and clk = '1' then
      if cnt_largo = fin_tic_2s and tic = '1' and final_pulsacion = '0' then
        pulso_largo_reg <= '1';
      elsif final_pulsacion = '1' then
        pulso_largo_reg <= '0';
      end if;
    end if;
  end process;
tecla_pulsada <= '1' when final_pulsacion = '1' and pulso_largo_reg = '0' else '0';

end rtl;
