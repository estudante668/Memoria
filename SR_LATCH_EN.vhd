library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity SR_LATCH_EN is
    Port (
        S  : in  STD_LOGIC;
        R  : in  STD_LOGIC;
        En : in  STD_LOGIC;
        Q  : out STD_LOGIC;
        Qn : out STD_LOGIC
    );
end SR_LATCH_EN;

architecture Behavioral of SR_LATCH_EN is
    signal q_reg : STD_LOGIC := '0';
begin

    process(S, R, En)
    begin
        if En = '1' then
            if (S = '1' and R = '0') then
                q_reg <= '1';          -- Set
            elsif (S = '0' and R = '1') then
                q_reg <= '0';          -- Reset
            elsif (S = '0' and R = '0') then
                null;                  -- Mantém
            else
                -- Condição proibida: S=1 e R=1
                q_reg <= 'X';
            end if;
        end if;
        -- En = 0 → mantém automaticamente (latch)
    end process;

    Q  <= q_reg;
    Qn <= not q_reg;

end Behavioral;