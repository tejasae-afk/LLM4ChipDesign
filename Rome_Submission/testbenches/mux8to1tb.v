`timescale 1ns/1ps
module mux8to1tb;
    reg [2:0] sel;
    reg [7:0] in;
    wire out;
    integer failed;
    initial begin
        failed = 0;
        in=8'h00; sel=3'd0; #10; if(out!==1'b0) begin $display("FAIL sel=0 in=00 exp=0 got=%b",out); failed=failed+1; end
        in=8'h01; sel=3'd0; #10; if(out!==1'b1) begin $display("FAIL sel=0 in=01 exp=1 got=%b",out); failed=failed+1; end
        in=8'h00; sel=3'd1; #10; if(out!==1'b0) begin $display("FAIL sel=1 in=00 exp=0 got=%b",out); failed=failed+1; end
        in=8'h02; sel=3'd1; #10; if(out!==1'b1) begin $display("FAIL sel=1 in=02 exp=1 got=%b",out); failed=failed+1; end
        in=8'h00; sel=3'd2; #10; if(out!==1'b0) begin $display("FAIL sel=2 in=00 exp=0 got=%b",out); failed=failed+1; end
        in=8'h04; sel=3'd2; #10; if(out!==1'b1) begin $display("FAIL sel=2 in=04 exp=1 got=%b",out); failed=failed+1; end
        in=8'h00; sel=3'd3; #10; if(out!==1'b0) begin $display("FAIL sel=3 in=00 exp=0 got=%b",out); failed=failed+1; end
        in=8'h08; sel=3'd3; #10; if(out!==1'b1) begin $display("FAIL sel=3 in=08 exp=1 got=%b",out); failed=failed+1; end
        in=8'h00; sel=3'd4; #10; if(out!==1'b0) begin $display("FAIL sel=4 in=00 exp=0 got=%b",out); failed=failed+1; end
        in=8'h10; sel=3'd4; #10; if(out!==1'b1) begin $display("FAIL sel=4 in=10 exp=1 got=%b",out); failed=failed+1; end
        in=8'h00; sel=3'd5; #10; if(out!==1'b0) begin $display("FAIL sel=5 in=00 exp=0 got=%b",out); failed=failed+1; end
        in=8'h20; sel=3'd5; #10; if(out!==1'b1) begin $display("FAIL sel=5 in=20 exp=1 got=%b",out); failed=failed+1; end
        in=8'h00; sel=3'd6; #10; if(out!==1'b0) begin $display("FAIL sel=6 in=00 exp=0 got=%b",out); failed=failed+1; end
        in=8'h40; sel=3'd6; #10; if(out!==1'b1) begin $display("FAIL sel=6 in=40 exp=1 got=%b",out); failed=failed+1; end
        in=8'h00; sel=3'd7; #10; if(out!==1'b0) begin $display("FAIL sel=7 in=00 exp=0 got=%b",out); failed=failed+1; end
        in=8'h80; sel=3'd7; #10; if(out!==1'b1) begin $display("FAIL sel=7 in=80 exp=1 got=%b",out); failed=failed+1; end
        $display("mux8to1 passed!");
        $display("Simulation complete.");
        $finish;
    end
    mux8to1 uut (.sel(sel), .in(in), .out(out));
endmodule
