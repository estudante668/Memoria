library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity LatchSR is
    Port (
        S : in  STD_LOGIC;
        R : in  STD_LOGIC;
        Q : out STD_LOGIC
    );
end LatchSR;

architecture Behavioral of LatchSR is
    signal q_reg : STD_LOGIC := '0';
begin

    process(S, R)
    begin
        if (S = '1' and R = '0') then
            q_reg <= '1';
        elsif (S = '0' and R = '1') then
            q_reg <= '0';
        elsif (S = '0' and R = '0') then
            -- mantém o valor (latch)
            null;
        else
            -- condição proibida: S=1 e R=1
            q_reg <= '0';  -- ou escolha uma prioridade
        end if;
    end process;

    Q <= q_reg;

end Behavioral;