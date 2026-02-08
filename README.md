# LLM4ChipDesign
ChipChat Tutorial Assignment
# ChipChat Tutorial Assignment

This repository contains my complete submission for the **ChipChat Tutorial Assignment**
in the course **LLM4ChipDesign**. The goal of this assignment was to explore how large
language models (LLMs) can be used to assist with Verilog RTL generation, and to
understand their limitations through verification and debugging.

Rather than treating the LLM as a black box that always produces correct code, this
assignment focuses on prompt engineering, cleaning up generated RTL, running
simulations, and iteratively fixing real bugs when things go wrong.

---

## What’s in this repo
.
├── chipchat_exampleA.ipynb # Part I: Combinational example (binary_to_bcd)
├── chipchat_exampleB.ipynb # Part I: FSM example (sequence_detector)
├── chipchat_extension.ipynb # Part III: Extended FSM via spec change
├── ChipChat_Report.pdf # Final written report
└── README.md # This file


Each notebook is self-contained and can be run independently.

---

## Assignment breakdown

### Part I — Tutorial examples

I completed two official ChipChat tutorial examples:

- **Example A (Combinational):** `binary_to_bcd`  
  A purely combinational module that converts an 8-bit binary input into BCD digits.

- **Example B (Sequential/FSM):** `sequence_detector`  
  A finite state machine that detects a specific bit sequence with overlapping support.

For both examples, the notebooks include:
- The final prompt used for generation
- The raw LLM output
- Cleaned, synthesizable Verilog
- A self-checking testbench
- Compilation and simulation using `iverilog` and `vvp`
- Programmatic generation of `.v` files for reproducibility

---

### Part II — Debugging loop

Part II documents a real bug encountered in the FSM example. Although the design
compiled successfully, it initially failed simulation because the detection output
was asserted combinationally and missed by the testbench.

The debugging process includes:
- Multiple iterations
- Clear failure symptoms
- Root-cause analysis
- A design fix (registering the output)
- A final passing simulation

This section shows how verification and debugging are still essential when working
with LLM-generated RTL.

---

### Part III — Prompt-engineering extension

For the extension, I modified the FSM example by:
- Changing the detected input sequence
- Adding an `enable` signal to gate state updates
- Exposing the FSM state through a `state_out` output

The prompt was updated to reflect these changes, and the testbench was modified
accordingly to verify the new behavior.

---

## Tools and environment

- **Environment:** Google Colab
- **LLM Access:** OpenAI Chat Completions API  
  (the backend model was not explicitly fixed in the notebooks)
- **Simulation:** Icarus Verilog (`iverilog -g2012`, `vvp`)

All dependencies are installed inside the notebooks. The only manual step required
to rerun them is inserting an API key in the designated cell.

---

## Reproducibility

Each notebook is designed to run top-to-bottom on a fresh Colab runtime. Running a
notebook will:
1. Install required tools
2. Generate the RTL and testbench files
3. Compile the design with `iverilog`
4. Run the simulation with `vvp`
5. Print a clear PASS/FAIL message

No external files or manual edits are required beyond the API key.

---

## What I learned

- LLMs can speed up early RTL development, but they are not always correct
- Prompt specificity makes a big difference in synthesizable HDL quality
- Simulation is the ultimate source of truth for correctness
- Debugging LLM-generated code is still very much a human-driven process
- Treating the LLM as a helper rather than an authority leads to better results

---

**Course Instructors:**  
Prof. Dr. Ramesh Karri  
Prof. Weihua Xiao  

---

## Author

**Tejas Attarde**  
M.S. Electrical & Computer Engineering  
NYU Tandon School of Engineering

---

## Notes

This repository is provided as part of a course submission.
