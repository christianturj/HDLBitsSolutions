module fadder(
    input  x, y, cin,
    output sum, cout
);
    assign sum  = x ^ y ^ cin;
    assign cout = (x & y) | (x & cin) | (y & cin);
endmodule


module top_module (
    input  [3:0] x,
    input  [3:0] y,
    output [4:0] sum
);
    wire [3:0] c;  

    fadder fa0 (.x(x[0]), .y(y[0]), .cin(1'b0),  .sum(sum[0]), .cout(c[0]));
    fadder fa1 (.x(x[1]), .y(y[1]), .cin(c[0]),  .sum(sum[1]), .cout(c[1]));
    fadder fa2 (.x(x[2]), .y(y[2]), .cin(c[1]),  .sum(sum[2]), .cout(c[2]));
    fadder fa3 (.x(x[3]), .y(y[3]), .cin(c[2]),  .sum(sum[3]), .cout(c[3]));

    assign sum[4] = c[3];  
endmodule
