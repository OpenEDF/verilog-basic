interface router_io(input bit clock);
  logic		reset_n;
  logic [15:0]	din;
  logic [15:0]	frame_n;
  logic [15:0]	valid_n;
  logic [15:0]	dout;
  logic [15:0]	valido_n;
  logic [15:0]	busy_n;
  logic [15:0]	frameo_n;

  clocking cb @(posedge clock);
    default input #1 output #1;
    output reset_n;
    output din;
    output frame_n;
    output valid_n;
    input dout;
    input valido_n;
    input busy_n;
    input frameo_n;
  endclocking

  modport TB(clocking cb, output reset_n);
endinterface
