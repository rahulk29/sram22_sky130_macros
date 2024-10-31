// SRAM22 SRAM model
// Words: 512
// Word size: 128
// Write size: 8

module sram22_512x128m4w8(
`ifdef USE_POWER_PINS
  vdd,
  vss,
`endif
  clk,rstb,ce,we,wmask,addr,din,dout
);

  localparam DATA_WIDTH = 128;
  localparam ADDR_WIDTH = 9;
  localparam WMASK_WIDTH = 16;
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
          if (wmask[2]) begin
            mem[addr][23:16] <= din[23:16];
          end
          if (wmask[3]) begin
            mem[addr][31:24] <= din[31:24];
          end
          if (wmask[4]) begin
            mem[addr][39:32] <= din[39:32];
          end
          if (wmask[5]) begin
            mem[addr][47:40] <= din[47:40];
          end
          if (wmask[6]) begin
            mem[addr][55:48] <= din[55:48];
          end
          if (wmask[7]) begin
            mem[addr][63:56] <= din[63:56];
          end
          if (wmask[8]) begin
            mem[addr][71:64] <= din[71:64];
          end
          if (wmask[9]) begin
            mem[addr][79:72] <= din[79:72];
          end
          if (wmask[10]) begin
            mem[addr][87:80] <= din[87:80];
          end
          if (wmask[11]) begin
            mem[addr][95:88] <= din[95:88];
          end
          if (wmask[12]) begin
            mem[addr][103:96] <= din[103:96];
          end
          if (wmask[13]) begin
            mem[addr][111:104] <= din[111:104];
          end
          if (wmask[14]) begin
            mem[addr][119:112] <= din[119:112];
          end
          if (wmask[15]) begin
            mem[addr][127:120] <= din[127:120];
          end
      end

      // Read
      if (!we) begin
        dout <= mem[addr];
      end
    end
  end

endmodule

