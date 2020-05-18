library verilog;
use verilog.vl_types.all;
entity TM1638_shifter is
    generic(
        state1          : integer := 0;
        state2          : integer := 1;
        state3          : integer := 2;
        state4          : integer := 3;
        state5          : integer := 4;
        state6          : integer := 5;
        state7          : integer := 6;
        state8          : integer := 7;
        state9          : integer := 8
    );
    port(
        reset           : in     vl_logic;
        clock           : in     vl_logic;
        data_in         : in     vl_logic_vector(7 downto 0);
        data_io         : out    vl_logic;
        strobe          : out    vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of state1 : constant is 1;
    attribute mti_svvh_generic_type of state2 : constant is 1;
    attribute mti_svvh_generic_type of state3 : constant is 1;
    attribute mti_svvh_generic_type of state4 : constant is 1;
    attribute mti_svvh_generic_type of state5 : constant is 1;
    attribute mti_svvh_generic_type of state6 : constant is 1;
    attribute mti_svvh_generic_type of state7 : constant is 1;
    attribute mti_svvh_generic_type of state8 : constant is 1;
    attribute mti_svvh_generic_type of state9 : constant is 1;
end TM1638_shifter;
