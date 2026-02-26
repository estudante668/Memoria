library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity SR_LATCH is
    Port (
        S  : in  STD_LOGIC;
        R  : in  STD_LOGIC;
        Q  : out STD_LOGIC;
        Qn : out STD_LOGIC
    );
end SR_LATCH;

architecture Structural of SR_LATCH is
    signal q_int, qn_int : STD_LOGIC;
begin

    -- Realimentação cruzada (NOR)
    q_int  <= not (R or qn_int);
    qn_int <= not (S or q_int);

    Q  <= q_int;
    Qn <= qn_int;

end Structural;