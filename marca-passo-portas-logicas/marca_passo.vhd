entity marca_passo is 
	port(s, z, clk : in bit; temp, pulso : out bit);
end marca_passo;

architecture behav of marca_passo is
	signal e1, e2 : bit;
	signal pe1, pe2 : bit;
	
	component registrador is
		port(clk, e1, e2 : in bit; p1, p2 : out bit);
	end component registrador;
	
	component circuito is
		port(e1, e2, s, z : in bit; temp, pulso, pestado1, pestado2 : out bit);
	end component circuito;
begin
	u1: registrador port map(clk => clk, e1 => pe1, e2 => pe2, p1 => e1, p2 => e2);	
	u2: circuito port map(e1 => e1, e2 => e2, s => s, z => z, temp => temp, pulso => pulso, pestado1 => pe1, pestado2 => pe2);
end architecture behav;