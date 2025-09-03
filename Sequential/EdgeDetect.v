module top_module (
    input clk,
    input [7:0] in,
    output [7:0] pedge
);
    //use dff to store bit from last clk
    reg [7:0] prev;

    always @(posedge clk) begin
        pedge <= in & ~prev;  // detect 0→1
        prev  <= in;          // update previous
    end
endmodule

