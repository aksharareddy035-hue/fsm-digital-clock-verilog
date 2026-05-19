`timescale 1ns/1ps

// =====================================================
// CLOCK DIVIDER
// =====================================================
module clock_divider(
    input clk,
    input reset,
    output reg clk_1hz
);

reg [26:0] count;

always @(posedge clk or posedge reset) begin

    if(reset) begin
        count <= 0;
        clk_1hz <= 0;
    end

    else begin

        if(count == 1) begin
            clk_1hz <= ~clk_1hz;
            count <= 0;
        end

        else
            count <= count + 1;

    end

end

endmodule



// =====================================================
// DIGITAL CLOCK
// =====================================================
module digital_clock(

    input clk,
    input reset,

    output reg [5:0] seconds,
    output reg [5:0] minutes

);

wire clk_1hz;

clock_divider cd(clk, reset, clk_1hz);

always @(posedge clk_1hz or posedge reset) begin

    if(reset) begin
        seconds <= 0;
        minutes <= 0;
    end

    else begin

        if(seconds == 5) begin

            seconds <= 0;

            if(minutes == 5)
                minutes <= 0;

            else
                minutes <= minutes + 1;

        end

        else
            seconds <= seconds + 1;

    end

end

endmodule




// =====================================================
// STOPWATCH
// =====================================================
module stopwatch(

    input clk_1hz,
    input reset,
    input enable,

    output reg [5:0] sw_seconds

);

always @(posedge clk_1hz or posedge reset) begin

    if(reset)
        sw_seconds <= 0;

    else if(enable) begin

        if(sw_seconds == 5)
            sw_seconds <= 0;

        else
            sw_seconds <= sw_seconds + 1;

    end

end

endmodule




// =====================================================
// ALARM + SNOOZE FSM
// =====================================================
module alarm_system(

    input clk_1hz,
    input reset,

    input snooze,

    input [5:0] minutes,
    input [5:0] seconds,

    input [5:0] alarm_minute,

    output reg alarm,

    output reg [1:0] state

);

parameter IDLE    = 0;
parameter RINGING = 1;
parameter SNOOZED = 2;

reg [5:0] snooze_target;

always @(posedge clk_1hz or posedge reset) begin

    if(reset) begin

        state <= IDLE;
        alarm <= 0;
        snooze_target <= 0;

    end

    else begin

        case(state)

            // =================================
            // IDLE
            // =================================
            IDLE: begin

                alarm <= 0;

                if((minutes == alarm_minute) &&
                   (seconds == 0)) begin

                    state <= RINGING;

                end

            end



            // =================================
            // RINGING
            // =================================
            RINGING: begin

                alarm <= 1;

                if(snooze) begin

                    alarm <= 0;

                    snooze_target <= minutes + 2;

                    state <= SNOOZED;

                end

            end



            // =================================
            // SNOOZED
            // =================================
            SNOOZED: begin

                alarm <= 0;

                if((minutes == snooze_target) &&
                   (seconds == 0)) begin

                    state <= RINGING;

                end

            end

        endcase

    end

end

endmodule