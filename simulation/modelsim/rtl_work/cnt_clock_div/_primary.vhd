library verilog;
use verilog.vl_types.all;
entity cnt_clock_div is
    port(
        aclr            : in     vl_logic;
        clock           : in     vl_logic;
        q               : out    vl_logic_vector(24 downto 0)
    );
end cnt_clock_div;
