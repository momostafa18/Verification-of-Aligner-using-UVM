# Verification of Aligner Using UVM

## Overview

This project implements a comprehensive **Universal Verification Methodology (UVM)** testbench to verify an RTL module named **Aligner**. The Aligner module is responsible for aligning incoming unaligned data and transmitting the aligned output. It interfaces with three primary buses:

- **APB Interface**: Facilitates register access for configuration and status monitoring.
- **RX MD Interface**: Receives unaligned input data.
- **TX MD Interface**: Transmits aligned output data.

The verification environment is designed to be modular, reusable, and scalable, adhering to industry-standard UVM practices.

## Repository Structure

The repository is organized into several directories and files, each serving a specific purpose in the verification environment:

- **`apb_agent/`**: Contains the APB agent components, including driver, monitor, sequencer, and configuration files.
- **`algn_env/`**: Defines the top-level environment, integrating all agents, scoreboards, and coverage collectors.
- **`algn_reg_block/`**: Implements the UVM Register Abstraction Layer (RAL) for the Aligner's registers.
- **`algn_test_pkg/`**: Houses various test cases and sequences to validate different functionalities of the Aligner.
- **`algn_model/`**: Provides a reference model for the Aligner to compare expected and actual outputs.
- **`algn_reg_predictor/`**: Synchronizes the register model with the DUT's actual register states.
- **`README.md`**: This file, providing an overview and guidance on the project.

## Key Features

- **Modular Agent Design**: Developed reusable agents for APB, RX, and TX interfaces, promoting scalability and maintainability.
- **UVM RAL Integration**: Leveraged UVM's Register Abstraction Layer to model and access the Aligner's registers efficiently.
- **Callbacks and Configurations**: Utilized UVM callbacks and configuration objects to inject custom behaviors and parameterize components dynamically.
- **Functional Coverage**: Implemented coverage collectors to ensure comprehensive verification of the Aligner's functionalities.
- **Scoreboarding**: Compared DUT outputs against a reference model to validate correctness.

## Getting Started

To run the verification environment:

1. **Prerequisites**:
   - UVM-compatible simulator (e.g., Synopsys VCS, Cadence Xcelium, Mentor Questa).
   - SystemVerilog support.

2. **Clone the Repository**:
   ```bash
   git clone https://github.com/momostafa18/Verification-of-Aligner-using-UVM.git
   cd Verification-of-Aligner-using-UVM


## Compile and Run:
-timescale 1ns/1ns -sysv -coverage functional
-access +rw +UVM_MAX_QUIT_COUNT=1 +uvm_set_verbosity=*,REG_PREDICT,UVM_HIGH,run

## For any inquiries or support, please contact mohamedmostafaabdelrahman1@gmail.com.

