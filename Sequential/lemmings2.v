module top_module(
    input clk,
    input areset,    // Freshly brainwashed Lemmings walk left.
    input bump_left,
    input bump_right,
    input ground,
    output walk_left,
    output walk_right,
    output aaah ); 
    reg[1:0] state, next_state;
    parameter LEFT=0, RIGHT=1, FALL_L=2, FALL_R=3;
    
    always @ (*)
        begin
            case(state)
                LEFT:
                    if(!ground) begin
                        next_state=FALL_L;
                    end
                else begin
                        next_state=(bump_left ? RIGHT : LEFT);
                    end
                RIGHT: 
                    if(!ground)begin
                        next_state=FALL_R;
                    end
                else
                    begin
                        
                        next_state=(bump_right? LEFT: RIGHT);
                    end
                FALL_L: next_state=(ground ? LEFT : FALL_L);
                FALL_R: next_state=(ground ? RIGHT : FALL_R);
                default: next_state=LEFT;
            endcase
        end
    always @ (posedge clk or posedge areset)
        begin
            if(areset)
                begin
                    state<=LEFT;
                end
            else
                begin
                	state<=next_state;
                end
        end

assign walk_left=(state==LEFT);
assign walk_right=(state==RIGHT);
    assign aaah=(state==FALL_L) || (state==FALL_R);
                   
                

endmodule
