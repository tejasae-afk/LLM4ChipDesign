`timescale 1ns/1ps
module mux2to1tb;
    reg in1, in2, select;
    wire out;
    integer failed;
    initial begin
        failed = 0;
        in1=0; in2=0; select=0; #10; if(out!==1'b0) begin $display("FAIL: in1=0 in2=0 sel=0 exp=0 got=%b",out); failed=failed+1; end
        in1=1; in2=0; select=0; #10; if(out!==1'b1) begin $display("FAIL: in1=1 in2=0 sel=0 exp=1 got=%b",out); failed=failed+1; end
        in1=0; in2=1; select=0; #10; if(out!==1'b0) begin $display("FAIL: in1=0 in2=1 sel=0 exp=0 got=%b",out); failed=failed+1; end
        in1=1; in2=1; select=0; #10; if(out!==1'b1) begin $display("FAIL: in1=1 in2=1 sel=0 exp=1 got=%b",out); failed=failed+1; end
        in1=0; in2=0; select=1; #10; if(out!==1'b0) begin $display("FAIL: in1=0 in2=0 sel=1 exp=0 got=%b",out); failed=failed+1; end
        in1=1; in2=0; select=1; #10; if(out!==1'b0) begin $display("FAIL: in1=1 in2=0 sel=1 exp=0 got=%b",out); failed=failed+1; end
        in1=0; in2=1; select=1; #10; if(out!==1'b1) begin $display("FAIL: in1=0 in2=1 sel=1 exp=1 got=%b",out); failed=failed+1; end
        in1=1; in2=1; select=1; #10; if(out!==1'b1) begin $display("FAIL: in1=1 in2=1 sel=1 exp=1 got=%b",out); failed=failed+1; end
        $display("mux2to1 passed!");
        $display("Simulation complete.");
        $finish;
    end
    mux2to1 uut (.in1(in1), .in2(in2), .select(select), .out(out));
endmodule
