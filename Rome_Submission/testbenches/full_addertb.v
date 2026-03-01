`timescale 1ns/1ps
module full_addertb;
    reg a, b, cin;
    wire sum, cout;
    integer failed;

    full_adder uut (.a(a), .b(b), .cin(cin), .sum(sum), .cout(cout));

    initial begin
        failed = 0;
        // All 8 combinations of a, b, cin
        // a=0,b=0,cin=0 -> sum=0,cout=0
        a=0; b=0; cin=0; #10;
        if(sum!==1'b0 || cout!==1'b0) begin $display("FAIL: a=0 b=0 cin=0 | exp sum=0 cout=0 | got sum=%b cout=%b",sum,cout); failed=failed+1; end
        // a=0,b=0,cin=1 -> sum=1,cout=0
        a=0; b=0; cin=1; #10;
        if(sum!==1'b1 || cout!==1'b0) begin $display("FAIL: a=0 b=0 cin=1 | exp sum=1 cout=0 | got sum=%b cout=%b",sum,cout); failed=failed+1; end
        // a=0,b=1,cin=0 -> sum=1,cout=0
        a=0; b=1; cin=0; #10;
        if(sum!==1'b1 || cout!==1'b0) begin $display("FAIL: a=0 b=1 cin=0 | exp sum=1 cout=0 | got sum=%b cout=%b",sum,cout); failed=failed+1; end
        // a=0,b=1,cin=1 -> sum=0,cout=1
        a=0; b=1; cin=1; #10;
        if(sum!==1'b0 || cout!==1'b1) begin $display("FAIL: a=0 b=1 cin=1 | exp sum=0 cout=1 | got sum=%b cout=%b",sum,cout); failed=failed+1; end
        // a=1,b=0,cin=0 -> sum=1,cout=0
        a=1; b=0; cin=0; #10;
        if(sum!==1'b1 || cout!==1'b0) begin $display("FAIL: a=1 b=0 cin=0 | exp sum=1 cout=0 | got sum=%b cout=%b",sum,cout); failed=failed+1; end
        // a=1,b=0,cin=1 -> sum=0,cout=1
        a=1; b=0; cin=1; #10;
        if(sum!==1'b0 || cout!==1'b1) begin $display("FAIL: a=1 b=0 cin=1 | exp sum=0 cout=1 | got sum=%b cout=%b",sum,cout); failed=failed+1; end
        // a=1,b=1,cin=0 -> sum=0,cout=1
        a=1; b=1; cin=0; #10;
        if(sum!==1'b0 || cout!==1'b1) begin $display("FAIL: a=1 b=1 cin=0 | exp sum=0 cout=1 | got sum=%b cout=%b",sum,cout); failed=failed+1; end
        // a=1,b=1,cin=1 -> sum=1,cout=1
        a=1; b=1; cin=1; #10;
        if(sum!==1'b1 || cout!==1'b1) begin $display("FAIL: a=1 b=1 cin=1 | exp sum=1 cout=1 | got sum=%b cout=%b",sum,cout); failed=failed+1; end
        if(failed == 0)
            $display("full_adder passed!");
        else
            $display("full_adder FAILED: %0d errors", failed);
        $display("Simulation complete.");
        $finish;
    end
endmodule
