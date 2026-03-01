`timescale 1ns/1ps
module half_addertb;
    reg a, b;
    wire sum, cout;
    integer failed;

    half_adder uut (.a(a), .b(b), .sum(sum), .cout(cout));

    initial begin
        failed = 0;
        // a=0,b=0 -> sum=0,cout=0
        a=0; b=0; #10;
        if(sum!==1'b0 || cout!==1'b0) begin
            $display("FAIL: a=0 b=0 | expected sum=0 cout=0 | got sum=%b cout=%b", sum, cout);
            failed=failed+1;
        end
        // a=0,b=1 -> sum=1,cout=0
        a=0; b=1; #10;
        if(sum!==1'b1 || cout!==1'b0) begin
            $display("FAIL: a=0 b=1 | expected sum=1 cout=0 | got sum=%b cout=%b", sum, cout);
            failed=failed+1;
        end
        // a=1,b=0 -> sum=1,cout=0
        a=1; b=0; #10;
        if(sum!==1'b1 || cout!==1'b0) begin
            $display("FAIL: a=1 b=0 | expected sum=1 cout=0 | got sum=%b cout=%b", sum, cout);
            failed=failed+1;
        end
        // a=1,b=1 -> sum=0,cout=1
        a=1; b=1; #10;
        if(sum!==1'b0 || cout!==1'b1) begin
            $display("FAIL: a=1 b=1 | expected sum=0 cout=1 | got sum=%b cout=%b", sum, cout);
            failed=failed+1;
        end
        if(failed == 0)
            $display("half_adder passed!");
        else
            $display("half_adder FAILED: %0d errors", failed);
        $display("Simulation complete.");
        $finish;
    end
endmodule
