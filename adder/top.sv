`include "uvm_macros.svh"
import uvm_pkg::*;

`include "interface.sv"
`include "dut.sv"
`include "seq_item.sv"
`include "sequencer.sv"
`include "driver.sv"
`include "monitor.sv"
`include "agent.sv"
`include "scoreboard.sv"
`include "env.sv"
`include "sequence.sv"
`include "test.sv"

module tb_top; 
    bit clk; 
    bit reset;
    
    // Clock generation 
    always #2 clk = ~clk;
    
    initial begin 
        reset = 1;
        #5; 
        reset = 0;
    end 
    
    add_if vif();  // Interface instance
    
    // Connect interface signals
    assign vif.clk = clk;
    assign vif.reset = reset;
    
    adder DUT( 
        .clk(vif.clk), 
        .reset(vif.reset), 
        .in1(vif.ip1),    // Connected to ip1
        .in2(vif.ip2),    // Connected to ip2   
        .out(vif.out)
    );
    
    initial begin 
        uvm_config_db#(virtual add_if)::set(uvm_root::get(), "*", "vif", vif);
    end 
    
    initial begin 
        run_test("base_test");
    end 
endmodule
