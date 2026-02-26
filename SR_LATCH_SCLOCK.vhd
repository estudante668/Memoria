library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity SR_LATCH_SCLOCK is
    Port (
        S,R : in  STD_LOGIC;
        Q, Q_Bar : out STD_LOGIC
    );
end SR_LATCH_SCLOCK;

architecture Behavioral of SR_LATCH_SCLOCK is
   
	SIGNAL TQ, TQ_Bar: STD_LOGIC;
	
begin

    TQ <= S NAND TQ_Bar;
	 TQ_Bar <= R NAND TQ;
	 
	 Q <= TQ;
	 Q_Bar <= TQ_Bar; 

end Behavioral;