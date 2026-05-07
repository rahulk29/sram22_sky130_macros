# SRAM22 SKY130 SRAM Macros

## Overview

This repository contains SRAM macros that are generated using [SRAM22, an SRAM generator developed at UC Berkeley](https://github.com/rahulk29/sram22).
To unzip all GDS files, run

```bash
./unzip.sh
```

## Verification

Use all macros provided here at your own risk; we cannot make guarantees about their performance or correctness.

The following macros have been taped out via Cadence's shuttle program and behaved correctly in silicon measurements
when tested at VDD=1.8V and at a clock frequency of 25 MHz:
- sram22_64x24m4w8
- sram22_64x32m4w8
- sram22_128x16m4w8
- sram22_128x24m4w8
- sram22_128x32m4w8
- sram22_256x8m8w1
- sram22_256x16m8w8
- sram22_256x32m4w8
- sram22_256x64m4w8
- sram22_256x128m4w8
- sram22_512x8m8w1
- sram22_512x32m4w8
- sram22_512x64m4w8
- sram22_512x128m4w8
- sram22_1024x8m8w1
- sram22_1024x32m8w8
- sram22_1024x64m4w8
- sram22_2048x8m8w1
- sram22_2048x32m8w8
- sram22_4096x8m8w1
- sram22_4096x32m8w8

We are working to characterize these macros in more detail, and will announce when we have more data to share.

