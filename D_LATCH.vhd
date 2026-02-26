library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity D_LATCH is
    Port (
        D  : in  STD_LOGIC;
        En : in  STD_LOGIC;
        Q  : out STD_LOGIC;
        Qn : out STD_LOGIC
    );
end D_LATCH;

architecture Structural of D_LATCH is

    -- sinais internos
    signal S_n, R_n : STD_LOGIC;
    signal q_int, qn_int : STD_LOGIC;
    signal D_not : STD_LOGIC;

begin

    --------------------------------------------------
    -- Inversor
    --------------------------------------------------
    D_not <= not D;

    --------------------------------------------------
    -- Lógica de Enable
    --------------------------------------------------
    S_n <= not (D and En);
    R_n <= not (D_not and En);

    --------------------------------------------------
    -- SR latch (realimentação)
    --------------------------------------------------
    q_int  <= not (S_n and qn_int);
    qn_int <= not (R_n and q_int);

    Q  <= q_int;
    Qn <= qn_int;

end Structural;