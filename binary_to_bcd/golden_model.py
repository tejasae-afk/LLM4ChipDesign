def binary_to_bcd_converter_golden(binary_input):
    # Initialize BCD output to zero
    bcd_output = 0

    # Extract the binary input value
    binary_value = binary_input & 0b11111  # Ensure it's 5-bits

    # Initialize tens and ones
    tens = 0
    ones = 0

    # Convert binary to BCD
    for i in range(5):
        # Shift left by 1
        tens <<= 1
        ones <<= 1
        ones |= (binary_value >> (4 - i)) & 1

        # Adjust for BCD
        if ones >= 10:
            ones -= 10
            tens += 1

    # Combine tens and ones into BCD output
    bcd_output = (tens << 4) | ones

    return {'bcd_output': bcd_output}