library verilog;
use verilog.vl_types.all;
entity Bubble_Sort_Alternative is
    generic(
        word_size       : integer := 4
    );
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        Load            : in     vl_logic;
        Sort            : in     vl_logic;
        Send            : in     vl_logic;
        Data_in         : in     vl_logic_vector;
        Ready           : out    vl_logic;
        Busy            : out    vl_logic;
        Waiting         : out    vl_logic;
        Data_out        : out    vl_logic_vector
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of word_size : constant is 1;
end Bubble_Sort_Alternative;
