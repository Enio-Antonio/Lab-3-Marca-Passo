entity registrador is 
	port(clk, e1, e2 : in bit; p1, p2 : out bit);
end registrador;

architecture behav of registrador is
begin
	process(clk)
	begin 
		if (clk ' EVENT and clk = '1') then
			p1 <= e1;
			p2 <= e2;
		end if;
	end process;
end architecture behav;