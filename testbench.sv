`timescale 1ns/1ps

module testbench;

reg clk;
reg reset;

reg enable;
reg snooze;

wire [5:0] seconds;
wire [5:0] minutes;

wire [5:0] sw_seconds;

wire clk_1hz;

reg [5:0] alarm_minute;

wire alarm;
wire [1:0] state;



// ======================================
// DIGITAL CLOCK
// ======================================
digital_clock dc(

    .clk(clk),
    .reset(reset),

    .seconds(seconds),
    .minutes(minutes)

);

assign clk_1hz = dc.clk_1hz;



// ======================================
// STOPWATCH
// ======================================
stopwatch sw(

    .clk_1hz(clk_1hz),
    .reset(reset),
    .enable(enable),

    .sw_seconds(sw_seconds)

);



// ======================================
// ALARM
// ======================================
alarm_system alarm_unit(

    .clk_1hz(clk_1hz),
    .reset(reset),

    .snooze(snooze),

    .minutes(minutes),
    .seconds(seconds),

    .alarm_minute(alarm_minute),

    .alarm(alarm),

    .state(state)

);



// ======================================
// CLOCK
// ======================================
always #5 clk = ~clk;



// ======================================
// TEST
// ======================================
initial begin

    $dumpfile("dump.vcd");
    $dumpvars(0,testbench);

    clk = 0;
    reset = 1;

    enable = 0;
    snooze = 0;

    alarm_minute = 1;

    #10 reset = 0;

    // START STOPWATCH
    #20 enable = 1;

    // RUN
    #800;

    // STOP STOPWATCH
    enable = 0;

    #300;

    // START AGAIN
    enable = 1;

    // WAIT FOR ALARM
    // WAIT UNTIL ALARM STARTS
    #1200;

// PRESS SNOOZE
    snooze = 1;

    #40;

    snooze = 0;

    // WAIT FOR RE-RING
    #2500;

    $finish;

end



initial begin

    $monitor(
    "TIME=%0t | MIN=%0d SEC=%0d | SW=%0d | ALARM=%0b | SNOOZE=%0b | STATE=%0d",
    $time,
    minutes,
    seconds,
    sw_seconds,
    alarm,
    snooze,
    state
    );

end
endmodule