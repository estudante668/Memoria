library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-----------------------------------------------------------
-- 1. ENTIDADE E ARQUITETURA DO LATCH (O componente interno)
-----------------------------------------------------------
entity D_LATCH is
    Port (
        D     : in  STD_LOGIC;
        CLK   : in  STD_LOGIC;
        Q     : out STD_LOGIC;
        Q_bar : out STD_LOGIC
    );
end D_LATCH;

architecture Behavioral of D_LATCH is
    signal s_int, r_int : STD_LOGIC;
    signal q_int, qb_int : STD_LOGIC;
begin
    s_int <= D and CLK;
    r_int <= (not D) and CLK;
    
    q_int  <= not (r_int or qb_int);
    qb_int <= not (s_int or q_int);
    
    Q <= q_int;
    Q_bar <= qb_int;
end Behavioral;

-----------------------------------------------------------
-- 2. ENTIDADE E ARQUITETURA DO FLIP-FLOP (O circuito principal)
-----------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity D_Flip_Flop is
    Port (
        D   : in  STD_LOGIC;
        CLK : in  STD_LOGIC;
        Q   : out STD_LOGIC;
        Q_n : out STD_LOGIC
    );
end D_Flip_Flop;

architecture Structural of D_Flip_Flop is
    signal n1      : STD_LOGIC;
    signal n1_n    : STD_LOGIC;
    signal clk_inv : STD_LOGIC;
begin
    -- Inversor do Clock
    clk_inv <= not CLK;

    -- Instância do Latch Mestre
    -- Como o componente está no mesmo arquivo, o Quartus o encontrará agora!
    Mestre: entity work.D_LATCH
        port map (
            D     => D,
            CLK   => clk_inv,
            Q     => n1,
            Q_bar => n1_n
        );

    -- Instância do Latch Escravo
    Escravo: entity work.D_LATCH
        port map (
            D     => n1,
            CLK   => CLK,
            Q     => Q,
            Q_bar => Q_n
        );

end Structural;