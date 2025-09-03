module top_module (
    input clk,
    input x,
    output z
); 
    wire q0,q1,q2;
    wire d0,d1,d2;
     //top dff
   assign d0= x^q0;
    always @(posedge clk)
         begin
             q0<=d0;
         end
    //2nd dff
    assign d1=(x&~q1);
    always @(posedge clk)
        begin
            q1<= d1;
        end
    
    //3rd dff
    assign  d2=(x | ~q2);
    always @ (posedge clk)
        begin
            q2<= d2;
        end
    assign z= ~(q0 | q1 | q2);

endmodule
