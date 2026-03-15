
module binary_to_bcd_converter (
    input [4:0] binary_input,
    output reg [7:0] bcd_output
);
    integer i;
    reg [3:0] tens;
    reg [3:0] ones;
    reg [4:0] temp;

    always @* begin
        // Initialize BCD output to zero
        bcd_output = 8'b0;
        tens = 4'b0;
        ones = 4'b0;
        temp = binary_input;

        // Convert binary to BCD using the Double Dabble algorithm
        for (i = 0; i < 5; i = i + 1) begin
            if (tens >= 4'd5) begin
                tens = tens + 4'd3;
            end
            if (ones >= 4'd5) begin
                ones = ones + 4'd3;
            end

            // Shift left
            tens = {tens[2:0], ones[3]};
            ones = {ones[2:0], temp[4]};
            temp = temp << 1;
        end

        // Assign the BCD output
        bcd_output = {tens, ones};
    end
endmodule
