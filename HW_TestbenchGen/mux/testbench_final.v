module tb_mux2to1;
    // Declare input signals as reg and output signal as wire
    reg a;
    reg b;
    reg sel;
    wire y;

    // Instantiate the module under test
    mux2to1 uut (
        .a(a),
        .b(b),
        .sel(sel),
        .y(y)
    );

    initial begin
        integer passed_tests = 0;
        integer failed_tests = 0;

        // Test case 1: a=0, b=0, sel=0
        a = 0; b = 0; sel = 0;
        #10;
        $display("Test 1: a=%b, b=%b, sel=%b, y=%b", a, b, sel, y);
        #10;
        if (y === 0) begin
            $display("✓ Test 1 Passed: y=%b (expected 0)", y);
            passed_tests = passed_tests + 1;
        end else begin
            $display("✗ Test 1 Failed: y=%b (expected 0)", y);
            failed_tests = failed_tests + 1;
        end

        // Test case 2: a=0, b=0, sel=1
        a = 0; b = 0; sel = 1;
        #10;
        $display("Test 2: a=%b, b=%b, sel=%b, y=%b", a, b, sel, y);
        #10;
        if (y === 0) begin
            $display("✓ Test 2 Passed: y=%b (expected 0)", y);
            passed_tests = passed_tests + 1;
        end else begin
            $display("✗ Test 2 Failed: y=%b (expected 0)", y);
            failed_tests = failed_tests + 1;
        end

        // Test case 3: a=0, b=1, sel=0
        a = 0; b = 1; sel = 0;
        #10;
        $display("Test 3: a=%b, b=%b, sel=%b, y=%b", a, b, sel, y);
        #10;
        if (y === 0) begin
            $display("✓ Test 3 Passed: y=%b (expected 0)", y);
            passed_tests = passed_tests + 1;
        end else begin
            $display("✗ Test 3 Failed: y=%b (expected 0)", y);
            failed_tests = failed_tests + 1;
        end

        // Test case 4: a=0, b=1, sel=1
        a = 0; b = 1; sel = 1;
        #10;
        $display("Test 4: a=%b, b=%b, sel=%b, y=%b", a, b, sel, y);
        #10;
        if (y === 1) begin
            $display("✓ Test 4 Passed: y=%b (expected 1)", y);
            passed_tests = passed_tests + 1;
        end else begin
            $display("✗ Test 4 Failed: y=%b (expected 1)", y);
            failed_tests = failed_tests + 1;
        end

        // Test case 5: a=1, b=0, sel=0
        a = 1; b = 0; sel = 0;
        #10;
        $display("Test 5: a=%b, b=%b, sel=%b, y=%b", a, b, sel, y);
        #10;
        if (y === 1) begin
            $display("✓ Test 5 Passed: y=%b (expected 1)", y);
            passed_tests = passed_tests + 1;
        end else begin
            $display("✗ Test 5 Failed: y=%b (expected 1)", y);
            failed_tests = failed_tests + 1;
        end

        // Test case 6: a=1, b=0, sel=1
        a = 1; b = 0; sel = 1;
        #10;
        $display("Test 6: a=%b, b=%b, sel=%b, y=%b", a, b, sel, y);
        #10;
        if (y === 0) begin
            $display("✓ Test 6 Passed: y=%b (expected 0)", y);
            passed_tests = passed_tests + 1;
        end else begin
            $display("✗ Test 6 Failed: y=%b (expected 0)", y);
            failed_tests = failed_tests + 1;
        end

        // Test case 7: a=1, b=1, sel=0
        a = 1; b = 1; sel = 0;
        #10;
        $display("Test 7: a=%b, b=%b, sel=%b, y=%b", a, b, sel, y);
        #10;
        if (y === 1) begin
            $display("✓ Test 7 Passed: y=%b (expected 1)", y);
            passed_tests = passed_tests + 1;
        end else begin
            $display("✗ Test 7 Failed: y=%b (expected 1)", y);
            failed_tests = failed_tests + 1;
        end

        // Test case 8: a=1, b=1, sel=1
        a = 1; b = 1; sel = 1;
        #10;
        $display("Test 8: a=%b, b=%b, sel=%b, y=%b", a, b, sel, y);
        #10;
        if (y === 1) begin
            $display("✓ Test 8 Passed: y=%b (expected 1)", y);
            passed_tests = passed_tests + 1;
        end else begin
            $display("✗ Test 8 Failed: y=%b (expected 1)", y);
            failed_tests = failed_tests + 1;
        end

        // Test summary
        $display("Test Summary: Total Tests = %0d, Passed = %0d, Failed = %0d", 
                 passed_tests + failed_tests, passed_tests, failed_tests);

        $finish;
    end
endmodule