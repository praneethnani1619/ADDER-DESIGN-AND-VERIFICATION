UVM Adder Verification Project
📖 Project Overview
This is a complete hardware verification project using the Universal Verification Methodology (UVM) to verify a simple 8-bit adder circuit. The project demonstrates professional verification practices used in semiconductor and chip design industries.

🎯 What Does This Project Do?
Imagine you're building a calculator that can add two numbers. Before manufacturing the actual silicon chip, you need to make absolutely sure it works correctly. This project does exactly that - it thoroughly tests a digital adder circuit using sophisticated verification techniques.

The Simple Adder (What We're Testing):
Takes two 8-bit numbers (0-255) as input

Produces a 9-bit sum as output

Works on clock cycles

Can be reset to zero

The Verification System:
Generates thousands of random test cases automatically

Drives these test cases into the adder circuit

Monitors the outputs from the adder

Checks if the results are mathematically correct

Reports any errors or mismatches

uvm-adder-verification/
├── src/
│   ├── dut.sv                    # RTL design of the adder
│   ├── interface.sv              # DUT-testbench interface
│   └── uvm_components/
│       ├── seq_item.sv           # Transaction class definition
│       ├── sequencer.sv          # Sequence coordination
│       ├── driver.sv             # Stimulus generation
│       ├── monitor.sv            # Response collection
│       ├── agent.sv              # Active/passive component
│       ├── scoreboard.sv         # Result verification
│       ├── env.sv                # Test environment
│       ├── sequence.sv           # Test sequences
│       ├── test.sv               # Test cases
│       └── top.sv                # Top module
├── scripts/
│   └── run.do                   # Simulation script
├── docs/
│   └── architecture.md          # Design documentation
└── README.md                    # Project overview
1. DUT (Device Under Test) - dut.sv
This is the actual hardware we're testing - a simple adder

Like the "product" we're quality-checking

2. Testbench Components - The "Quality Control Team"
Sequence Item (seq_item.sv): A single test case with two numbers to add

Sequencer (sequencer.sv): The test manager that creates test scenarios

Driver (driver.sv): The "input specialist" who feeds numbers into the adder

Monitor (monitor.sv): The "output observer" who watches what the adder produces

Scoreboard (scoreboard.sv): The "quality checker" who verifies if 2+2 actually equals 4

Agent (agent.sv): Team leader managing the driver, monitor, and sequencer

Environment (env.sv): The entire testing facility

Test (test.sv): The main test plan controller

3. Interface (interface.sv)
Like a universal adapter that lets our test system talk to the hardware

Defines all the connection points (wires) between components

🚀 How to Run This Project
Prerequisites
ModelSim/Questasim simulator (or any SystemVerilog simulator with UVM support)

Basic understanding of command-line operations

Quick Start
Clone this repository

Open your simulator

Run the simulation script:

bash
vsim -do run.do
Manual Steps
bash
# Create working library
vlib work

# Compile all source files
vlog top.sv

# Start simulation
vsim work.tb_top

# Run the test
run -all
📊 What You'll See When Running
When you run the simulation, you'll see:

text
---- Scoreboard Check ----
[SCOREBOARD] Matched: ip1 = 45, ip2 = 67, out = 112
---- Scoreboard Check ----
[SCOREBOARD] Matched: ip1 = 23, ip2 = 89, out = 112
...
[base_test] End of testcase
✅ Green messages = Tests passed (adder works correctly)
❌ Red messages = Tests failed (something's wrong with the adder)

🎯 Learning Outcomes
By exploring this project, you'll understand:

UVM Methodology: Industry-standard verification approach

Testbench Architecture: How verification systems are structured

Constraint-Random Testing: Generating smart test cases automatically

Coverage-Driven Verification: Ensuring all scenarios are tested

Reusable Components: Building blocks that can verify different designs

💡 Why This Matters
This project demonstrates the same verification techniques used by companies like Intel, AMD, NVIDIA, and Qualcomm to ensure their chips work perfectly before manufacturing. A single bug in hardware can cost millions of dollars, making thorough verification absolutely critical.

🔍 For Beginners
If you're new to hardware verification:

Start by looking at dut.sv - understand what we're testing

Then check seq_item.sv - see what a test case looks like

Look at scoreboard.sv - understand how we check results

Finally, explore how all components connect in top.sv
