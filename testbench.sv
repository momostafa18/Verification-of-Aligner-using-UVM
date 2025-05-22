`include "algn_tst_pkg.sv"


module TestBench();
  
  
  localparam ALGN_DATA_WIDTH = `ALGN_TEST_ALGN_DATA_WIDTH;
  
  import algn_test_pkg::*;
  import uvm_pkg::*;
  
  reg clk ;
  
 
  apb_if vif(.pclk(clk));
  
  md_if#(ALGN_DATA_WIDTH) md_vif_MASTER(.pclk(clk));
  
  md_if#(ALGN_DATA_WIDTH) md_vif_SLAVE(.pclk(clk));
  
  assign md_vif_MASTER.preset_n = vif.preset_n;
  assign md_vif_SLAVE.preset_n  = vif.preset_n;
  
  
  cfs_aligner#(.ALGN_DATA_WIDTH(`ALGN_TEST_ALGN_DATA_WIDTH)) DUT
  (
    .clk(clk),
    .reset_n(vif.preset_n),
    
    .paddr(vif.paddr),
    .pwrite(vif.pwrite),
    .psel(vif.psel),
    .penable(vif.penable),
    .pwdata(vif.pwdata),
    .pready(vif.pready),
    .prdata(vif.prdata),
    .pslverr(vif.pslverr),
    
    .md_rx_valid(md_vif_MASTER.valid),
    .md_rx_data(md_vif_MASTER.data),
    .md_rx_offset(md_vif_MASTER.offset),
    .md_rx_size(md_vif_MASTER.size),
    .md_rx_ready(md_vif_MASTER.ready),
    .md_rx_err(md_vif_MASTER.err),
    
    .md_tx_valid(md_vif_SLAVE.valid),
    .md_tx_data(md_vif_SLAVE.data),
    .md_tx_offset(md_vif_SLAVE.offset),
    .md_tx_size(md_vif_SLAVE.size),
    .md_tx_ready(md_vif_SLAVE.ready),
    .md_tx_err(md_vif_SLAVE.err)

  );
  
  //clock generation
  initial begin
    clk = 0 ;
    
    forever begin
     
      clk = #5ns ~clk ; 
    
    end
    
  end
  
  //Initial reset generator
  initial begin
    
    vif.preset_n = 1 ;
    #5 ;
    vif.preset_n = 0;
    #30;
    vif.preset_n = 1;
    
  end
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars;
    
    uvm_config_db#(virtual apb_if)::set(null, "*", "vif", vif);
    
    uvm_config_db#(virtual md_if#(ALGN_DATA_WIDTH))::set(null, "uvm_test_top.env.agent_MASTER", "vif", md_vif_MASTER);
    uvm_config_db#(virtual md_if#(ALGN_DATA_WIDTH))::set(null, "uvm_test_top.env.agent_SLAVE", "vif", md_vif_SLAVE );
    
    run_test ("algn_test_reg_access");
  end
  
   

endmodule
