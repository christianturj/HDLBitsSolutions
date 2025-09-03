module top_module (
	input clk,
	input L,
	input r_in,
	input q_in,
	output reg Q);
    wire d= (L) ? r_in : q_in; // 2:1 mux
    always @(posedge clk) //dff
        begin
         Q<=d;
        end
    
 endmodule

module chain(
    input L,
    input clk,
    input r0,
    input r1,
    input r2,
    output Q0,
    output Q1,
    output Q2);
    
    wire q0, q1, q2;
    wire x=q1^q0; //xor gate
    //stage 1
    top_module dut1(
        .clk(clk),
        .L(L),
        .r_in(r0),
        .q_in(q2),
        .Q(q0));
    
    //stage 2
    top_module dut2(
        .clk(clk),
        .L(L),
        .r_in(r1),
        .q_in(q0),
        .Q(q1));
    
    //stage 3
    top_module dut3(
        .clk(clk),
        .L(L),
        .r_in(r2),
        .q_in(x),
        .Q(q2));
    
    
    assign Q0=q0;
    assign Q1=q1;
    assign Q2=q2;
        
        
        endmodule