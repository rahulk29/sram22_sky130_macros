 
# Sram22 Sky130 SRAM Macros

## Overview
This repository contains SRAM macros that are generated using [SRAM22, an SRAM generator developed at UC Berkeley](https://github.com/rahulk29/sram22).

These configurations were generated for use in [Chipyard](https://github.com/ucb-bar/chipyard.git) designs 
in their VLSI tutorial with Sky130 and [commercial tools](https://chipyard.readthedocs.io/en/stable/VLSI/Sky130-Commercial-Tutorial.html) and [OpenROAD tools](https://chipyard.readthedocs.io/en/stable/VLSI/Sky130-OpenROAD-Tutorial.html).
These tutorials are in progress, and should be released in the beginning of March 2023.


## Configurations
Sram22 is still a work in progress. At the moment, we only support the SKY130 process.

The supported configurations are:
* depth/width: must be divisible by 8
* mux ratio: only {4,8}

We recommend you use Sram22 to generate your own configuratons, rather than requesting them here. But we may choose to generate some of the requested ones.
