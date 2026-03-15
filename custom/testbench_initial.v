module tb_priority_enc4;
    reg [3:0] in;
    wire [1:0] out;
    wire valid;

    // Instantiate the module under test
    priority_enc4 uut (
        .in(in),
        .out(out),
        .valid(valid)
    );

    initial begin
        // Test case 1: in=0000
        in = 4'b0000;
        #10;
        $display("Test 1: in=%b", in);

        // Test case 2: in=0001
        in = 4'b0001;
        #10;
        $display("Test 2: in=%b", in);

        // Test case 3: in=0010
        in = 4'b0010;
        #10;
        $display("Test 3: in=%b", in);

        // Test case 4: in=0011
        in = 4'b0011;
        #10;
        $display("Test 4: in=%b", in);

        // Test case 5: in=0100
        in = 4'b0100;
        #10;
        $display("Test 5: in=%b", in);

        // Test case 6: in=0101
        in = 4'b0101;
        #10;
        $display("Test 6: in=%b", in);

        // Test case 7: in=0110
        in = 4'b0110;
        #10;
        $display("Test 7: in=%b", in);

        // Test case 8: in=0111
        in = 4'b0111;
        #10;
        $display("Test 8: in=%b", in);

        // Test case 9: in=1000
        in = 4'b1000;
        #10;
        $display("Test 9: in=%b", in);

        // Test case 10: in=1001
        in = 4'b1001;
        #10;
        $display("Test 10: in=%b", in);

        // Test case 11: in=1010
        in = 4'b1010;
        #10;
        $display("Test 11: in=%b", in);

        // Test case 12: in=1011
        in = 4'b1011;
        #10;
        $display("Test 12: in=%b", in);

        // Test case 13: in=1100
        in = 4'b1100;
        #10;
        $display("Test 13: in=%b", in);

        // Test case 14: in=1101
        in = 4'b1101;
        #10;
        $display("Test 14: in=%b", in);

        // Test case 15: in=1110
        in = 4'b1110;
        #10;
        $display("Test 15: in=%b", in);

        // Test case 16: in=1111
        in = 4'b1111;
        #10;
        $display("Test 16: in=%b", in);

        // Test case 17: in=0000
        in = 4'b0000;
        #10;
        $display("Test 17: in=%b", in);

        // Test case 18: in=0111
        in = 4'b0111;
        #10;
        $display("Test 18: in=%b", in);

        // Test case 19: in=1010
        in = 4'b1010;
        #10;
        $display("Test 19: in=%b", in);

        // Test case 20: in=1111
        in = 4'b1111;
        #10;
        $display("Test 20: in=%b", in);

        $finish;
    end
endmodule
