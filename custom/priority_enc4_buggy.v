
module priority_enc4 (
    input  wire [3:0] in,
    output reg  [1:0] out,
    output reg        valid
);
    // BUG: priority order is REVERSED — in[0] checked first (wrong!)
    always @(*) begin
        if (in[0]) begin          // BUG: should be in[3]
            out   = 2'b11;
            valid = 1'b1;
        end else if (in[1]) begin // BUG: should be in[2]
            out   = 2'b10;
            valid = 1'b1;
        end else if (in[2]) begin // BUG: should be in[1]
            out   = 2'b01;
            valid = 1'b1;
        end else if (in[3]) begin // BUG: should be in[0]
            out   = 2'b00;
            valid = 1'b1;
        end else begin
            out   = 2'b00;
            valid = 1'b0;
        end
    end
endmodule
