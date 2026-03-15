module tb_binary_to_bcd_converter;
    // Declare signals
    reg [4:0] binary_input;
    wire [7:0] bcd_output;
    integer passed_tests, failed_tests;

    // Instantiate the module under test
    binary_to_bcd_converter uut (
        .binary_input(binary_input),
        .bcd_output(bcd_output)
    );

    initial begin
        passed_tests = 0;
        failed_tests = 0;

        // Test case 1: Lower boundary value
        binary_input = 5'b00000;
        #10 $display("Test 1: binary_input = %b, bcd_output = %b", binary_input, bcd_output);
        if (bcd_output === 8'd0) begin
            $display("✓ Test 1 Passed");
            passed_tests = passed_tests + 1;
        end else begin
            $display("✗ Test 1 Failed: Expected 00000000, Got %b", bcd_output);
            failed_tests = failed_tests + 1;
        end

        // Test case 2: Upper boundary value
        binary_input = 5'b11111;
        #10 $display("Test 2: binary_input = %b, bcd_output = %b", binary_input, bcd_output);
        if (bcd_output === 8'd49) begin
            $display("✓ Test 2 Passed");
            passed_tests = passed_tests + 1;
        end else begin
            $display("✗ Test 2 Failed: Expected 00110001, Got %b", bcd_output);
            failed_tests = failed_tests + 1;
        end

        // Test case 3: Typical value
        binary_input = 5'b10101;
        #10 $display("Test 3: binary_input = %b, bcd_output = %b", binary_input, bcd_output);
        if (bcd_output === 8'd33) begin
            $display("✓ Test 3 Passed");
            passed_tests = passed_tests + 1;
        end else begin
            $display("✗ Test 3 Failed: Expected 00100001, Got %b", bcd_output);
            failed_tests = failed_tests + 1;
        end

        // Test case 4: Edge case (minimum non-zero input)
        binary_input = 5'b00001;
        #10 $display("Test 4: binary_input = %b, bcd_output = %b", binary_input, bcd_output);
        if (bcd_output === 8'd1) begin
            $display("✓ Test 4 Passed");
            passed_tests = passed_tests + 1;
        end else begin
            $display("✗ Test 4 Failed: Expected 00000001, Got %b", bcd_output);
            failed_tests = failed_tests + 1;
        end

        // Test case 5: Edge case (maximum input for one digit BCD)
        binary_input = 5'b01001; // 9 in binary
        #10 $display("Test 5: binary_input = %b, bcd_output = %b", binary_input, bcd_output);
        if (bcd_output === 8'd9) begin
            $display("✓ Test 5 Passed");
            passed_tests = passed_tests + 1;
        end else begin
            $display("✗ Test 5 Failed: Expected 00001001, Got %b", bcd_output);
            failed_tests = failed_tests + 1;
        end

        // Test case 6: Random value
        binary_input = 5'b11010;
        #10 $display("Test 6: binary_input = %b, bcd_output = %b", binary_input, bcd_output);
        if (bcd_output === 8'd38) begin
            $display("✓ Test 6 Passed");
            passed_tests = passed_tests + 1;
        end else begin
            $display("✗ Test 6 Failed: Expected 00100110, Got %b", bcd_output);
            failed_tests = failed_tests + 1;
        end

        // Test case 7: Random value
        binary_input = 5'b00111;
        #10 $display("Test 7: binary_input = %b, bcd_output = %b", binary_input, bcd_output);
        if (bcd_output === 8'd7) begin
            $display("✓ Test 7 Passed");
            passed_tests = passed_tests + 1;
        end else begin
            $display("✗ Test 7 Failed: Expected 00000111, Got %b", bcd_output);
            failed_tests = failed_tests + 1;
        end

        // Test case 8: Edge case (just before max 5-bit value)
        binary_input = 5'b11110;
        #10 $display("Test 8: binary_input = %b, bcd_output = %b", binary_input, bcd_output);
        if (bcd_output === 8'd48) begin
            $display("✓ Test 8 Passed");
            passed_tests = passed_tests + 1;
        end else begin
            $display("✗ Test 8 Failed: Expected 00110000, Got %b", bcd_output);
            failed_tests = failed_tests + 1;
        end

        // Test case 9: Edge case (just after zero)
        binary_input = 5'b00010;
        #10 $display("Test 9: binary_input = %b, bcd_output = %b", binary_input, bcd_output);
        if (bcd_output === 8'd2) begin
            $display("✓ Test 9 Passed");
            passed_tests = passed_tests + 1;
        end else begin
            $display("✗ Test 9 Failed: Expected 00000010, Got %b", bcd_output);
            failed_tests = failed_tests + 1;
        end

        // Test case 10: Typical value
        binary_input = 5'b01100;
        #10 $display("Test 10: binary_input = %b, bcd_output = %b", binary_input, bcd_output);
        if (bcd_output === 8'd18) begin
            $display("✓ Test 10 Passed");
            passed_tests = passed_tests + 1;
        end else begin
            $display("✗ Test 10 Failed: Expected 00011000, Got %b", bcd_output);
            failed_tests = failed_tests + 1;
        end

        // Test summary
        $display("Test Summary: Total = %0d, Passed = %0d, Failed = %0d", 10, passed_tests, failed_tests);

        // End of simulation
        $finish;
    end
endmodule