# LLM4ChipDesign  
## ChipChat Tutorial Assignment

This repository contains my complete submission for the **ChipChat Tutorial Assignment**
in the course **LLM4ChipDesign**. The purpose of this assignment is to explore how
large language models (LLMs) can assist with Verilog RTL generation, and to understand
their limitations through simulation, verification, and debugging.

Rather than assuming that LLM-generated RTL is always correct, this assignment
emphasizes prompt engineering, manual cleanup of generated code, verification using
testbenches, and iterative debugging based on simulation results.

---

## Repository Structure

```text
.
├── chipchat_exampleA.ipynb   # Part I: Combinational example (binary_to_bcd)
├── chipchat_exampleB.ipynb   # Part I: FSM example (sequence_detector)
├── chipchat_extension.ipynb  # Part III: Extended FSM via spec change
├── ChipChat_Report.pdf       # Final written report
└── README.md                 # This file
```

Each notebook is self-contained and can be executed independently.

## 📑 Assignment Breakdown

### 🔹 Part I — Tutorial Examples

Two official ChipChat tutorial examples were completed:

- **Example A (Combinational): `binary_to_bcd`**  
  A purely combinational Verilog module that converts a binary input into its
  corresponding BCD representation.

- **Example B (Sequential / FSM): `sequence_detector`**  
  A finite state machine that detects a specified input sequence with support
  for overlapping patterns.

For both examples, the notebooks include:
- The final prompt used for RTL generation
- The raw LLM-generated output
- Cleaned, synthesizable Verilog code
- A self-checking testbench
- Compilation and simulation using `iverilog` and `vvp`
- Programmatic generation of `.v` files for reproducibility

---

### 🔹 Part II — Debugging Loop

Part II documents a real debugging process encountered in the FSM example.
Although the initial design compiled successfully, it failed simulation due to
subtle issues related to output timing and testbench expectations.

The debugging process includes:
- Multiple iterations
- Clear failure symptoms observed during simulation
- Root-cause analysis
- Incremental design fixes
- A final passing simulation

This section highlights the continued importance of verification and debugging
when working with LLM-generated RTL.

---

### 🔹 Part III — Prompt-Engineering Extension

For the extension, the FSM tutorial example was modified by:
- Changing the detected input sequence
- Adding an `enable` signal to gate state updates
- Exposing the internal FSM state through a `state_out` output

The prompt was updated to reflect the modified specification, and the testbench
was updated accordingly to verify the new behavior.

---

## 🛠 Tools and Environment

- **Environment:** Google Colab  
- **LLM Access:** OpenAI Chat Completions API  
  *(The backend model was not explicitly fixed in the notebooks)*  
- **Simulation:** Icarus Verilog (`iverilog -g2012`, `vvp`)

All dependencies are installed directly within the notebooks. The only manual step
required to rerun them is inserting an API key in the designated cell.

---

## 🔁 Reproducibility

Each notebook is designed to run top-to-bottom on a fresh Colab runtime.
Running a notebook will:

1. Install required tools
2. Generate the RTL and testbench files
3. Compile the design using `iverilog`
4. Run the simulation using `vvp`
5. Print a clear PASS/FAIL message

No external files or manual edits are required beyond providing an API key.

---

## 📚 What I Learned

- LLMs can accelerate early RTL development but are not guaranteed to be correct
- Prompt specificity has a significant impact on synthesizable HDL quality
- Simulation remains the ultimate source of truth for correctness
- Debugging LLM-generated RTL is still a human-driven process
- Treating the LLM as an assistant rather than an authority leads to better outcomes

---

## 🎓 Course Information

**Course Instructors:**  
- Prof. Dr. Ramesh Karri  
- Course Assistant: Weihua Xiao  

---

## 👤 Author

**Tejas Attarde**  
M.S. Electrical & Computer Engineering  
NYU Tandon School of Engineering  

---

## Notes

This repository is submitted as part of a course assignment.
