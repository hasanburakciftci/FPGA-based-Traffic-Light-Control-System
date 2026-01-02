library ieee;
use ieee.std_Logic_1164.all;
use ieee.numeric_std.all;

entity TRI is 
 port(
	--inputs
	Clk : in std_logic;	
	--outputs
	KI  :  out std_logic_vector (2 downto 0);
	BI  :  out std_logic_vector (2 downto 0);
	DI  :  out std_logic_vector (2 downto 0);
    GI  :  out std_logic_vector (2 downto 0));
end entity;              
  
  
architecture Behavioral of TRI is 
  
	type durumlar is (t1,t2,t3,t4,t5,t6,t7,t8);
	signal durum : durumlar := t1;
	constant Clk_freq : integer := 12000;
	signal Cnt : integer range 0 to Clk_freq*60 := 0;
	
	
	
begin
    process (Clk)is
	begin
		if rising_edge(Clk) then	
		KI <= "000";
		DI <= "000";
		GI <= "000";
		BI <= "000";
		Cnt <= Cnt+1;
			case durum is
				when t1 =>
				KI <= "010";
				DI <= "100";
				GI <= "100";
				BI <= "010";
					if Cnt = Clk_freq*3-1 then
					Cnt <= 0;
					durum <= t2;
					end if;
					
				when t2 =>
				KI <= "001";
				DI <= "100";
				GI <= "100";
				BI <= "100";
					if Cnt = Clk_freq*24-1 then
					Cnt <= 0;
					durum <= t3;
					end if;
					
				when t3 =>
				KI <= "010";
				DI <= "010";
				GI <= "100";
				BI <= "100";
					if Cnt = Clk_freq*3-1  then
					Cnt <= 0;
					durum <= t4;
					end if;
					
				When t4 =>
				KI <= "100";
				DI <= "001";
				GI <= "100";
				BI <= "100";
					if Cnt = Clk_freq*8-1 then
					Cnt <= 0;
					durum <= t5;
					end if;
					
				When t5 =>
				KI <= "100";
				DI <= "010";
				GI <= "010";
				BI <= "100";
					if Cnt = Clk_freq*3-1 then
					Cnt <= 0;
					durum <= t6;
					end if;
					
				When t6 =>
				KI <= "100";
				DI <= "100";
				GI <= "001";
				BI <= "100";
					if Cnt = Clk_freq*10-1 then
					Cnt <= 0;
					durum <= t7;
					end if;
					
				When t7 =>
				KI <= "100";
				DI <= "100";
				GI <= "010";
				BI <= "010";
					if Cnt = Clk_freq*3-1 then
					Cnt <= 0;
					durum <= t8;
					end if;
					
				When t8 =>
				KI <= "100";
				DI <= "100";
				GI <= "100";
				BI <= "001";
					if Cnt = Clk_freq*6-1 then
					Cnt <= 0;
					durum <= t1;
					end if;
					
			end case;
		end if;
	end process;
end architecture;
