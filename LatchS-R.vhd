library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity LatchS-R is
    Port (
        S : in  STD_LOGIC;
        R : in  STD_LOGIC;
        Q : out STD_LOGIC
    );
end LatchS-R;

architecture Behavioral of LatchS-R is
   
begin

 process(S, R)
    begin
        if (S = '1' and R = '0') then
            q_reg <= '1';
        elsif (S = '0' and R = '1') then
            q_reg <= '0';
        elsif (S = '0' and R = '0') then
            q_reg <= q_reg; -- mantém
        else
            q_reg <= 'X'; -- condição inválida (S=1 e R=1)
        end if;
    end process;

    Q <= q_reg;

end Behavioral;