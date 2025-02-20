// ALU Testbench with labeled test cases
module alu_tb;

// Test signals
reg clk;
reg rst_n;
reg [7:0] a;
reg [7:0] b;
reg [3:0] opcode;
wire [7:0] result;
wire zero_flag;
wire overflow_flag;

// Test case label signal
reg [8*20:1] test_case_label;

// Instantiate ALU
alu dut (
    .clk(clk),
    .rst_n(rst_n),
    .a(a),
    .b(b),
    .opcode(opcode),
    .result(result),
    .zero_flag(zero_flag),
    .overflow_flag(overflow_flag)
);

// Clock generation
initial begin
    clk = 0;
    forever #5 clk = ~clk;
end

// Test stimulus
initial begin
    // Initialize signals
    test_case_label = "RESET";
    rst_n = 0;
    a = 0;
    b = 0;
    opcode = 0;
    
    // Wait 100 ns for global reset
    #100;
    rst_n = 1;
    
    // Test case 1: Addition
    test_case_label = "ADD_NORMAL";
    a = 8'h35;
    b = 8'h42;
    opcode = 4'b0000;  // ADD
    #20;
    
    // Test case 2: Addition with overflow
    test_case_label = "ADD_OVERFLOW";
    a = 8'hFF;
    b = 8'h02;
    opcode = 4'b0000;  // ADD
    #20;
    
    // Test case 3: Subtraction
    test_case_label = "SUBTRACT";
    a = 8'h50;
    b = 8'h20;
    opcode = 4'b0001;  // SUB
    #20;
    
    // Test case 4: AND operation
    test_case_label = "AND_OP";
    a = 8'hF0;
    b = 8'h0F;
    opcode = 4'b0010;  // AND
    #20;
    
    // Test case 5: OR operation
    test_case_label = "OR_OP";
    a = 8'hF0;
    b = 8'h0F;
    opcode = 4'b0011;  // OR
    #20;
    
    // Test case 6: XOR operation
    test_case_label = "XOR_OP";
    a = 8'hFF;
    b = 8'h0F;
    opcode = 4'b0100;  // XOR
    #20;
    
    // Test case 7: Shift left
    test_case_label = "SHIFT_LEFT";
    a = 8'h01;
    b = 8'h02;
    opcode = 4'b0101;  // SHL
    #20;
    
    // Test case 8: Shift right
    test_case_label = "SHIFT_RIGHT";
    a = 8'h80;
    b = 8'h02;
    opcode = 4'b0110;  // SHR
    #20;
    
    // Test case 9: Compare (a > b)
    test_case_label = "COMPARE_GREATER";
    a = 8'h80;
    b = 8'h20;
    opcode = 4'b0111;  // CMP
    #20;
    
    // Test case 10: Compare (a == b)
    test_case_label = "COMPARE_EQUAL";
    a = 8'h20;
    b = 8'h20;
    opcode = 4'b0111;  // CMP
    #20;
    
    // Test case 11: Compare (a < b)
    test_case_label = "COMPARE_LESS";
    a = 8'h10;
    b = 8'h20;
    opcode = 4'b0111;  // CMP
    #20;
    
    // End simulation
    test_case_label = "END_SIM";
    #20;
    $finish;
end

// Monitor changes
initial begin
    $monitor("Time=%0t TestCase=%s rst_n=%b a=%h b=%h opcode=%b result=%h zero_flag=%b overflow_flag=%b",
             $time, test_case_label, rst_n, a, b, opcode, result, zero_flag, overflow_flag);
end

endmodule