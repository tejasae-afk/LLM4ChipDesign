module tb_binary_to_bcd_converter;
    // Declare signals
    reg [4:0] binary_input;
    wire [7:0] bcd_output;

    // Instantiate the module under test
    binary_to_bcd_converter uut (
        .binary_input(binary_input),
        .bcd_output(bcd_output)
    );

    initial begin
        // Test case 1: Lower boundary value
        binary_input = 5'b00000;
        #10 $display("Test 1: binary_input = %b, bcd_output = %b", binary_input, bcd_output);

        // Test case 2: Upper boundary value
        binary_input = 5'b11111;
        #10 $display("Test 2: binary_input = %b, bcd_output = %b", binary_input, bcd_output);

        // Test case 3: Typical value
        binary_input = 5'b10101;
        #10 $display("Test 3: binary_input = %b, bcd_output = %b", binary_input, bcd_output);

        // Test case 4: Edge case (minimum non-zero input)
        binary_input = 5'b00001;
        #10 $display("Test 4: binary_input = %b, bcd_output = %b", binary_input, bcd_output);

        // Test case 5: Edge case (maximum input for one digit BCD)
        binary_input = 5'b01001; // 9 in binary
        #10 $display("Test 5: binary_input = %b, bcd_output = %b", binary_input, bcd_output);

        // Test case 6: Random value
        binary_input = 5'b11010;
        #10 $display("Test 6: binary_input = %b, bcd_output = %b", binary_input, bcd_output);

        // Test case 7: Random value
        binary_input = 5'b00111;
        #10 $display("Test 7: binary_input = %b, bcd_output = %b", binary_input, bcd_output);

        // Test case 8: Edge case (just before max 5-bit value)
        binary_input = 5'b11110;
        #10 $display("Test 8: binary_input = %b, bcd_output = %b", binary_input, bcd_output);

        // Test case 9: Edge case (just after zero)
        binary_input = 5'b00010;
        #10 $display("Test 9: binary_input = %b, bcd_output = %b", binary_input, bcd_output);

        // Test case 10: Typical value
        binary_input = 5'b01100;
        #10 $display("Test 10: binary_input = %b, bcd_output = %b", binary_input, bcd_output);

        // End of simulation
        $finish;
    end
endmodule