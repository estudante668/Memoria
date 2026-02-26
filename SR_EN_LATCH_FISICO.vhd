library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity SR_EN_LATCH_FISICO is
    Port (
        S  : in  STD_LOGIC;
        R  : in  STD_LOGIC;
        En : in  STD_LOGIC;
        Q  : out STD_LOGIC;
        Qn : out STD_LOGIC
    );
end SR_EN_LATCH_FISICO;

architecture Structural of SR_EN_LATCH_FISICO is

    -- Sinais internos
    signal S_g, R_g : STD_LOGIC;
    signal q_int, qn_int : STD_LOGIC;

begin

    -- NAND de habilitação (Enable)
    S_g <= not (S and En);
    R_g <= not (R and En);

    -- Latch SR com NAND cruzadas
    q_int  <= not (S_g and qn_int);
    qn_int <= not (R_g and q_int);

    -- Saídas
    Q  <= q_int;
    Qn <= qn_int;

end Structural;