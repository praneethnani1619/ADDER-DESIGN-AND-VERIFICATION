class base_seq extends uvm_sequence#(seq_item);
    `uvm_object_utils(base_seq)

    function new(string name="base_seq");  // Removed extra space
        super.new(name);
    endfunction
    
    task body(); 
        `uvm_info(get_type_name(), "Base seq: Inside Body", UVM_LOW);  
        `uvm_do(req); 
    endtask 
endclass
