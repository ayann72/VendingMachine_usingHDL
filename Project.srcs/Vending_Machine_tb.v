`timescale 1ns / 1ps

module Vending_Machine_tb;
    // Inputs
    reg clk;
    reg reset;
    reg [1:0] coin;
    
    // Outputs
    wire Z;
    wire change_given;
    
    // Instantiate the Unit Under Test (UUT)
    Vending_Machine uut (
        .coin(coin),
        .clk(clk),
        .reset(reset),
        .Z(Z),
        .change_given(change_given)
    );
    
    // Define clock period
    parameter CLK_PERIOD = 10;
    
    // Generate clock
    always #(CLK_PERIOD/2) clk = ~clk;
    
    // Define coin values for readability
    parameter ten = 2'b00, twenty = 2'b01, fifty = 2'b10;
    
    // Test sequence
    initial begin
        // Initialize Inputs
        clk = 0;
        reset = 1;
        coin = 0;
        
        // Apply reset
        #(CLK_PERIOD*2) reset = 0;
        
        // Test case 1: Insert 10+10+10+10 coins (40 cents)
        #(CLK_PERIOD) coin = ten;
        #(CLK_PERIOD) coin = ten;
        #(CLK_PERIOD) coin = ten;
        #(CLK_PERIOD) coin = ten;
        #(CLK_PERIOD) coin = 0; // No coin
        
        // Test case 2: Insert 20+20 coins (40 cents)
        #(CLK_PERIOD*2) coin = twenty;
        #(CLK_PERIOD) coin = twenty;
        #(CLK_PERIOD) coin = 0;
        
        // Test case 3: Insert 50 coin (50 cents - should get change)
        #(CLK_PERIOD*2) coin = fifty;
        #(CLK_PERIOD) coin = 0;
        
        // Test case 4: Insert 10+20+10 coins (40 cents)
        #(CLK_PERIOD*2) coin = ten;
        #(CLK_PERIOD) coin = twenty;
        #(CLK_PERIOD) coin = ten;
        #(CLK_PERIOD) coin = 0;
        
        // Test case 5: Insert 50+10 coins (60 cents - should get change)
        #(CLK_PERIOD*2) coin = fifty;
        #(CLK_PERIOD) coin = ten;
        #(CLK_PERIOD) coin = 0;
        
        // End simulation
        #(CLK_PERIOD*5) $finish;
    end
    
    // Monitor to display outputs
    initial begin
        $monitor("Time=%0t, Reset=%b, Coin=%b, State=%b, Z=%b, Change=%b", 
                 $time, reset, coin, uut.state, Z, change_given);
    end
    
    // Generate waveform file for debugging
    initial begin
        $dumpfile("vending_machine.vcd");
        $dumpvars(0, Vending_Machine_tb);
    end
endmodule