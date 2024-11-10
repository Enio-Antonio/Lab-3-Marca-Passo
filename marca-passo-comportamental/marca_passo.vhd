library ieee;
use ieee.std_logic_1164.all;

entity marca_passo is 
	port(s, z : in std_logic; temp, pulso : out std_logic; clk, registrador : in std_logic);
end marca_passo;

architecture behavior of marca_passo is
	type statetype is (reset, espera, contracao);
	signal currentstate, nextstate : statetype;
begin
	stateregis: process(clk, registrador)
	begin 
		if (registrador = '1') then
			currentstate <= reset;
		elsif (clk = '1' and clk ' EVENT) then
			currentstate <= nextstate;
		end if;
	end process;
	
	combologic: process(currentstate, s, z)
	begin 
		case currentstate is
			when reset => temp <= '1'; pulso <= '0'; nextstate <= espera;
			when espera => temp <= '0'; pulso <= '0';
				if (s = '1') then 
					nextstate <= reset;
				elsif (s = '0' and z = '0') then
					nextstate <= espera;
				elsif (s = '0' and z = '1') then
					nextstate <= contracao;
				end if;
			when contracao => temp <= '0'; pulso <= '1'; nextstate <= reset;
		end case;
	end process;
end architecture behavior;
