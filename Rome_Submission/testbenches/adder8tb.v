`timescale 1ns/1ps
module adder8tb;
    reg  [7:0] a, b;
    reg        cin;
    wire [7:0] sum;
    wire       cout;
    integer failed;
    reg [8:0] expected;

    adder8 uut (.a(a), .b(b), .cin(cin), .sum(sum), .cout(cout));

    initial begin
        failed = 0;
        // 0 + 0 = 0
        a=8'd0;   b=8'd0;   cin=0; #10; expected=9'd0;
        if({cout,sum}!==expected) begin $display("FAIL: %0d+%0d+%0d | exp=%0d got=%0d",a,b,cin,expected,{cout,sum}); failed=failed+1; end
        // 1 + 1 = 2
        a=8'd1;   b=8'd1;   cin=0; #10; expected=9'd2;
        if({cout,sum}!==expected) begin $display("FAIL: %0d+%0d+%0d | exp=%0d got=%0d",a,b,cin,expected,{cout,sum}); failed=failed+1; end
        // 100 + 55 = 155
        a=8'd100; b=8'd55;  cin=0; #10; expected=9'd155;
        if({cout,sum}!==expected) begin $display("FAIL: %0d+%0d+%0d | exp=%0d got=%0d",a,b,cin,expected,{cout,sum}); failed=failed+1; end
        // 255 + 1 = 256 (cout=1, sum=0)
        a=8'd255; b=8'd1;   cin=0; #10; expected=9'd256;
        if({cout,sum}!==expected) begin $display("FAIL: %0d+%0d+%0d | exp=%0d got=%0d",a,b,cin,expected,{cout,sum}); failed=failed+1; end
        // 255 + 255 = 510
        a=8'd255; b=8'd255; cin=0; #10; expected=9'd510;
        if({cout,sum}!==expected) begin $display("FAIL: %0d+%0d+%0d | exp=%0d got=%0d",a,b,cin,expected,{cout,sum}); failed=failed+1; end
        // 255 + 255 + cin=1 = 511
        a=8'd255; b=8'd255; cin=1; #10; expected=9'd511;
        if({cout,sum}!==expected) begin $display("FAIL: %0d+%0d+%0d | exp=%0d got=%0d",a,b,cin,expected,{cout,sum}); failed=failed+1; end
        // 128 + 127 = 255
        a=8'd128; b=8'd127; cin=0; #10; expected=9'd255;
        if({cout,sum}!==expected) begin $display("FAIL: %0d+%0d+%0d | exp=%0d got=%0d",a,b,cin,expected,{cout,sum}); failed=failed+1; end
        // 200 + 100 + cin=1 = 301
        a=8'd200; b=8'd100; cin=1; #10; expected=9'd301;
        if({cout,sum}!==expected) begin $display("FAIL: %0d+%0d+%0d | exp=%0d got=%0d",a,b,cin,expected,{cout,sum}); failed=failed+1; end
        if(failed == 0)
            $display("adder8 passed!");
        else
            $display("adder8 FAILED: %0d errors", failed);
        $display("Simulation complete.");
        $finish;
    end
endmodule
