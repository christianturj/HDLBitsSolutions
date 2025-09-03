module top_module (
    input clk,
    input w, R, E, L,
    output Q
);
    //first mux
    wire muxout0= (E) ? w :Q;
    //2nd mux
    wire muxout1= (L) ? R : muxout0;
    always @(posedge clk) //dff
        begin
            Q<=muxout1;
        end
endmodule


    
