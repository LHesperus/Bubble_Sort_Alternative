library verilog;
use verilog.vl_types.all;
entity Datapath is
    generic(
        word_size       : integer := 4;
        N               : integer := 8
    );
    port(
        Data_in         : in     vl_logic_vector;
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        set_i           : in     vl_logic;
        incr_i          : in     vl_logic;
        set_j           : in     vl_logic;
        decr_j          : in     vl_logic;
        clr_k           : in     vl_logic;
        incr_k          : in     vl_logic;
        swap            : in     vl_logic;
        snd             : in     vl_logic;
        ld              : in     vl_logic;
        Data_out        : out    vl_logic_vector;
        gt              : out    vl_logic;
        i_lte_N         : out    vl_logic;
        j_gte_i         : out    vl_logic;
        done            : out    vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of word_size : constant is 1;
    attribute mti_svvh_generic_type of N : constant is 1;
end Datapath;
