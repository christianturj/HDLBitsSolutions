module top_module (
    input clk,
    input reset,      // Synchronous reset
    input data,
    output start_shifting);
    localparam [2:0] A=3'd0, B=3'd1, C=3'd2, D=3'd3, DONE=3'd4;
	reg [2:0] state, next_state;
    always @(*)
        begin
            case(state)
                    A: next_state=(data ? B:A);
                    B:next_state=(data? C:A);
                    C:next_state=(data? C:D);
                    D:next_state=(data? DONE:A);
                	DONE:next_state=DONE;
                    default: next_state=A;
                    endcase
                end

      
                always @(posedge clk)
                    begin
                        if(reset)
                            begin
                                state<=A;
                            end
                        else begin
                            state<=next_state;
                        end
                    end
 assign start_shifting=(state==DONE);
endmodule
