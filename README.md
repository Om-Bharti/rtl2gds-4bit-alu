# RTL to GDS-II: 4-bit Sequential ALU

## 📌 Project Overview

This project demonstrates a complete ASIC RTL-to-GDSII implementation of a pipelined 4-bit Arithmetic Logic Unit (ALU) using Synopsys EDA tools.

The design is first verified using Vivado for functional correctness and then taken through synthesis, physical design, and static timing analysis in a Linux-based ASIC design environment.

---

## ⚙️ Design Features

* 4-bit ALU

* Supported Operations:

  * ADD
  * AND
  * OR
  * XOR

* Sequential pipelined architecture:

  **Input Register → ALU → Output Register**

* Pipeline latency: **2 clock cycles**

---

## 🔍 RTL Verification (Vivado)

* Verilog RTL and testbench developed
* Functional simulation performed using Vivado
* Verified all ALU operations
* Observed pipeline behavior (2-cycle delay)
* Generated RTL schematic for structural validation

> The design was verified in Vivado before ASIC implementation to ensure correctness and reduce debugging effort in later stages.

---

## 📷 RTL Simulation Results

### Waveform (Functional Verification)

![Waveform](results/images/waveform.png)

### RTL Schematic

![RTL Schematic](results/images/rtl_schematic.png)

---

## 🛠️ Tools Used

* Xilinx Vivado – RTL Simulation & Schematic
* Synopsys Design Compiler (DC) – Logic Synthesis
* Synopsys IC Compiler II (ICC2) – Physical Design
* Synopsys PrimeTime (PT) – Static Timing Analysis

---

## 🔄 Design Flow

### 1. RTL Design & Verification

* RTL code written in Verilog
* Testbench created for verification
* Simulation and schematic validation performed in Vivado

---

### 2. Logic Synthesis (Design Compiler)

* RTL synthesized using SAED32nm standard cell library
* Technology mapping performed to generate gate-level netlist

Commands:

```bash
dc_shell
source dc_script.tcl
```

### 📷 Synthesized Design

![Synthesis](results/images/synth_schematic.png)

Generated:

* Gate-level netlist
* Timing report
* Area report

---

### 3. Physical Design (ICC2)

Commands:

```bash
icc2_shell

source 01_setup.tcl
source 02_netlist_read.tcl
source 03_floorplan.tcl
source 04_power_planning.tcl
source 05_placement.tcl
source 06_clock.tcl
source 07_route.tcl
source 08_signoff_outputs.tcl
```

#### Steps:

* Setup → Technology and libraries loaded
* Netlist Read → Design imported
* Floorplan → Core area and IO placement
* Power Planning → VDD/VSS mesh and rings
* Placement → Standard cell placement
* Clock Tree Synthesis → Clock distribution
* Routing → Metal interconnect
* Signoff → Final GDSII generation

---

## 📷 Physical Design Output

### Final Layout (GDS View)

![Layout](results/images/layout.png)

---

### 4. Static Timing Analysis (PrimeTime)

Commands:

```bash
pt_shell
source run_pt_p1.tcl
source run_pt_p2.tcl
```

Verified:

* Setup timing → PASS
* Hold timing → PASS

---

## ⏱️ Timing Result

![Timing](results/images/timing.png)

---

## 📊 Results

| Parameter           | Value    |
| ------------------- | -------- |
| Clock Period        | 10 ns    |
| Critical Path Delay | ~3.64 ns |
| Worst Setup Slack   | +5.62 ns |
| Hold Violations     | None     |

---

## 🧠 Key Insights

* Critical path dominated by ripple carry adder delay
* Logical operations implemented using AO, OA, AND cells (no dedicated XOR cell)
* Routing increases delay due to parasitic effects
* Design meets timing at 100 MHz
* Design fails at ~3 ns clock → requires optimization
* Pipelining improves timing closure

---

## 📁 Repository Structure

```bash
rtl/                # RTL & Testbench
constraints/        # SDC file
synthesis/          # Design Compiler scripts
physical_design/    # ICC2 scripts
sta/                # PrimeTime scripts
reports/            # Timing, area, power reports
results/            # Outputs & images
```

---

## 🎯 Project Significance

* Demonstrates complete ASIC design flow from RTL to GDS-II
* Achieved positive timing slack with zero violations
* Validates pipelined ALU architecture
* Shows practical understanding of synthesis, placement, routing, and timing closure

---

## 🚀 Future Improvements

* Upgrade to 8-bit ALU
* Replace ripple carry adder with Carry Lookahead Adder (CLA)
* Optimize for higher frequency
* Improve power efficiency

---

## 💡 Conclusion

This project demonstrates a complete ASIC design flow from RTL to GDS-II, including verification, synthesis, physical design, and timing analysis. It highlights the importance of timing closure, pipelining, and architectural decisions in modern digital design.
