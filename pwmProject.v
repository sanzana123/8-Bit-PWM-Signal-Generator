module pwmProject (
    input wire clk,
    input wire reset,
    input wire [7:0] duty_cycle, // 0 to 255
    output reg pwm_out
);

    reg [7:0] counter;

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            counter <= 0;
            pwm_out <= 0;
        end else begin
            counter <= counter + 1;
            if (counter < duty_cycle)
                pwm_out <= 1;
            else
                pwm_out <= 0;
        end
    end
endmodule


`timescale 1ns / 1ps

module pwm_tb;

    // Testbench signals
    reg clk;
    reg reset;
    reg [7:0] duty_cycle;
    wire pwm_out;

    // Instantiate the DUT (Device Under Test)
    pwm_generator uut (
        .clk(clk),
        .reset(reset),
        .duty_cycle(duty_cycle),
        .pwm_out(pwm_out)
    );

    // Generate a clock: toggle every 5 ns (100 MHz)
    always #5 clk = ~clk;

    initial begin
        // Dump waveform
        $dumpfile("pwm.vcd");
        $dumpvars(0, pwm_tb);

        // Initial values
        clk = 0;
        reset = 1;
        duty_cycle = 0;

        // Hold reset for a few cycles
        #20;
        reset = 0;

        // Test 25% duty cycle
        duty_cycle = 64;  // 64/256 = 25%
        #2000;            // Let it run for some time

        // Test 50% duty cycle
        duty_cycle = 128; // 128/256 = 50%
        #2000;

        // Test 75% duty cycle
        duty_cycle = 192; // 192/256 = 75%
        #2000;

        // Test 100% duty cycle
        duty_cycle = 255;
        #1000;

        // Test 0% duty cycle
        duty_cycle = 0;
        #1000;

        $finish;
    end

endmodule
