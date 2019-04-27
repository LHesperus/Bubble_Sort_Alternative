library verilog;
use verilog.vl_types.all;
entity Control is
    generic(
        state_N         : integer := 3;
        S_rst           : integer := 0;
        S_init          : integer := 1;
        S_idle          : integer := 2;
        S_load          : integer := 3;
        S_prep          : integer := 4;
        S_sort          : integer := 5;
        S_wait          : integer := 6;
        S_send          : integer := 7
    );
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        Send            : in     vl_logic;
        Sort            : in     vl_logic;
        Load            : in     vl_logic;
        gt              : in     vl_logic;
        i_lte_N         : in     vl_logic;
        j_gte_i         : in     vl_logic;
        done            : in     vl_logic;
        Ready           : out    vl_logic;
        Busy            : out    vl_logic;
        Waiting         : out    vl_logic;
        ld              : out    vl_logic;
        snd             : out    vl_logic;
        set_i           : out    vl_logic;
        incr_i          : out    vl_logic;
        set_j           : out    vl_logic;
        decr_j          : out    vl_logic;
        clr_k           : out    vl_logic;
        incr_k          : out    vl_logic;
        swap            : out    vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of state_N : constant is 1;
    attribute mti_svvh_generic_type of S_rst : constant is 1;
    attribute mti_svvh_generic_type of S_init : constant is 1;
    attribute mti_svvh_generic_type of S_idle : constant is 1;
    attribute mti_svvh_generic_type of S_load : constant is 1;
    attribute mti_svvh_generic_type of S_prep : constant is 1;
    attribute mti_svvh_generic_type of S_sort : constant is 1;
    attribute mti_svvh_generic_type of S_wait : constant is 1;
    attribute mti_svvh_generic_type of S_send : constant is 1;
end Control;
