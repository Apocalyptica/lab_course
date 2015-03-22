library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
entity regsdv4b is 
port(clk,en,d_in_a,d_in_b,d_in_c,d_in_d:in std_logic;
	d_out_a,d_out_b,d_out_c,d_out_d:out std_logic_vector (3 downto 0);
	z,y,x,w:out std_logic_vector (3 downto 0));
end regsdv4b;
architecture bb of regsdv4b is
signal shift_a: std_logic_vector (3 downto 0);
signal shift_b: std_logic_vector (3 downto 0);
signal shift_c: std_logic_vector (3 downto 0);
signal shift_d: std_logic_vector (3 downto 0);
begin
process (clk)
variable i: integer range 3 downto 0;
begin
if(rising_edge(clk)) then
shift_a(0)<=d_in_a;
shift_b(0)<=d_in_b;
shift_c(0)<=d_in_c;
shift_d(0)<=d_in_d;
	for i in 1 to 3 loop
	shift_a(i)<=shift_a(i-1);
	shift_b(i)<=shift_b(i-1);
	shift_c(i)<=shift_c(i-1);
	shift_d(i)<=shift_d(i-1);
	end loop;
end if;
end process;
    d_out_a<=shift_a when en='1' else "0000";
	d_out_b<=shift_b when en='1' else "0000";
	d_out_c<=shift_c when en='1' else "0000";
	d_out_d<=shift_d when en='1' else "0000";
	process(shift_a,shift_b,shift_c,shift_d)
begin
if (en='1') then
w(0)<=shift_d(0); w(1)<=shift_c(0);w(2)<=shift_b(0);w(3)<=shift_a(0);
x(0)<=shift_d(1); x(1)<=shift_c(1);x(2)<=shift_b(1);x(3)<=shift_a(1);
y(0)<=shift_d(2); y(1)<=shift_c(2);y(2)<=shift_b(2);y(3)<=shift_a(2);
z(0)<=shift_d(3); z(1)<=shift_c(3);z(2)<=shift_b(3);z(3)<=shift_a(3);
end if;
end process;
end bb;
