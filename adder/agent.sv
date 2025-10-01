class agent extends uvm_agent; 
`uvm_component_utils(agent)
driver drv; 
// Driver instance 
seqcr seqr; 
monitor mon; 
// Sequencer instance 
// Monitor instance 
function new(string name = "agent", uvm_component parent = null); 
super.new(name, parent); // Call base class constructor 
endfunction 
function void build_phase(uvm_phase phase); 
super.build_phase(phase); // Call base class build_phase method 
if (get_is_active == UVM_ACTIVE) begin 
drv = driver::type_id::create("drv", this); 
seqr = seqcr::type_id::create("seqr", this);
end 
mon = monitor::type_id::create("mon", this); 
endfunction 
// Create monitor 
function void connect_phase(uvm_phase phase); 
if (get_is_active == UVM_ACTIVE) begin 
drv.seq_item_port.connect(seqr.seq_item_export); 
end 
endfunction 
endclass
