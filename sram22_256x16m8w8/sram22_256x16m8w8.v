// SRAM22 SRAM model
// Words: 256
// Word size: 16
// Write size: 8

module sram22_256x16m8w8(
`ifdef USE_POWER_PINS
  vdd,
  vss,
`endif
  clk,rstb,ce,we,wmask,addr,din,dout
);

  localparam DATA_WIDTH = 16;
  localparam ADDR_WIDTH = 8;
  localparam WMASK_WIDTH = 2;
  localparam RAM_DEPTH = 1 << ADDR_WIDTH;

`ifdef USE_POWER_PINS
  inout vdd; // power
  inout vss; // ground
`endif
  input  clk; // clock
  input  rstb; // reset bar (active low reset)
  input  ce; // chip enable
  input  we; // write enable
  input [WMASK_WIDTH-1:0] wmask; // write mask
  input [ADDR_WIDTH-1:0]  addr; // address
  input [DATA_WIDTH-1:0]  din; // data in
  output reg [DATA_WIDTH-1:0] dout; // data out

  reg [DATA_WIDTH-1:0] mem [0:RAM_DEPTH-1];

  always @(posedge clk)
  begin
    if (ce && rstb) begin
      // Write
      if (we) begin
          if (wmask[0]) begin
            mem[addr][7:0] <= din[7:0];
          end
          if (wmask[1]) begin
            mem[addr][15:8] <= din[15:8];
          end
      end

      // Read
      if (!we) begin
        dout <= mem[addr];
      end
    end
  end

endmodule
