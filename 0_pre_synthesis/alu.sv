// ALU Module
module alu (
    input wire clk,                    // Clock
    input wire rst_n,                  // Active low reset
    input wire [7:0] a,                // Operand A
    input wire [7:0] b,                // Operand B
    input wire [3:0] opcode,           // Operation code
    output reg [7:0] result,           // Result
    output reg zero_flag,              // Zero flag
    output reg overflow_flag           // Overflow flag
);

// Operation codes
localparam  ADD = 4'b0000,
            SUB = 4'b0001,
            AND = 4'b0010,
            OR  = 4'b0011,
            XOR = 4'b0100,
            SHL = 4'b0101,
            SHR = 4'b0110,
            CMP = 4'b0111;

// Temporary variables
reg [8:0] temp_result;
reg [7:0] next_result;
reg next_zero_flag;
reg next_overflow_flag;

// Combinational logic for next state
always @(*) begin
    case (opcode)
        ADD: begin
            temp_result = {1'b0, a} + {1'b0, b};
            next_result = temp_result[7:0];
            next_overflow_flag = temp_result[8];
        end
        
        SUB: begin
            temp_result = {1'b0, a} - {1'b0, b};
            next_result = temp_result[7:0];
            next_overflow_flag = temp_result[8];
        end
        
        AND: begin
            temp_result = 9'b0;
            next_result = a & b;
            next_overflow_flag = 1'b0;
        end
        
        OR: begin
            temp_result = 9'b0;
            next_result = a | b;
            next_overflow_flag = 1'b0;
        end
        
        XOR: begin
            temp_result = 9'b0;
            next_result = a ^ b;
            next_overflow_flag = 1'b0;
        end
        
        SHL: begin
            temp_result = 9'b0;
            next_result = a << b[2:0];
            next_overflow_flag = 1'b0;
        end
        
        SHR: begin
            temp_result = 9'b0;
            next_result = a >> b[2:0];
            next_overflow_flag = 1'b0;
        end
        
        CMP: begin
            temp_result = 9'b0;
            next_result = (a > b) ? 8'd1 : (a == b) ? 8'd0 : 8'd2;
            next_overflow_flag = 1'b0;
        end
        
        default: begin
            temp_result = 9'b0;
            next_result = 8'b0;
            next_overflow_flag = 1'b0;
        end
    endcase
    
    // Update zero flag
    next_zero_flag = (next_result == 8'b0);
end

// Sequential logic with synchronous reset
always @(posedge clk) begin
    if (!rst_n) begin
        result <= 8'b0;
        zero_flag <= 1'b0;
        overflow_flag <= 1'b0;
    end else begin
        result <= next_result;
        zero_flag <= next_zero_flag;
        overflow_flag <= next_overflow_flag;
    end
end

endmodule