module tb_viterbi_k7;

    reg clk=0;
    always #5 clk = ~clk;

    reg rst_n, start, rx_valid;
    reg rx0, rx1;

    wire ready, out_valid, out_bit;

    parameter SEQ_LEN = 256;

    viterbi_k7 #(.SEQ_LEN(SEQ_LEN)) dut (
        .clk(clk),
        .rst_n(rst_n),
        .start(start),
        .rx_valid(rx_valid),
        .rx_bit0(rx0),
        .rx_bit1(rx1),
        .ready(ready),
        .out_valid(out_valid),
        .out_bit(out_bit)
    );

    reg [SEQ_LEN-1:0] msg;
    reg [5:0] state;
    reg [1:0] e;
    integer i;

    function [1:0] enc;
        input bit_in;
        input [5:0] state;
        reg [6:0] shift;
        begin
            shift = {bit_in, state};
            enc[1] = shift[6]^shift[5]^shift[4]^shift[3]^shift[0];
            enc[0] = shift[6]^shift[4]^shift[3]^shift[1]^shift[0];
        end
    endfunction

    initial begin
        rst_n = 0; start = 0; rx_valid = 0;
        #20 rst_n = 1;

        msg = 256'hA5A5_F0F0_1234_5678_ABCD_EF01_1357_9BDF_2468_ACED_DEAD_BEEF_CAFE_BABE_0F0F_FFFF;

        state = 0;

        #20 start = 1; #10 start = 0;

        for (i=0;i<SEQ_LEN;i=i+1) begin
            e = enc(msg[i], state);
            state = {msg[i], state[5:1]};

            rx_valid = 1;
            rx0 = e[0];
            rx1 = e[1];
            #10;

            rx_valid = 0;
            #10;
        end

        #50000;
        $finish;
    end

endmodule

