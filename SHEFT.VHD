Library IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
ENTITY SHEFT IS
	PORT (CLK,M,C0 : IN STD_LOGIC;
			S      : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
			D      : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
			QB     : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
			CN	   : OUT STD_LOGIC);
END ENTITY;
ARCHITECTURE BEHAV OF SHEFT IS
	  SIGNAL ABC  : STD_LOGIC_VECTOR(2 DOWNTO 0);
      SIGNAL REG  : STD_LOGIC_VECTOR(7 DOWNTO 0);
      SIGNAL   CY : STD_LOGIC ;
    BEGIN 	
PROCESS (CLK,ABC,C0)
 BEGIN
  IF CLK'EVENT AND CLK = '1' THEN
    CASE ABC IS
     WHEN "011" => 	REG(0) <= C0    ; REG(7 DOWNTO 1) <= REG(6 DOWNTO 0); CY <= REG(7);  --����λѭ������	 
	 WHEN "010" => 	REG(0) <= REG(7); REG(7 DOWNTO 1) <= REG(6 DOWNTO 0);                --ѭ������    
	 WHEN "100" => 	REG(7) <= REG(0); REG(6 DOWNTO 0) <= REG(7 DOWNTO 1);                --ѭ������  
	 WHEN "101" =>	REG(7) <= C0    ; REG(6 DOWNTO 0) <= REG(7 DOWNTO 1); CY <= REG(0);  --����λѭ������    
	 WHEN "110" =>                    REG(7 DOWNTO 0) <=   D(7 DOWNTO 0);  	             --���ش���λ��
     WHEN "111" =>                    REG(7 DOWNTO 0) <=   D(7 DOWNTO 0);	             --���ش���λ��
     WHEN OTHERS => REG <= REG ;  CY <= CY ;                                             --����
    END CASE;
  END IF;
 END PROCESS;
	ABC <= S & M; QB(7 DOWNTO 0) <= REG(7 DOWNTO 0); CN <= CY;	
END BEHAV;

