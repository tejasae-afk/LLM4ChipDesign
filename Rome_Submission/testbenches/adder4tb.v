`timescale 1ns/1ps
module adder4tb;
    reg  [3:0] a, b;
    reg        cin;
    wire [3:0] sum;
    wire       cout;
    integer failed;
    reg [4:0] expected;

    adder4 uut (.a(a), .b(b), .cin(cin), .sum(sum), .cout(cout));

    initial begin
        failed = 0;
        // Zero + Zero, no carry
        a=4'd0;  b=4'd0;  cin=0; #10; expected=5'd0;
        if({cout,sum}!==expected) begin $display("FAIL: %0d+%0d+%0d | exp=%0d got=%0d",a,b,cin,expected,{cout,sum}); failed=failed+1; end
        // 1 + 1 = 2
        a=4'd1;  b=4'd1;  cin=0; #10; expected=5'd2;
        if({cout,sum}!==expected) begin $display("FAIL: %0d+%0d+%0d | exp=%0d got=%0d",a,b,cin,expected,{cout,sum}); failed=failed+1; end
        // 7 + 8 = 15
        a=4'd7;  b=4'd8;  cin=0; #10; expected=5'd15;
        if({cout,sum}!==expected) begin $display("FAIL: %0d+%0d+%0d | exp=%0d got=%0d",a,b,cin,expected,{cout,sum}); failed=failed+1; end
        // 15 + 1 = 16 (cout=1, sum=0)
        a=4'd15; b=4'd1;  cin=0; #10; expected=5'd16;
        if({cout,sum}!==expected) begin $display("FAIL: %0d+%0d+%0d | exp=%0d got=%0d",a,b,cin,expected,{cout,sum}); failed=failed+1; end
        // 15 + 15 = 30
        a=4'd15; b=4'd15; cin=0; #10; expected=5'd30;
        if({cout,sum}!==expected) begin $display("FAIL: %0d+%0d+%0d | exp=%0d got=%0d",a,b,cin,expected,{cout,sum}); failed=failed+1; end
        // 15 + 15 + cin=1 = 31
        a=4'd15; b=4'd15; cin=1; #10; expected=5'd31;
        if({cout,sum}!==expected) begin $display("FAIL: %0d+%0d+%0d | exp=%0d got=%0d",a,b,cin,expected,{cout,sum}); failed=failed+1; end
        // 5 + 3 + cin=1 = 9
        a=4'd5;  b=4'd3;  cin=1; #10; expected=5'd9;
        if({cout,sum}!==expected) begin $display("FAIL: %0d+%0d+%0d | exp=%0d got=%0d",a,b,cin,expected,{cout,sum}); failed=failed+1; end
        // 9 + 6 = 15
        a=4'd9;  b=4'd6;  cin=0; #10; expected=5'd15;
        if({cout,sum}!==expected) begin $display("FAIL: %0d+%0d+%0d | exp=%0d got=%0d",a,b,cin,expected,{cout,sum}); failed=failed+1; end
        if(failed == 0)
            $display("adder4 passed!");
        else
            $display("adder4 FAILED: %0d errors", failed);
        $display("Simulation complete.");
        $finish;
    end
endmodule
