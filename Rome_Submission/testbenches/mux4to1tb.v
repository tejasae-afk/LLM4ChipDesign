`timescale 1ns/1ps
module mux4to1tb;
    reg [1:0] sel;
    reg [3:0] in;
    wire out;
    integer failed;
    initial begin
        failed = 0;
        in=4'b0000; sel=2'd0; #10; if(out!==1'b0) begin $display("FAIL sel=0 in=0000 exp=0 got=%b",out); failed=failed+1; end
        in=4'b0001; sel=2'd0; #10; if(out!==1'b1) begin $display("FAIL sel=0 in=0001 exp=1 got=%b",out); failed=failed+1; end
        in=4'b0010; sel=2'd0; #10; if(out!==1'b0) begin $display("FAIL sel=0 in=0010 exp=0 got=%b",out); failed=failed+1; end
        in=4'b0011; sel=2'd0; #10; if(out!==1'b1) begin $display("FAIL sel=0 in=0011 exp=1 got=%b",out); failed=failed+1; end
        in=4'b0000; sel=2'd1; #10; if(out!==1'b0) begin $display("FAIL sel=1 in=0000 exp=0 got=%b",out); failed=failed+1; end
        in=4'b0010; sel=2'd1; #10; if(out!==1'b1) begin $display("FAIL sel=1 in=0010 exp=1 got=%b",out); failed=failed+1; end
        in=4'b0100; sel=2'd1; #10; if(out!==1'b0) begin $display("FAIL sel=1 in=0100 exp=0 got=%b",out); failed=failed+1; end
        in=4'b0110; sel=2'd1; #10; if(out!==1'b1) begin $display("FAIL sel=1 in=0110 exp=1 got=%b",out); failed=failed+1; end
        in=4'b0000; sel=2'd2; #10; if(out!==1'b0) begin $display("FAIL sel=2 in=0000 exp=0 got=%b",out); failed=failed+1; end
        in=4'b0100; sel=2'd2; #10; if(out!==1'b1) begin $display("FAIL sel=2 in=0100 exp=1 got=%b",out); failed=failed+1; end
        in=4'b1000; sel=2'd2; #10; if(out!==1'b0) begin $display("FAIL sel=2 in=1000 exp=0 got=%b",out); failed=failed+1; end
        in=4'b1100; sel=2'd2; #10; if(out!==1'b1) begin $display("FAIL sel=2 in=1100 exp=1 got=%b",out); failed=failed+1; end
        in=4'b0000; sel=2'd3; #10; if(out!==1'b0) begin $display("FAIL sel=3 in=0000 exp=0 got=%b",out); failed=failed+1; end
        in=4'b1000; sel=2'd3; #10; if(out!==1'b1) begin $display("FAIL sel=3 in=1000 exp=1 got=%b",out); failed=failed+1; end
        in=4'b0100; sel=2'd3; #10; if(out!==1'b0) begin $display("FAIL sel=3 in=0100 exp=0 got=%b",out); failed=failed+1; end
        in=4'b1100; sel=2'd3; #10; if(out!==1'b1) begin $display("FAIL sel=3 in=1100 exp=1 got=%b",out); failed=failed+1; end
        $display("mux4to1 passed!");
        $display("Simulation complete.");
        $finish;
    end
    mux4to1 uut (.sel(sel), .in(in), .out(out));
endmodule
