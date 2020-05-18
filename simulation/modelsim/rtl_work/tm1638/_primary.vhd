library verilog;
use verilog.vl_types.all;
entity tm1638 is
    port(
        clock_out       : out    vl_logic;
        clock_out_div   : out    vl_logic;
        strobe          : out    vl_logic;
        data_io         : out    vl_logic;
        reset           : in     vl_logic;
        clock_in        : in     vl_logic
    );
end tm1638;
