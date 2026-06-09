# RTL-to-GDSII-Viterbi-Decoder-ASIC
## Stage 1: RTL Behavioral Simulation & Functional Verification

### Project Overview
This repository documents **Stage 1** of the ASIC implementation flow for a **K=7 Viterbi Decoder and Convolutional Encoder**. The objective of this stage is to verify the functional correctness of the RTL design through behavioral simulation before proceeding to logic synthesis and subsequent physical design stages.

The design implements a **64-state hard-decision Viterbi Decoder** based on the **(171,133) convolutional code** with a **Sequential Input / Sequential Output (SISO) streaming architecture**, making it suitable for ASIC implementation with reduced I/O requirements.

---

## Design Specifications

| Parameter | Value |
|------------|--------|
| Constraint Length | K = 7 |
| Convolutional Code | (171,133) Octal |
| Number of States | 64 |
| Decoding Method | Hard Decision |
| Architecture | Sequential Input / Sequential Output |
| Sequence Length | 256 bits |
| Traceback Method | Survivor Memory Based |
| RTL Language | Verilog HDL |

---

## Verification Objective

The primary objective of this stage is to verify:

- Correct convolutional encoding operation.
- Accurate Add-Compare-Select (ACS) computation.
- Proper path metric updates.
- Survivor path memory functionality.
- Correct traceback operation.
- Sequential output generation.
- Decoder state transitions.
- End-to-end functional correctness.

---

## Verification Methodology

A Verilog testbench was developed to perform functional verification.

### Test Flow

1. Generate a predefined 256-bit message sequence.
2. Encode the message using a reference convolutional encoder implementing the (171,133) generator polynomials.
3. Feed encoded symbol pairs serially into the Viterbi decoder.
4. Perform ACS operations for all 64 states.
5. Store survivor paths in backpointer memory.
6. Start traceback after processing the complete sequence.
7. Reconstruct and output decoded bits sequentially.
8. Verify waveform behavior and decoder operation.

---

## Simulation Environment

| Item | Description |
|--------|-------------|
| Simulator | Cadence Xcelium |
| Waveform Viewer | Cadence SimVision |
| Clock Period | 10 ns |
| Input Sequence Length | 256 bits |
| Verification Type | RTL Behavioral Simulation |

---

## Simulation Results

The waveform confirms:

- Successful decoder initialization.
- Serial reception of encoded symbol pairs.
- Proper assertion of `rx_valid`.
- Correct symbol counting up to 256 symbols.
- Transition from decoding mode to traceback mode.
- Sequential generation of decoded bits.
- Assertion of `out_valid` during traceback.
- Decoder readiness after completion.

### Functional Verification Status

| Check | Status |
|---------|---------|
| Encoder Functionality | ✅ Pass |
| ACS Operation | ✅ Pass |
| Path Metric Update | ✅ Pass |
| Survivor Memory Storage | ✅ Pass |
| Traceback Operation | ✅ Pass |
| Output Bit Generation | ✅ Pass |
| State Transition Verification | ✅ Pass |
| End-to-End Functional Verification | ✅ Pass |

---

## Architecture Highlights

### Convolutional Encoder
- Rate 1/2 encoder.
- Generator polynomials:
  - G1 = 171 (Octal)
  - G2 = 133 (Octal)
- Constraint Length K = 7.

### Viterbi Decoder
- 64-state trellis.
- Hard-decision decoding.
- Add-Compare-Select (ACS) architecture.
- Survivor path storage using backpointer memory.
- Traceback-based path reconstruction.

### Streaming Interface

The design employs a **Sequential Input / Sequential Output (SISO)** architecture:

- Serial reception of encoded symbols.
- Reduced I/O pin requirements.
- ASIC-friendly implementation.
- Scalable for larger frame sizes.

---

## ASIC Design Flow Progress

```text
RTL Behavioral Simulation & Functional Verification   ✅ Completed
Logic Synthesis                                       ⏳ Pending
Gate-Level Simulation                                 ⏳ Pending
Floorplanning                                         ⏳ Pending
Power Planning                                        ⏳ Pending
Placement                                             ⏳ Pending
Clock Tree Synthesis (CTS)                            ⏳ Pending
Routing                                               ⏳ Pending
Static Timing Analysis (STA)                          ⏳ Pending
DRC / LVS Verification                                ⏳ Pending
GDSII Generation                                      ⏳ Pending
```

---

## Repository Structure

```text
RTL-to-GDSII-Viterbi-Decoder-ASIC/
│
├── RTL/
│   ├── viterbi_k7.v
│
├── Testbench/
│   ├── tb_viterbi_k7.v
│
├── Simulation/
│   ├── Waveforms/
│   ├── Screenshots/
│   └── Simulation_Reports/
│
├── Docs/
│   └── Design_Description.pdf
│
└── README.md
```

---

## Future Work

The verified RTL design will be taken through the complete ASIC implementation flow, including synthesis, timing closure, physical design, verification, and GDSII generation.

---

### Author

** Nandini Kendre**  
M.Tech (VLSI Design)  
Senior Research Fellow (C2S Program – MeitY, Government of India)

---
