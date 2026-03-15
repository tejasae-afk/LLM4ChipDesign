`timescale 1ns / 1ps

module testbench;
    // Declare signals
    reg [3:0] a;
    reg [3:0] b;
    wire [3:0] sum;
    wire carry;

    // Instantiate the adder module
    adder4bit uut (
        .a(a),
        .b(b),
        .sum(sum),
        .carry(carry)
    );

    integer passed_tests = 0;
    integer failed_tests = 0;

    initial begin
        // Test pattern 1: All zeros
        a = 4'b0000; b = 4'b0000;
        #10 $display("Test 1: a=%b b=%b", a, b);
        #10;
        if (sum === 4'b0000 && carry === 1'b0) begin
            $display("Sum: %b ✓, Carry: %b ✓", sum, carry);
            passed_tests = passed_tests + 2;
        end else begin
            $display("Sum: %b (Expected: 0000) ✗, Carry: %b (Expected: 0) ✗", sum, carry);
            failed_tests = failed_tests + 2;
        end

        // Test pattern 2: All ones (corner case)
        a = 4'b1111; b = 4'b1111;
        #10 $display("Test 2: a=%b b=%b", a, b);
        #10;
        if (sum === 4'b1110 && carry === 1'b1) begin
            $display("Sum: %b ✓, Carry: %b ✓", sum, carry);
            passed_tests = passed_tests + 2;
        end else begin
            $display("Sum: %b (Expected: 1110) ✗, Carry: %b (Expected: 1) ✗", sum, carry);
            failed_tests = failed_tests + 2;
        end

        // Test pattern 3: Maximum input for one operand, zero for the other (boundary)
        a = 4'b1111; b = 4'b0000;
        #10 $display("Test 3: a=%b b=%b", a, b);
        #10;
        if (sum === 4'b1111 && carry === 1'b0) begin
            $display("Sum: %b ✓, Carry: %b ✓", sum, carry);
            passed_tests = passed_tests + 2;
        end else begin
            $display("Sum: %b (Expected: 1111) ✗, Carry: %b (Expected: 0) ✗", sum, carry);
            failed_tests = failed_tests + 2;
        end

        // Test pattern 4: Zero for one operand, maximum for the other (boundary)
        a = 4'b0000; b = 4'b1111;
        #10 $display("Test 4: a=%b b=%b", a, b);
        #10;
        if (sum === 4'b1111 && carry === 1'b0) begin
            $display("Sum: %b ✓, Carry: %b ✓", sum, carry);
            passed_tests = passed_tests + 2;
        end else begin
            $display("Sum: %b (Expected: 1111) ✗, Carry: %b (Expected: 0) ✗", sum, carry);
            failed_tests = failed_tests + 2;
        end

        // Test pattern 5: One operand is half of the max, other is zero (typical use)
        a = 4'b1000; b = 4'b0000;
        #10 $display("Test 5: a=%b b=%b", a, b);
        #10;
        if (sum === 4'b1000 && carry === 1'b0) begin
            $display("Sum: %b ✓, Carry: %b ✓", sum, carry);
            passed_tests = passed_tests + 2;
        end else begin
            $display("Sum: %b (Expected: 1000) ✗, Carry: %b (Expected: 0) ✗", sum, carry);
            failed_tests = failed_tests + 2;
        end

        // Test pattern 6: One operand is zero, other is half of the max (typical use)
        a = 4'b0000; b = 4'b1000;
        #10 $display("Test 6: a=%b b=%b", a, b);
        #10;
        if (sum === 4'b1000 && carry === 1'b0) begin
            $display("Sum: %b ✓, Carry: %b ✓", sum, carry);
            passed_tests = passed_tests + 2;
        end else begin
            $display("Sum: %b (Expected: 1000) ✗, Carry: %b (Expected: 0) ✗", sum, carry);
            failed_tests = failed_tests + 2;
        end

        // Test pattern 7: Addition results in no carry (edge case)
        a = 4'b0101; b = 4'b0010;
        #10 $display("Test 7: a=%b b=%b", a, b);
        #10;
        if (sum === 4'b0111 && carry === 1'b0) begin
            $display("Sum: %b ✓, Carry: %b ✓", sum, carry);
            passed_tests = passed_tests + 2;
        end else begin
            $display("Sum: %b (Expected: 0111) ✗, Carry: %b (Expected: 0) ✗", sum, carry);
            failed_tests = failed_tests + 2;
        end

        // Test pattern 8: Addition results in carry (edge case)
        a = 4'b1001; b = 4'b1001;
        #10 $display("Test 8: a=%b b=%b", a, b);
        #10;
        if (sum === 4'b0010 && carry === 1'b1) begin
            $display("Sum: %b ✓, Carry: %b ✓", sum, carry);
            passed_tests = passed_tests + 2;
        end else begin
            $display("Sum: %b (Expected: 0010) ✗, Carry: %b (Expected: 1) ✗", sum, carry);
            failed_tests = failed_tests + 2;
        end

        // Test pattern 9: Random value test
        a = 4'b0110; b = 4'b1011;
        #10 $display("Test 9: a=%b b=%b", a, b);
        #10;
        if (sum === 4'b0001 && carry === 1'b1) begin
            $display("Sum: %b ✓, Carry: %b ✓", sum, carry);
            passed_tests = passed_tests + 2;
        end else begin
            $display("Sum: %b (Expected: 0001) ✗, Carry: %b (Expected: 1) ✗", sum, carry);
            failed_tests = failed_tests + 2;
        end

        // Test pattern 10: Random value test
        a = 4'b0011; b = 4'b0101;
        #10 $display("Test 10: a=%b b=%b", a, b);
        #10;
        if (sum === 4'b1000 && carry === 1'b0) begin
            $display("Sum: %b ✓, Carry: %b ✓", sum, carry);
            passed_tests = passed_tests + 2;
        end else begin
            $display("Sum: %b (Expected: 1000) ✗, Carry: %b (Expected: 0) ✗", sum, carry);
            failed_tests = failed_tests + 2;
        end

        // Test pattern 11: Random value test
        a = 4'b1100; b = 4'b0011;
        #10 $display("Test 11: a=%b b=%b", a, b);
        #10;
        if (sum === 4'b1111 && carry === 1'b0) begin
            $display("Sum: %b ✓, Carry: %b ✓", sum, carry);
            passed_tests = passed_tests + 2;
        end else begin
            $display("Sum: %b (Expected: 1111) ✗, Carry: %b (Expected: 0) ✗", sum, carry);
            failed_tests = failed_tests + 2;
        end

        // Test pattern 12: Mid-range values with no carry
        a = 4'b0111; b = 4'b0100;
        #10 $display("Test 12: a=%b b=%b", a, b);
        #10;
        if (sum === 4'b1011 && carry === 1'b0) begin
            $display("Sum: %b ✓, Carry: %b ✓", sum, carry);
            passed_tests = passed_tests + 2;
        end else begin
            $display("Sum: %b (Expected: 1011) ✗, Carry: %b (Expected: 0) ✗", sum, carry);
            failed_tests = failed_tests + 2;
        end

        // Test pattern 13: Mid-range values with carry
        a = 4'b0111; b = 4'b0111;
        #10 $display("Test 13: a=%b b=%b", a, b);
        #10;
        if (sum === 4'b1110 && carry === 1'b0) begin
            $display("Sum: %b ✓, Carry: %b ✓", sum, carry);
            passed_tests = passed_tests + 2;
        end else begin
            $display("Sum: %b (Expected: 1110) ✗, Carry: %b (Expected: 0) ✗", sum, carry);
            failed_tests = failed_tests + 2;
        end

        // Test pattern 14: Alternating bits
        a = 4'b1010; b = 4'b0101;
        #10 $display("Test 14: a=%b b=%b", a, b);
        #10;
        if (sum === 4'b1111 && carry === 1'b0) begin
            $display("Sum: %b ✓, Carry: %b ✓", sum, carry);
            passed_tests = passed_tests + 2;
        end else begin
            $display("Sum: %b (Expected: 1111) ✗, Carry: %b (Expected: 0) ✗", sum, carry);
            failed_tests = failed_tests + 2;
        end

        // Test pattern 15: One less than maximum for both
        a = 4'b1110; b = 4'b1110;
        #10 $display("Test 15: a=%b b=%b", a, b);
        #10;
        if (sum === 4'b1100 && carry === 1'b1) begin
            $display("Sum: %b ✓, Carry: %b ✓", sum, carry);
            passed_tests = passed_tests + 2;
        end else begin
            $display("Sum: %b (Expected: 1100) ✗, Carry: %b (Expected: 1) ✗", sum, carry);
            failed_tests = failed_tests + 2;
        end

        // Test summary
        $display("Total tests run: %d", passed_tests + failed_tests);
        $display("Number passed: %d", passed_tests);
        $display("Number failed: %d", failed_tests);

        // Finish simulation
        $finish;
    end
endmodule