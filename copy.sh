#!/bin/bash

set -euf -o pipefail

SRAM22=/tools/scratch/rahulkumar/sram22
SRAM22BUILD=$SRAM22/build

echo "copy source: $SRAM22BUILD"

echo "copying aggregated netlist"
cp $SRAM22BUILD/test_sram_aggregator/sram22_sram_aggregator.spice ./sram22.spice

for cell in \
    sram22_64x24m4w8 \
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
    sram22_512x32m4w8 \
    sram22_512x64m4w8 \
    sram22_512x128m4w8 \
    sram22_1024x8m8w1 \
    sram22_1024x32m8w8 \
    sram22_1024x64m4w8 \
    sram22_2048x8m8w1 \
    sram22_2048x32m8w8
do
    echo "copying collateral for $cell"
    mkdir -p $cell
    CELLDIR=$SRAM22BUILD/test_$cell
    cp $CELLDIR/$cell.spice $cell/
    cp $CELLDIR/$cell.v $cell/
    cp $CELLDIR/$cell.gds $cell/
    cd $cell/ && tar -czf $cell.gds.gz $cell.gds && rm -f $cell.gds && cd -
    cp $CELLDIR/$cell.lef $cell/
    cp $CELLDIR/$cell\_tt_025C_1v80.lib $cell/
    cp $CELLDIR/$cell\_ss_100C_1v60.lib $cell/
    cp $CELLDIR/$cell\_ff_n40C_1v95.lib $cell/
done

echo "done"
