entity circuito is 
	port(e1, e2, s, z : in bit; temp, pulso, pestado1, pestado2 : out bit);
end circuito;

architecture behav of circuito is
begin
	temp <= (not(e1) and not(e2) and not(s) and not(z)) or (not(e1) and not(e2) and not(s) and z) 
				or (not(e1) and not(e2) and s and not(z)) or (not(e1) and not(e2) and s and z);
				
	pulso <= (e1 and not(e2) and not(s) and not(z)) or (e1 and not(e2) and not(s) and z)
				or (e1 and not(e2) and s and not(z)) or (e1 and not(e2) and s and z);
				
	pestado1 <= not(e1) and e2 and not(s) and z;
	
	pestado2 <= (not(e1) and not(e2) and not(s) and not(z)) or (not(e1) and not(e2) and not(s) and z) 
				or (not(e1) and not(e2) and s and not(z)) or (not(e1) and not(e2) and s and z) or (not(e1) and e2 and not(s) and not(z));
end architecture behav;
