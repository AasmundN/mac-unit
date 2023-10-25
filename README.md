# Design of integrated circuits - MAC Unit
This MAC-unit was designed as part of a student project. Here you can view it's design, implemetation, and simulation. Full project report can be read at: [PLACEHOLDER]. 

## Repository structure
Primary directories are *spice* and *verilog*. Under spice you will find all circuit and model files used for transistor simulations. Verilog contains the design and verification of the hardware at gate and system level.

- **verilog**
    - **simulations** - simulation results.
    - **src** - circuits implemented at gate level.
    - **testbench** - testbenches for all circuits.
- **spice**
    - **plots** - transistor simulation results at different process corners and temperatures.
    - **simulations** - raw data generated from simulation.
    - **src** - Simulation code, transistor design of circuits, and model paramaters used.

 ## Running Verilog Code
 The Verilog code can be runned in Active-HDL or VS Code. Begin with cloning the repository do your desired directory:
 ```
git clone https://github.com/AasmundN/mac-unit.git
```
To run in Active-HDL, simply import the Verilog code. To run in VS Code, first install *leafvmaple.verilog* and *mshr-h.veriloghdl* extentions. Note that leafvmaple.verilog needs [Icarus Verilog](https://iverilog.fandom.com/wiki/Installation_Guide) installed to work.

After requisits are installed, you can use leafvample.verilog's run command to compile code, and GTK Wave to open simulation files (.vcd). If you have added GTK Wave to path in environment variables, you can open it in VS Code by typing `gtkwave` in the terminal.
