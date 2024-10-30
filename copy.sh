#!/bin/bash

set -eu -o pipefail

SRAM22=../sram22
SRAM22BUILD=$SRAM22/build

echo "copy source: $SRAM22BUILD"

for cell in \
    sram22_64x24m4w24 \
    sram22_64x32m4w8 \
    sram22_128x16m4w8 \
    sram22_128x24m4w8 \
    sram22_128x32m4w8 \
    sram22_256x8m8w1 \
    sram22_256x16m8w8 \
    sram22_256x32m4w8 \
    sram22_256x64m4w8 \
    sram22_256x128m4w8 \
    sram22_512x8m8w1 \
    sram22_512x32m4w32 \
    sram22_512x64m4w8 \
    sram22_512x128m4w8 \
    sram22_1024x8m8w1 \
    sram22_1024x32m8w8 \
    sram22_1024x64m8w8 \
    sram22_2048x8m8w1 \
    sram22_2048x32m8w8 \
    sram22_4096x8m8w1 \
    sram22_4096x32m8w8 \
    sram22_8192x32m8w8
do
    echo "copying collateral for $cell"
    mkdir -p $cell
    CELLDIR=$SRAM22BUILD/test_$cell
    cp $CELLDIR/$cell.spice $cell/
    cp $CELLDIR/$cell.v $cell/
    cp $CELLDIR/$cell.gds $cell/
    cp $CELLDIR/$cell.lef $cell/
    cp $CELLDIR/$cell_tt_025C_1v80.lib $cell/
    cp $CELLDIR/$cell_ss_100C_1v60.lib $cell/
    cp $CELLDIR/$cell_ff_n40C_1v95.lib $cell/
done
