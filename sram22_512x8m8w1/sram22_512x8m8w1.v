// SRAM22 SRAM model
// Words: 512
// Word size: 8
// Write size: 1

module sram22_512x8m8w1(
`ifdef USE_POWER_PINS
  vdd,
  vss,
`endif
  clk,rstb,ce,we,wmask,addr,din,dout
);

  localparam DATA_WIDTH = 8;
  localparam ADDR_WIDTH = 9;
  localparam WMASK_WIDTH = 8;
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
            mem[addr][0:0] <= din[0:0];
          end
          if (wmask[1]) begin
            mem[addr][1:1] <= din[1:1];
          end
          if (wmask[2]) begin
            mem[addr][2:2] <= din[2:2];
          end
          if (wmask[3]) begin
            mem[addr][3:3] <= din[3:3];
          end
          if (wmask[4]) begin
            mem[addr][4:4] <= din[4:4];
          end
          if (wmask[5]) begin
            mem[addr][5:5] <= din[5:5];
          end
          if (wmask[6]) begin
            mem[addr][6:6] <= din[6:6];
          end
          if (wmask[7]) begin
            mem[addr][7:7] <= din[7:7];
          end
      end

      // Read
      if (!we) begin
        dout <= mem[addr];
      end
    end
  end

endmodule

