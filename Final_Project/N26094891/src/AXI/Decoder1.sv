`include "../../include/AXI_define.svh"
/*`define IDLE              5'b00000
`define READ_ADDR_M1       5'b00001
`define READ_DATA_M1S0     5'b00010
`define READ_DATA_M1S1     5'b00011
`define READ_ADDR_M0       5'b00100
`define READ_DATA_M0S0     5'b00101
`define READ_DATA_M0S1     5'b00110
`define WRITE_ADDR_M1      5'b00111
`define WRITE_DATA_M1S0    5'b01000
`define WRITE_DATA_M1S1    5'b01001
`define WRITE_B_M1S0    5'b01010
`define WRITE_B_M1S1    5'b01011
`define WRITE_ADDR_M0      5'b01100
`define default_slave     5'b01101
`define WRITE_M1_SIM_S0 5'b01110
`define WRITE_M1_SIM_S1 5'b01111
`define READ_AR_R_M0S0       5'b10000
`define READ_AR_R_M0S1       5'b10001
`define READ_AR_R_M1S0       5'b10010
`define READ_AR_R_M1S1       5'b10011
*/

`define IDLE              6'b000000
`define READ_ADDR_M1       6'b000001
`define READ_DATA_M1S0     6'b000010
`define READ_DATA_M1S1     6'b000011
`define READ_ADDR_M0       6'b000100
`define READ_DATA_M0S0     6'b000101
`define READ_DATA_M0S1     6'b000110
`define WRITE_ADDR_M1      6'b000111
`define WRITE_DATA_M1S0    6'b001000
`define WRITE_DATA_M1S1    6'b001001
`define WRITE_B_M1S0       6'b001010
`define WRITE_B_M1S1       6'b001011
`define WRITE_ADDR_M0      6'b001100
`define default_slave     6'b001101
`define WRITE_M1_SIM_S0    6'b001110
`define WRITE_M1_SIM_S1    6'b001111
//adding new states of slave 2, 3, 4
`define READ_DATA_M1S2 6'b010000
`define READ_DATA_M1S3 6'b010001
`define READ_DATA_M1S4 6'b010010
`define READ_DATA_M0S2 6'b010011
`define READ_DATA_M0S3 6'b010100
`define READ_DATA_M0S4 6'b010101
`define WRITE_DATA_M1S2 6'b011000
`define WRITE_DATA_M1S3 6'b011001
`define WRITE_DATA_M1S4 6'b011010
`define WRITE_B_M1S2 6'b011011
`define WRITE_B_M1S3 6'b011100
`define WRITE_B_M1S4 6'b011101
`define WRITE_M1_SIM_S2    6'b011110
`define WRITE_M1_SIM_S3    6'b011111
`define WRITE_M1_SIM_S4    6'b010110
//adding new states of slave 5
`define READ_DATA_M1S5 6'b100000
`define READ_DATA_M0S5 6'b100001
`define WRITE_DATA_M1S5 6'b100010
`define WRITE_B_M1S5 6'b100011
`define WRITE_M1_SIM_S5 6'b100100

module Decoder1 (

  input logic ACLK,
  input logic ARESETn,
  input logic [5:0]CS_R,
  input logic [5:0]CS_W, 
  input logic [5:0]NS_R,
  input logic [5:0]NS_W,  
  input logic [`AXI_ID_BITS-1:0]  AWID   ,
  input logic [`AXI_ADDR_BITS-1:0] AWADDR ,
  input logic [`AXI_LEN_BITS-1:0]  AWLEN  ,
  input logic [`AXI_SIZE_BITS-1:0] AWSIZE ,
  input logic [1:0]                AWBURST,
  input logic                      AWVALID,
  input logic [`AXI_DATA_BITS-1:0] WDATA  ,
  input logic [`AXI_STRB_BITS-1:0] WSTRB  ,
  input logic                      WLAST  ,
  input logic                      WVALID ,
  input logic [`AXI_ID_BITS-1:0]  ARID   , 
  input logic [`AXI_ADDR_BITS-1:0] ARADDR , 
  input logic [`AXI_LEN_BITS-1:0]  ARLEN  , 
  input logic [`AXI_SIZE_BITS-1:0] ARSIZE , 
  input logic [1:0]                ARBURST, 
  input logic                      ARVALID,
  input logic                      RREADY ,
  input logic                      BREADY ,
  
  output logic[`AXI_IDS_BITS-1:0]  AWID_S0   ,
  output logic[`AXI_ADDR_BITS-1:0] AWADDR_S0 ,
  output logic[`AXI_LEN_BITS-1:0]  AWLEN_S0  ,
  output logic[`AXI_SIZE_BITS-1:0] AWSIZE_S0 ,
  output logic[1:0]                AWBURST_S0,
  output logic                     AWVALID_S0,
  output logic[`AXI_IDS_BITS-1:0]  AWID_S1   ,
  output logic[`AXI_ADDR_BITS-1:0] AWADDR_S1 ,
  output logic[`AXI_LEN_BITS-1:0]  AWLEN_S1  ,
  output logic[`AXI_SIZE_BITS-1:0] AWSIZE_S1 ,
  output logic[1:0]                AWBURST_S1,
  output logic                     AWVALID_S1, 
  
  output logic[`AXI_IDS_BITS-1:0]  AWID_S2   ,
  output logic[`AXI_ADDR_BITS-1:0] AWADDR_S2 ,
  output logic[`AXI_LEN_BITS-1:0]  AWLEN_S2  ,
  output logic[`AXI_SIZE_BITS-1:0] AWSIZE_S2 ,
  output logic[1:0]                AWBURST_S2,
  output logic                     AWVALID_S2, 

  output logic[`AXI_IDS_BITS-1:0]  AWID_S3   ,
  output logic[`AXI_ADDR_BITS-1:0] AWADDR_S3 ,
  output logic[`AXI_LEN_BITS-1:0]  AWLEN_S3  ,
  output logic[`AXI_SIZE_BITS-1:0] AWSIZE_S3 ,
  output logic[1:0]                AWBURST_S3,
  output logic                     AWVALID_S3, 
 
  output logic[`AXI_IDS_BITS-1:0]  AWID_S4   ,
  output logic[`AXI_ADDR_BITS-1:0] AWADDR_S4 ,
  output logic[`AXI_LEN_BITS-1:0]  AWLEN_S4  ,
  output logic[`AXI_SIZE_BITS-1:0] AWSIZE_S4 ,
  output logic[1:0]                AWBURST_S4,
  output logic                     AWVALID_S4, 

  output logic[`AXI_IDS_BITS-1:0]  AWID_S5   ,
  output logic[`AXI_ADDR_BITS-1:0] AWADDR_S5 ,
  output logic[`AXI_LEN_BITS-1:0]  AWLEN_S5  ,
  output logic[`AXI_SIZE_BITS-1:0] AWSIZE_S5 ,
  output logic[1:0]                AWBURST_S5,
  output logic                     AWVALID_S5, 

  output logic[`AXI_IDS_BITS-1:0]  ARID_S0   ,
  output logic[`AXI_ADDR_BITS-1:0] ARADDR_S0 ,
  output logic[`AXI_LEN_BITS-1:0]  ARLEN_S0  ,
  output logic[`AXI_SIZE_BITS-1:0] ARSIZE_S0 ,
  output logic[1:0]                ARBURST_S0,
  output logic                     ARVALID_S0,
  output logic[`AXI_IDS_BITS-1:0]  ARID_S1   ,
  output logic[`AXI_ADDR_BITS-1:0] ARADDR_S1 ,
  output logic[`AXI_LEN_BITS-1:0]  ARLEN_S1  ,
  output logic[`AXI_SIZE_BITS-1:0] ARSIZE_S1 ,
  output logic[1:0]                ARBURST_S1,
  output logic                     ARVALID_S1,
  
  output logic[`AXI_IDS_BITS-1:0]  ARID_S2   ,
  output logic[`AXI_ADDR_BITS-1:0] ARADDR_S2 ,
  output logic[`AXI_LEN_BITS-1:0]  ARLEN_S2  ,
  output logic[`AXI_SIZE_BITS-1:0] ARSIZE_S2 ,
  output logic[1:0]                ARBURST_S2,
  output logic                     ARVALID_S2,
 
  output logic[`AXI_IDS_BITS-1:0]  ARID_S3   ,
  output logic[`AXI_ADDR_BITS-1:0] ARADDR_S3 ,
  output logic[`AXI_LEN_BITS-1:0]  ARLEN_S3  ,
  output logic[`AXI_SIZE_BITS-1:0] ARSIZE_S3 ,
  output logic[1:0]                ARBURST_S3,
  output logic                     ARVALID_S3,
  
  output logic[`AXI_IDS_BITS-1:0]  ARID_S4   ,
  output logic[`AXI_ADDR_BITS-1:0] ARADDR_S4 ,
  output logic[`AXI_LEN_BITS-1:0]  ARLEN_S4  ,
  output logic[`AXI_SIZE_BITS-1:0] ARSIZE_S4 ,
  output logic[1:0]                ARBURST_S4,
  output logic                     ARVALID_S4,
  
  output logic[`AXI_IDS_BITS-1:0]  ARID_S5   ,
  output logic[`AXI_ADDR_BITS-1:0] ARADDR_S5 ,
  output logic[`AXI_LEN_BITS-1:0]  ARLEN_S5  ,
  output logic[`AXI_SIZE_BITS-1:0] ARSIZE_S5 ,
  output logic[1:0]                ARBURST_S5,
  output logic                     ARVALID_S5,
  
  output logic[`AXI_DATA_BITS-1:0] WDATA_S0  ,
  output logic[`AXI_STRB_BITS-1:0] WSTRB_S0  ,
  output logic                     WLAST_S0  ,
  output logic                     WVALID_S0 ,
  output logic[`AXI_DATA_BITS-1:0] WDATA_S1  ,
  output logic[`AXI_STRB_BITS-1:0] WSTRB_S1  ,
  output logic                     WLAST_S1  ,
  output logic                     WVALID_S1 ,

  output logic[`AXI_DATA_BITS-1:0] WDATA_S2  ,
  output logic[`AXI_STRB_BITS-1:0] WSTRB_S2  ,
  output logic                     WLAST_S2  ,
  output logic                     WVALID_S2 ,

  output logic[`AXI_DATA_BITS-1:0] WDATA_S3  ,
  output logic[`AXI_STRB_BITS-1:0] WSTRB_S3  ,
  output logic                     WLAST_S3  ,
  output logic                     WVALID_S3 ,
  
  output logic[`AXI_DATA_BITS-1:0] WDATA_S4  ,
  output logic[`AXI_STRB_BITS-1:0] WSTRB_S4 ,
  output logic                     WLAST_S4  ,
  output logic                     WVALID_S4 ,
  
  output logic[`AXI_DATA_BITS-1:0] WDATA_S5  ,
  output logic[`AXI_STRB_BITS-1:0] WSTRB_S5 ,
  output logic                     WLAST_S5  ,
  output logic                     WVALID_S5 ,
  
  output logic RREADY_S0   ,
  output logic BREADY_S0   ,
  output logic RREADY_S1   ,
  output logic BREADY_S1   ,
  output logic RREADY_S2   ,
  output logic BREADY_S2   ,
  
  output logic RREADY_S3   ,
  output logic BREADY_S3   ,  
  
  output logic RREADY_S4   ,
  output logic BREADY_S4   ,
  
  output logic RREADY_S5   ,
  output logic BREADY_S5   
  
);

//AW decoder
always_comb begin
	if((AWADDR[31:0]>=32'h0000_0000)&&(AWADDR[31:0]<=32'h0000_3fff)) begin
	  AWID_S0     = {4'd0,AWID} ;
	  AWADDR_S0   = AWADDR    ;
	  AWLEN_S0    = AWLEN     ;
	  AWSIZE_S0   = AWSIZE    ;
	  AWBURST_S0  = AWBURST   ;
	  AWVALID_S0  = AWVALID   ;
	  AWID_S1     = 8'd0      ;
	  AWADDR_S1   = 32'd0     ;
	  AWLEN_S1    = 4'd0      ;
	  AWSIZE_S1   = 3'd0      ;
	  AWBURST_S1  = 2'd0      ;
	  AWVALID_S1  = 1'd0      ;
	  
	  AWID_S2     = 8'd0      ;
	  AWADDR_S2   = 32'd0     ;
	  AWLEN_S2    = 4'd0      ;
	  AWSIZE_S2   = 3'd0      ;
	  AWBURST_S2  = 2'd0      ;
	  AWVALID_S2  = 1'd0      ;  
	  
	  AWID_S3     = 8'd0      ;
	  AWADDR_S3   = 32'd0     ;
	  AWLEN_S3    = 4'd0      ;
	  AWSIZE_S3   = 3'd0      ;
	  AWBURST_S3  = 2'd0      ;
	  AWVALID_S3  = 1'd0      ;  
	  
	  AWID_S4     = 8'd0      ;
	  AWADDR_S4   = 32'd0     ;
	  AWLEN_S4    = 4'd0      ;
	  AWSIZE_S4   = 3'd0      ;
	  AWBURST_S4  = 2'd0      ;
	  AWVALID_S4  = 1'd0      ; 

	  AWID_S5     = 8'd0      ;
	  AWADDR_S5   = 32'd0     ;
	  AWLEN_S5    = 4'd0      ;
	  AWSIZE_S5   = 3'd0      ;
	  AWBURST_S5  = 2'd0      ;
	  AWVALID_S5  = 1'd0      ;  	  
	end
	else if(AWADDR[31:16]==16'd1) begin
	  AWID_S0     = 8'd0      ;
	  AWADDR_S0   = 32'd0     ;
	  AWLEN_S0    = 4'd0      ;
	  AWSIZE_S0   = 3'd0      ;
	  AWBURST_S0  = 2'd0      ;
	  AWVALID_S0  = 1'd0      ;  
	  AWID_S1     = {4'd0,AWID};
	  AWADDR_S1   = AWADDR    ;
	  AWLEN_S1    = AWLEN     ;
	  AWSIZE_S1   = AWSIZE    ;
	  AWBURST_S1  = AWBURST   ;
	  AWVALID_S1  = AWVALID   ; 
	  
	  AWID_S2     = 8'd0      ;
	  AWADDR_S2   = 32'd0     ;
	  AWLEN_S2    = 4'd0      ;
	  AWSIZE_S2   = 3'd0      ;
	  AWBURST_S2  = 2'd0      ;
	  AWVALID_S2  = 1'd0      ;  
	  
	  AWID_S3     = 8'd0      ;
	  AWADDR_S3   = 32'd0     ;
	  AWLEN_S3    = 4'd0      ;
	  AWSIZE_S3   = 3'd0      ;
	  AWBURST_S3  = 2'd0      ;
	  AWVALID_S3  = 1'd0      ;  
	  
	  AWID_S4     = 8'd0      ;
	  AWADDR_S4   = 32'd0     ;
	  AWLEN_S4    = 4'd0      ;
	  AWSIZE_S4   = 3'd0      ;
	  AWBURST_S4  = 2'd0      ;
	  AWVALID_S4  = 1'd0      ; 
	  
	  AWID_S5     = 8'd0      ;
	  AWADDR_S5   = 32'd0     ;
	  AWLEN_S5    = 4'd0      ;
	  AWSIZE_S5   = 3'd0      ;
	  AWBURST_S5  = 2'd0      ;
	  AWVALID_S5  = 1'd0      ;  	  
	end
	
	else if(AWADDR[31:16]==16'd2) begin
	  AWID_S0     = 8'd0      ;
	  AWADDR_S0   = 32'd0     ;
	  AWLEN_S0    = 4'd0      ;
	  AWSIZE_S0   = 3'd0      ;
	  AWBURST_S0  = 2'd0      ;
	  AWVALID_S0  = 1'd0      ; 
	  
	  AWID_S1     = 8'd0      ;
	  AWADDR_S1   = 32'd0     ;
	  AWLEN_S1    = 4'd0      ;
	  AWSIZE_S1   = 3'd0      ;
	  AWBURST_S1  = 2'd0      ;
	  AWVALID_S1  = 1'd0      ;
	  
	  AWID_S2     = {4'd0,AWID};
	  AWADDR_S2   = AWADDR    ;
	  AWLEN_S2    = AWLEN     ;
	  AWSIZE_S2   = AWSIZE    ;
	  AWBURST_S2  = AWBURST   ;
	  AWVALID_S2  = AWVALID   ;  
	  
	  AWID_S3     = 8'd0      ;
	  AWADDR_S3   = 32'd0     ;
	  AWLEN_S3    = 4'd0      ;
	  AWSIZE_S3   = 3'd0      ;
	  AWBURST_S3  = 2'd0      ;
	  AWVALID_S3  = 1'd0      ;  
	  
	  AWID_S4     = 8'd0      ;
	  AWADDR_S4   = 32'd0     ;
	  AWLEN_S4    = 4'd0      ;
	  AWSIZE_S4   = 3'd0      ;
	  AWBURST_S4  = 2'd0      ;
	  AWVALID_S4  = 1'd0      ; 

	  AWID_S5     = 8'd0      ;
	  AWADDR_S5   = 32'd0     ;
	  AWLEN_S5    = 4'd0      ;
	  AWSIZE_S5   = 3'd0      ;
	  AWBURST_S5  = 2'd0      ;
	  AWVALID_S5  = 1'd0      ;  	  
	end
	
	else if((AWADDR[31:0]>=32'h1000_0000)&&(AWADDR[31:0]<=32'h1000_03ff)) begin
	  AWID_S0     = 8'd0      ;
	  AWADDR_S0   = 32'd0     ;
	  AWLEN_S0    = 4'd0      ;
	  AWSIZE_S0   = 3'd0      ;
	  AWBURST_S0  = 2'd0      ;
	  AWVALID_S0  = 1'd0      ; 
	  
	  AWID_S1     = 8'd0      ;
	  AWADDR_S1   = 32'd0     ;
	  AWLEN_S1    = 4'd0      ;
	  AWSIZE_S1   = 3'd0      ;
	  AWBURST_S1  = 2'd0      ;
	  AWVALID_S1  = 1'd0      ;
	  
	  AWID_S2     = 8'd0      ;
	  AWADDR_S2   = 32'd0     ;
	  AWLEN_S2    = 4'd0      ;
	  AWSIZE_S2   = 3'd0      ;
	  AWBURST_S2  = 2'd0      ;
	  AWVALID_S2  = 1'd0      ; 
	  
	  AWID_S3     = {4'd0,AWID};
	  AWADDR_S3   = AWADDR    ;
	  AWLEN_S3    = AWLEN     ;
	  AWSIZE_S3   = AWSIZE    ;
	  AWBURST_S3  = AWBURST   ;
	  AWVALID_S3  = AWVALID   ;  
	  
	  AWID_S4     = 8'd0      ;
	  AWADDR_S4   = 32'd0     ;
	  AWLEN_S4    = 4'd0      ;
	  AWSIZE_S4   = 3'd0      ;
	  AWBURST_S4  = 2'd0      ;
	  AWVALID_S4  = 1'd0      ; 

	  AWID_S5     = 8'd0      ;
	  AWADDR_S5   = 32'd0     ;
	  AWLEN_S5    = 4'd0      ;
	  AWSIZE_S5   = 3'd0      ;
	  AWBURST_S5  = 2'd0      ;
	  AWVALID_S5  = 1'd0      ;  	  
	end	
	
	else if((AWADDR[31:0]>=32'h2000_0000)&&(AWADDR[31:0]<=32'h207f_ffff)) begin
	  AWID_S0     = 8'd0      ;
	  AWADDR_S0   = 32'd0     ;
	  AWLEN_S0    = 4'd0      ;
	  AWSIZE_S0   = 3'd0      ;
	  AWBURST_S0  = 2'd0      ;
	  AWVALID_S0  = 1'd0      ; 
	  
	  AWID_S1     = 8'd0      ;
	  AWADDR_S1   = 32'd0     ;
	  AWLEN_S1    = 4'd0      ;
	  AWSIZE_S1   = 3'd0      ;
	  AWBURST_S1  = 2'd0      ;
	  AWVALID_S1  = 1'd0      ;
	  
	  AWID_S2     = 8'd0      ;
	  AWADDR_S2   = 32'd0     ;
	  AWLEN_S2    = 4'd0      ;
	  AWSIZE_S2   = 3'd0      ;
	  AWBURST_S2  = 2'd0      ;
	  AWVALID_S2  = 1'd0      ; 
	  
	  AWID_S3     = 8'd0      ;
	  AWADDR_S3   = 32'd0     ;
	  AWLEN_S3    = 4'd0      ;
	  AWSIZE_S3   = 3'd0      ;
	  AWBURST_S3  = 2'd0      ;
	  AWVALID_S3  = 1'd0      ;  
	  
	  AWID_S4     = {4'd0,AWID};
	  AWADDR_S4   = AWADDR    ;
	  AWLEN_S4    = AWLEN     ;
	  AWSIZE_S4   = AWSIZE    ;
	  AWBURST_S4  = AWBURST   ;
	  AWVALID_S4  = AWVALID   ; 

	  AWID_S5     = 8'd0      ;
	  AWADDR_S5   = 32'd0     ;
	  AWLEN_S5    = 4'd0      ;
	  AWSIZE_S5   = 3'd0      ;
	  AWBURST_S5  = 2'd0      ;
	  AWVALID_S5  = 1'd0      ;   	  
	end	
	
	else if(AWADDR[31:16]==16'h3000) begin
	  AWID_S0     = 8'd0      ;
	  AWADDR_S0   = 32'd0     ;
	  AWLEN_S0    = 4'd0      ;
	  AWSIZE_S0   = 3'd0      ;
	  AWBURST_S0  = 2'd0      ;
	  AWVALID_S0  = 1'd0      ; 
	  
	  AWID_S1     = 8'd0      ;
	  AWADDR_S1   = 32'd0     ;
	  AWLEN_S1    = 4'd0      ;
	  AWSIZE_S1   = 3'd0      ;
	  AWBURST_S1  = 2'd0      ;
	  AWVALID_S1  = 1'd0      ;
	  
	  AWID_S2     = 8'd0      ;
	  AWADDR_S2   = 32'd0     ;
	  AWLEN_S2    = 4'd0      ;
	  AWSIZE_S2   = 3'd0      ;
	  AWBURST_S2  = 2'd0      ;
	  AWVALID_S2  = 1'd0      ; 
	  
	  AWID_S3     = 8'd0      ;
	  AWADDR_S3   = 32'd0     ;
	  AWLEN_S3    = 4'd0      ;
	  AWSIZE_S3   = 3'd0      ;
	  AWBURST_S3  = 2'd0      ;
	  AWVALID_S3  = 1'd0      ;  
	  
	  AWID_S4     = 8'd0      ;
	  AWADDR_S4   = 32'd0     ;
	  AWLEN_S4    = 4'd0      ;
	  AWSIZE_S4   = 3'd0      ;
	  AWBURST_S4  = 2'd0      ;
	  AWVALID_S4  = 1'd0      ;  

	  AWID_S5     = {4'd0,AWID};
	  AWADDR_S5   = AWADDR    ;
	  AWLEN_S5    = AWLEN     ;
	  AWSIZE_S5   = AWSIZE    ;
	  AWBURST_S5  = AWBURST   ;
	  AWVALID_S5  = AWVALID   ;  	  
	end		
	else begin
	  AWID_S0     = 8'd0      ;
	  AWADDR_S0   = 32'd0     ;
	  AWLEN_S0    = 4'd0      ;
	  AWSIZE_S0   = 3'd0      ;
	  AWBURST_S0  = 2'd0      ;
	  AWVALID_S0  = 1'd0      ;  
	  AWID_S1     = 8'd0      ;
	  AWADDR_S1   = 32'd0     ;
	  AWLEN_S1    = 4'd0      ;
	  AWSIZE_S1   = 3'd0      ;
	  AWBURST_S1  = 2'd0      ;
	  AWVALID_S1  = 1'd0      ;	
	  
	  AWID_S2     = 8'd0      ;
	  AWADDR_S2   = 32'd0     ;
	  AWLEN_S2    = 4'd0      ;
	  AWSIZE_S2   = 3'd0      ;
	  AWBURST_S2  = 2'd0      ;
	  AWVALID_S2  = 1'd0      ;  
	  
	  AWID_S3     = 8'd0      ;
	  AWADDR_S3   = 32'd0     ;
	  AWLEN_S3    = 4'd0      ;
	  AWSIZE_S3   = 3'd0      ;
	  AWBURST_S3  = 2'd0      ;
	  AWVALID_S3  = 1'd0      ;  
	  
	  AWID_S4     = 8'd0      ;
	  AWADDR_S4   = 32'd0     ;
	  AWLEN_S4    = 4'd0      ;
	  AWSIZE_S4   = 3'd0      ;
	  AWBURST_S4  = 2'd0      ;
	  AWVALID_S4  = 1'd0      ; 

	  AWID_S5     = 8'd0      ;
	  AWADDR_S5   = 32'd0     ;
	  AWLEN_S5    = 4'd0      ;
	  AWSIZE_S5   = 3'd0      ;
	  AWBURST_S5  = 2'd0      ;
	  AWVALID_S5  = 1'd0      ; 	  
	end 
end
/*
logic [31:0] ARADDR_current;
logic [31:0] ARADDR_tmp;
always@(posedge ACLK or negedge ARESETn) begin
    if(!ARESETn) ARADDR_current <= 32'd0;
    else begin
         ARADDR_tmp <= ARADDR_current;
    end
end
always_comb begin
	if (ARVALID==1'd1)  ARADDR_current = ARADDR;//get new data
        else ARADDR_current = ARADDR_tmp;//keep old data
end
*/
//AR decoder
always_comb begin
//if(CS_R == `READ_ADDR_M1 || CS_R == `READ_ADDR_M0) begin
	if((ARADDR[31:0]>=32'h0000_0000)&&(ARADDR[31:0]<=32'h0000_3fff))begin
	  ARID_S0     = {4'd0,ARID};
	  ARADDR_S0   = ARADDR    ;
	  ARLEN_S0    = ARLEN     ;
	  ARSIZE_S0   = ARSIZE    ;
	  ARBURST_S0  = ARBURST   ;
	  ARVALID_S0  = ARVALID   ;
	  ARID_S1     = 8'd0      ;
	  ARADDR_S1   = 32'd0     ;
	  ARLEN_S1    = 4'd0      ;
	  ARSIZE_S1   = 3'd0      ;
	  ARBURST_S1  = 2'd0      ;
	  ARVALID_S1  = 1'd0      ; 
	  
	  ARID_S2     = 8'd0      ;
      ARADDR_S2   = 32'd0     ;
      ARLEN_S2    = 4'd0      ;
      ARSIZE_S2   = 3'd0      ;
      ARBURST_S2  = 2'd0      ;
      ARVALID_S2  = 1'd0      ; 

	  ARID_S3     = 8'd0      ;
      ARADDR_S3   = 32'd0     ;
      ARLEN_S3    = 4'd0      ;
      ARSIZE_S3   = 3'd0      ;
      ARBURST_S3  = 2'd0      ;
      ARVALID_S3  = 1'd0      ; 

	  ARID_S4     = 8'd0      ;
      ARADDR_S4   = 32'd0     ;
      ARLEN_S4    = 4'd0      ;
      ARSIZE_S4   = 3'd0      ;
      ARBURST_S4  = 2'd0      ;
      ARVALID_S4  = 1'd0      ; 

	  ARID_S5     = 8'd0      ;
      ARADDR_S5   = 32'd0     ;
      ARLEN_S5    = 4'd0      ;
      ARSIZE_S5   = 3'd0      ;
      ARBURST_S5  = 2'd0      ;
      ARVALID_S5  = 1'd0      ;  
	end
	else if(ARADDR[31:16]==16'd1)begin
	  ARID_S0     = 8'd0      ;
	  ARADDR_S0   = 32'd0     ;
	  ARLEN_S0    = 4'd0      ;
	  ARSIZE_S0   = 3'd0      ;
	  ARBURST_S0  = 2'd0      ;
	  ARVALID_S0  = 1'd0      ;  
	  ARID_S1     = {4'd0,ARID};
	  ARADDR_S1   = ARADDR    ;
	  ARLEN_S1    = ARLEN     ;
	  ARSIZE_S1   = ARSIZE    ;
	  ARBURST_S1  = ARBURST   ;
	  ARVALID_S1  = ARVALID   ; 	

	  ARID_S2     = 8'd0      ;
      ARADDR_S2   = 32'd0     ;
      ARLEN_S2    = 4'd0      ;
      ARSIZE_S2   = 3'd0      ;
      ARBURST_S2  = 2'd0      ;
      ARVALID_S2  = 1'd0      ; 

	  ARID_S3     = 8'd0      ;
      ARADDR_S3   = 32'd0     ;
      ARLEN_S3    = 4'd0      ;
      ARSIZE_S3   = 3'd0      ;
      ARBURST_S3  = 2'd0      ;
      ARVALID_S3  = 1'd0      ; 

	  ARID_S4     = 8'd0      ;
      ARADDR_S4   = 32'd0     ;
      ARLEN_S4    = 4'd0      ;
      ARSIZE_S4   = 3'd0      ;
      ARBURST_S4  = 2'd0      ;
      ARVALID_S4  = 1'd0      ; 
	  ARID_S5     = 8'd0      ;
      ARADDR_S5   = 32'd0     ;
      ARLEN_S5    = 4'd0      ;
      ARSIZE_S5   = 3'd0      ;
      ARBURST_S5  = 2'd0      ;
      ARVALID_S5  = 1'd0      ; 	  
	end
	
	else if(ARADDR[31:16]==16'd2)begin
	  ARID_S0     = 8'd0      ;
	  ARADDR_S0   = 32'd0     ;
	  ARLEN_S0    = 4'd0      ;
	  ARSIZE_S0   = 3'd0      ;
	  ARBURST_S0  = 2'd0      ;
	  ARVALID_S0  = 1'd0      ;  
	  ARID_S1     = 8'd0      ;
	  ARADDR_S1   = 32'd0     ;
	  ARLEN_S1    = 4'd0      ;
	  ARSIZE_S1   = 3'd0      ;
	  ARBURST_S1  = 2'd0      ;
	  ARVALID_S1  = 1'd0      ;	

	  ARID_S2     = {4'd0,ARID};
      ARADDR_S2   = ARADDR    ;
      ARLEN_S2    = ARLEN     ;
      ARSIZE_S2   = ARSIZE    ;
      ARBURST_S2  = ARBURST   ;
      ARVALID_S2  = ARVALID   ; 

	  ARID_S3     = 8'd0      ;
      ARADDR_S3   = 32'd0     ;
      ARLEN_S3    = 4'd0      ;
      ARSIZE_S3   = 3'd0      ;
      ARBURST_S3  = 2'd0      ;
      ARVALID_S3  = 1'd0      ; 

	  ARID_S4     = 8'd0      ;
      ARADDR_S4   = 32'd0     ;
      ARLEN_S4    = 4'd0      ;
      ARSIZE_S4   = 3'd0      ;
      ARBURST_S4  = 2'd0      ;
      ARVALID_S4  = 1'd0      ; 
	  
	  ARID_S5     = 8'd0      ;
      ARADDR_S5   = 32'd0     ;
      ARLEN_S5    = 4'd0      ;
      ARSIZE_S5   = 3'd0      ;
      ARBURST_S5  = 2'd0      ;
      ARVALID_S5  = 1'd0      ; 	  
	end
	else if((ARADDR[31:0]>=32'h1000_0000)&&(ARADDR[31:0]<=32'h1000_03ff))begin
	  ARID_S0     = 8'd0      ;
	  ARADDR_S0   = 32'd0     ;
	  ARLEN_S0    = 4'd0      ;
	  ARSIZE_S0   = 3'd0      ;
	  ARBURST_S0  = 2'd0      ;
	  ARVALID_S0  = 1'd0      ;  
	  ARID_S1     = 8'd0      ;
	  ARADDR_S1   = 32'd0     ;
	  ARLEN_S1    = 4'd0      ;
	  ARSIZE_S1   = 3'd0      ;
	  ARBURST_S1  = 2'd0      ;
	  ARVALID_S1  = 1'd0      ;	

	  ARID_S2     = 8'd0      ;
      ARADDR_S2   = 32'd0     ;
      ARLEN_S2    = 4'd0      ;
      ARSIZE_S2   = 3'd0      ;
      ARBURST_S2  = 2'd0      ;
      ARVALID_S2  = 1'd0      ;	

	  ARID_S3     = {4'd0,ARID};
      ARADDR_S3   = ARADDR    ;
      ARLEN_S3    = ARLEN     ;
      ARSIZE_S3   = ARSIZE    ;
      ARBURST_S3  = ARBURST   ;
      ARVALID_S3  = ARVALID   ; 

	  ARID_S4     = 8'd0      ;
      ARADDR_S4   = 32'd0     ;
      ARLEN_S4    = 4'd0      ;
      ARSIZE_S4   = 3'd0      ;
      ARBURST_S4  = 2'd0      ;
      ARVALID_S4  = 1'd0      ; 

	  ARID_S5     = 8'd0      ;
      ARADDR_S5   = 32'd0     ;
      ARLEN_S5    = 4'd0      ;
      ARSIZE_S5   = 3'd0      ;
      ARBURST_S5  = 2'd0      ;
      ARVALID_S5  = 1'd0      ; 	  
	end
	
	else if((ARADDR[31:0]>=32'h2000_0000)&&(ARADDR[31:0]<=32'h207f_ffff))begin
	  ARID_S0     = 8'd0      ;
	  ARADDR_S0   = 32'd0     ;
	  ARLEN_S0    = 4'd0      ;
	  ARSIZE_S0   = 3'd0      ;
	  ARBURST_S0  = 2'd0      ;
	  ARVALID_S0  = 1'd0      ;  
	  ARID_S1     = 8'd0      ;
	  ARADDR_S1   = 32'd0     ;
	  ARLEN_S1    = 4'd0      ;
	  ARSIZE_S1   = 3'd0      ;
	  ARBURST_S1  = 2'd0      ;
	  ARVALID_S1  = 1'd0      ;	

	  ARID_S2     = 8'd0      ;
      ARADDR_S2   = 32'd0     ;
      ARLEN_S2    = 4'd0      ;
      ARSIZE_S2   = 3'd0      ;
      ARBURST_S2  = 2'd0      ;
      ARVALID_S2  = 1'd0      ;	

	  ARID_S3     = 8'd0      ;
      ARADDR_S3   = 32'd0     ;
      ARLEN_S3    = 4'd0      ;
      ARSIZE_S3   = 3'd0      ;
      ARBURST_S3  = 2'd0      ;
      ARVALID_S3  = 1'd0      ;	

	  ARID_S4     = {4'd0,ARID};
      ARADDR_S4   = ARADDR    ;
      ARLEN_S4    = ARLEN     ;
      ARSIZE_S4   = ARSIZE    ;
      ARBURST_S4  = ARBURST   ;
      ARVALID_S4  = ARVALID   ; 

	  ARID_S5     = 8'd0      ;
      ARADDR_S5   = 32'd0     ;
      ARLEN_S5    = 4'd0      ;
      ARSIZE_S5   = 3'd0      ;
      ARBURST_S5  = 2'd0      ;
      ARVALID_S5  = 1'd0      ; 	  
	end
	
	else if(ARADDR[31:16]==16'h3000)begin
	  ARID_S0     = 8'd0      ;
	  ARADDR_S0   = 32'd0     ;
	  ARLEN_S0    = 4'd0      ;
	  ARSIZE_S0   = 3'd0      ;
	  ARBURST_S0  = 2'd0      ;
	  ARVALID_S0  = 1'd0      ;  
	  ARID_S1     = 8'd0      ;
	  ARADDR_S1   = 32'd0     ;
	  ARLEN_S1    = 4'd0      ;
	  ARSIZE_S1   = 3'd0      ;
	  ARBURST_S1  = 2'd0      ;
	  ARVALID_S1  = 1'd0      ;	

	  ARID_S2     = 8'd0      ;
      ARADDR_S2   = 32'd0     ;
      ARLEN_S2    = 4'd0      ;
      ARSIZE_S2   = 3'd0      ;
      ARBURST_S2  = 2'd0      ;
      ARVALID_S2  = 1'd0      ;	

	  ARID_S3     = 8'd0      ;
      ARADDR_S3   = 32'd0     ;
      ARLEN_S3    = 4'd0      ;
      ARSIZE_S3   = 3'd0      ;
      ARBURST_S3  = 2'd0      ;
      ARVALID_S3  = 1'd0      ; 

	  ARID_S4     = 8'd0      ;
      ARADDR_S4   = 32'd0     ;
      ARLEN_S4    = 4'd0      ;
      ARSIZE_S4   = 3'd0      ;
      ARBURST_S4  = 2'd0      ;
      ARVALID_S4  = 1'd0      ; 

	  ARID_S5     = {4'd0,ARID};
      ARADDR_S5   = ARADDR    ;
      ARLEN_S5    = ARLEN     ;
      ARSIZE_S5   = ARSIZE    ;
      ARBURST_S5  = ARBURST   ;
      ARVALID_S5  = ARVALID   ; 	  
	end
	
	else begin
	  ARID_S0     = 8'd0          ;
	  ARADDR_S0   = 32'd0         ;
	  ARLEN_S0    = 4'd0          ;
	  ARSIZE_S0   = 3'd0          ;
	  ARBURST_S0  = 2'd0          ;
	  ARVALID_S0  = 1'd0          ;  
	  ARID_S1     = 8'd0          ;
	  ARADDR_S1   = 32'd0         ;
	  ARLEN_S1    = 4'd0          ;
	  ARSIZE_S1   = 3'd0          ;
	  ARBURST_S1  = 2'd0          ;
	  ARVALID_S1  = 1'd0          ;		
	  
	  ARID_S2     = 8'd0      ;
      ARADDR_S2   = 32'd0     ;
      ARLEN_S2    = 4'd0      ;
      ARSIZE_S2   = 3'd0      ;
      ARBURST_S2  = 2'd0      ;
      ARVALID_S2  = 1'd0      ; 

	  ARID_S3     = 8'd0      ;
      ARADDR_S3   = 32'd0     ;
      ARLEN_S3    = 4'd0      ;
      ARSIZE_S3   = 3'd0      ;
      ARBURST_S3  = 2'd0      ;
      ARVALID_S3  = 1'd0      ; 

	  ARID_S4     = 8'd0      ;
      ARADDR_S4   = 32'd0     ;
      ARLEN_S4    = 4'd0      ;
      ARSIZE_S4   = 3'd0      ;
      ARBURST_S4  = 2'd0      ;
      ARVALID_S4  = 1'd0      ; 
	  
      ARID_S5     = 8'd0      ;
      ARADDR_S5   = 32'd0     ;
      ARLEN_S5    = 4'd0      ;
      ARSIZE_S5   = 3'd0      ;
      ARBURST_S5  = 2'd0      ;
      ARVALID_S5  = 1'd0      ; 
	end
//end
/*
else begin
	  ARID_S0     = 8'd0          ;
	  //ARADDR_S0   = 32'd0         ;
	  ARLEN_S0    = 4'd0          ;
	  ARSIZE_S0   = 3'd0          ;
	  ARBURST_S0  = 2'd0          ;
	  ARVALID_S0  = 1'd0          ;  
	  ARID_S1     = 8'd0          ;
	  //ARADDR_S1   = 32'd0         ;
	  ARLEN_S1    = 4'd0          ;
	  ARSIZE_S1   = 3'd0          ;
	  ARBURST_S1  = 2'd0          ;
	  ARVALID_S1  = 1'd0          ;	
end
*/
end

//W decoder
always_comb begin
  case(CS_W)
    `WRITE_DATA_M1S0: begin
	  WDATA_S0   = WDATA  ;
	  WSTRB_S0   = WSTRB  ;
	  WLAST_S0   = WLAST  ;
	  WVALID_S0  = WVALID ;
	  WDATA_S1   = 32'd0  ;
	  WSTRB_S1   = 4'd0   ;
	  WLAST_S1   = 1'd0   ;
	  WVALID_S1  = 1'd0   ;	 
	  WDATA_S2   = 32'd0  ;
	  WSTRB_S2   = 4'd0   ;
	  WLAST_S2   = 1'd0   ;
	  WVALID_S2  = 1'd0   ;	 
	  
	  WDATA_S3   = 32'd0  ;
	  WSTRB_S3   = 4'd0   ;
	  WLAST_S3   = 1'd0   ;
	  WVALID_S3  = 1'd0   ;	  
	  
	  WDATA_S4   = 32'd0  ;
	  WSTRB_S4   = 4'd0   ;
	  WLAST_S4   = 1'd0   ;
	  WVALID_S4  = 1'd0   ;
	  
	  WDATA_S5   = 32'd0  ;
	  WSTRB_S5   = 4'd0   ;
	  WLAST_S5   = 1'd0   ;
	  WVALID_S5  = 1'd0   ;
	end
	`WRITE_DATA_M1S1: begin
	  WDATA_S0   = 32'd0      ;
	  WSTRB_S0   = 4'd0       ;
	  WLAST_S0   = 1'd0       ;
	  WVALID_S0  = 1'd0       ;	  
	  WDATA_S1   = WDATA  ; 
	  WSTRB_S1   = WSTRB  ; 
	  WLAST_S1   = WLAST  ; 
	  WVALID_S1  = WVALID ; 
	  WDATA_S2   = 32'd0  ;
	  WSTRB_S2   = 4'd0   ;
	  WLAST_S2   = 1'd0   ;
	  WVALID_S2  = 1'd0   ;	

	  WDATA_S3   = 32'd0  ;
	  WSTRB_S3   = 4'd0   ;
	  WLAST_S3   = 1'd0   ;
	  WVALID_S3  = 1'd0   ;	
 
	  WDATA_S4   = 32'd0  ;
	  WSTRB_S4   = 4'd0   ;
	  WLAST_S4   = 1'd0   ;
	  WVALID_S4  = 1'd0   ;	 
	  WDATA_S5   = 32'd0  ;
	  WSTRB_S5   = 4'd0   ;
	  WLAST_S5   = 1'd0   ;
	  WVALID_S5  = 1'd0   ;	  
	end
	`WRITE_DATA_M1S2: begin
	  WDATA_S0   = 32'd0      ;
	  WSTRB_S0   = 4'd0       ;
	  WLAST_S0   = 1'd0       ;
	  WVALID_S0  = 1'd0       ;	  
	  WDATA_S1   = 32'd0  ; 
	  WSTRB_S1   = 4'd0   ; 
	  WLAST_S1   = 1'd0   ; 
	  WVALID_S1  = 1'd0   ; 
	  WDATA_S2   = WDATA  ;
	  WSTRB_S2   = WSTRB  ;
	  WLAST_S2   = WLAST  ;
	  WVALID_S2  = WVALID ;	 
	  
	  WDATA_S3   = 32'd0  ;
	  WSTRB_S3   = 4'd0   ;
	  WLAST_S3   = 1'd0   ;
	  WVALID_S3  = 1'd0   ;	  
	  
	  WDATA_S4   = 32'd0  ;
	  WSTRB_S4   = 4'd0   ;
	  WLAST_S4   = 1'd0   ;
	  WVALID_S4  = 1'd0   ;	
	  WDATA_S5   = 32'd0  ;
	  WSTRB_S5   = 4'd0   ;
	  WLAST_S5   = 1'd0   ;
	  WVALID_S5  = 1'd0   ;	  
	end
	`WRITE_DATA_M1S3: begin
	  WDATA_S0   = 32'd0      ;
	  WSTRB_S0   = 4'd0       ;
	  WLAST_S0   = 1'd0       ;
	  WVALID_S0  = 1'd0       ;	  
	  WDATA_S1   = 32'd0  ; 
	  WSTRB_S1   = 4'd0   ; 
	  WLAST_S1   = 1'd0   ; 
	  WVALID_S1  = 1'd0   ; 
	  WDATA_S2   = 32'd0  ;
	  WSTRB_S2   = 4'd0   ;
	  WLAST_S2   = 1'd0   ;
	  WVALID_S2  = 1'd0   ; 
	  WDATA_S3   = WDATA  ;
	  WSTRB_S3   = WSTRB  ;
	  WLAST_S3   = WLAST  ;
	  WVALID_S3  = WVALID ;	  
	  WDATA_S4   = 32'd0  ;
	  WSTRB_S4   = 4'd0   ;
	  WLAST_S4   = 1'd0   ;
	  WVALID_S4  = 1'd0   ;
	  WDATA_S5   = 32'd0  ;
	  WSTRB_S5   = 4'd0   ;
	  WLAST_S5   = 1'd0   ;
	  WVALID_S5  = 1'd0   ;	  
	end
	`WRITE_DATA_M1S4: begin
	  WDATA_S0   = 32'd0      ;
	  WSTRB_S0   = 4'd0       ;
	  WLAST_S0   = 1'd0       ;
	  WVALID_S0  = 1'd0       ;	  
	  WDATA_S1   = 32'd0  ; 
	  WSTRB_S1   = 4'd0   ; 
	  WLAST_S1   = 1'd0   ; 
	  WVALID_S1  = 1'd0   ; 
	  WDATA_S2   = 32'd0  ;
	  WSTRB_S2   = 4'd0   ;
	  WLAST_S2   = 1'd0   ;
	  WVALID_S2  = 1'd0   ; 
	  
	  WDATA_S3   = 32'd0  ;
	  WSTRB_S3   = 4'd0   ;
	  WLAST_S3   = 1'd0   ;
	  WVALID_S3  = 1'd0   ;	
	  
	  WDATA_S4   = WDATA  ;
	  WSTRB_S4   = WSTRB  ;
	  WLAST_S4   = WLAST  ;
	  WVALID_S4  = WVALID ; 
	  WDATA_S5   = 32'd0  ;
	  WSTRB_S5   = 4'd0   ;
	  WLAST_S5   = 1'd0   ;
	  WVALID_S5  = 1'd0   ;
	end
	`WRITE_DATA_M1S5: begin
	  WDATA_S0   = 32'd0      ;
	  WSTRB_S0   = 4'd0       ;
	  WLAST_S0   = 1'd0       ;
	  WVALID_S0  = 1'd0       ;	  
	  WDATA_S1   = 32'd0  ; 
	  WSTRB_S1   = 4'd0   ; 
	  WLAST_S1   = 1'd0   ; 
	  WVALID_S1  = 1'd0   ; 
	  WDATA_S2   = 32'd0  ;
	  WSTRB_S2   = 4'd0   ;
	  WLAST_S2   = 1'd0   ;
	  WVALID_S2  = 1'd0   ; 
	  
	  WDATA_S3   = 32'd0  ;
	  WSTRB_S3   = 4'd0   ;
	  WLAST_S3   = 1'd0   ;
	  WVALID_S3  = 1'd0   ;	
	  
	  WDATA_S4   = 32'd0  ;
	  WSTRB_S4   = 4'd0   ;
	  WLAST_S4   = 1'd0   ;
	  WVALID_S4  = 1'd0   ;	 
	  WDATA_S5   = WDATA  ;
	  WSTRB_S5   = WSTRB  ;
	  WLAST_S5   = WLAST  ;
	  WVALID_S5  = WVALID ;
	end
	
	
    `WRITE_M1_SIM_S0: begin
	  WDATA_S0   = WDATA  ;
	  WSTRB_S0   = WSTRB  ;
	  WLAST_S0   = WLAST  ;
	  WVALID_S0  = WVALID ;
	  WDATA_S1   = 32'd0      ;
	  WSTRB_S1   = 4'd0       ;
	  WLAST_S1   = 1'd0       ;
	  WVALID_S1  = 1'd0       ;	
	  WDATA_S2   = 32'd0  ;
	  WSTRB_S2   = 4'd0   ;
	  WLAST_S2   = 1'd0   ;
	  WVALID_S2  = 1'd0   ;	 
	  
	  WDATA_S3   = 32'd0  ;
	  WSTRB_S3   = 4'd0   ;
	  WLAST_S3   = 1'd0   ;
	  WVALID_S3  = 1'd0   ;	 
  
	  WDATA_S4   = 32'd0  ;
	  WSTRB_S4   = 4'd0   ;
	  WLAST_S4   = 1'd0   ;
	  WVALID_S4  = 1'd0   ;	  
	  WDATA_S5   = 32'd0  ;
	  WSTRB_S5   = 4'd0   ;
	  WLAST_S5   = 1'd0   ;
	  WVALID_S5  = 1'd0   ;
	end
	`WRITE_M1_SIM_S1: begin
	  WDATA_S0   = 32'd0      ;
	  WSTRB_S0   = 4'd0       ;
	  WLAST_S0   = 1'd0       ;
	  WVALID_S0  = 1'd0       ;	  
	  WDATA_S1   = WDATA      ; 
	  WSTRB_S1   = WSTRB      ; 
	  WLAST_S1   = WLAST      ; 
	  WVALID_S1  = WVALID     ; 
	  WDATA_S2   = 32'd0  ;
	  WSTRB_S2   = 4'd0   ;
	  WLAST_S2   = 1'd0   ;
	  WVALID_S2  = 1'd0   ;	 
	  
	  WDATA_S3   = 32'd0  ;
	  WSTRB_S3   = 4'd0   ;
	  WLAST_S3   = 1'd0   ;
	  WVALID_S3  = 1'd0   ;	  
	  
	  WDATA_S4   = 32'd0  ;
	  WSTRB_S4   = 4'd0   ;
	  WLAST_S4   = 1'd0   ;
	  WVALID_S4  = 1'd0   ;	

	  WDATA_S5   = 32'd0  ;
	  WSTRB_S5   = 4'd0   ;
	  WLAST_S5   = 1'd0   ;
	  WVALID_S5  = 1'd0   ;	  
	end
	`WRITE_M1_SIM_S2: begin
	  WDATA_S0   = 32'd0      ;
	  WSTRB_S0   = 4'd0       ;
	  WLAST_S0   = 1'd0       ;
	  WVALID_S0  = 1'd0       ;	  
	  WDATA_S1   = 32'd0      ; 
	  WSTRB_S1   = 4'd0       ; 
	  WLAST_S1   = 1'd0       ;
	  WVALID_S1  = 1'd0       ;
	  WDATA_S2   = WDATA      ;
	  WSTRB_S2   = WSTRB      ;
	  WLAST_S2   = WLAST      ; 
	  WVALID_S2  = WVALID     ; 
  
	  WDATA_S3   = 32'd0  ;
	  WSTRB_S3   = 4'd0   ;
	  WLAST_S3   = 1'd0   ;
	  WVALID_S3  = 1'd0   ;	  
	  
	  WDATA_S4   = 32'd0  ;
	  WSTRB_S4   = 4'd0   ;
	  WLAST_S4   = 1'd0   ;
	  WVALID_S4  = 1'd0   ;	  
	  
	  WDATA_S5   = 32'd0  ;
	  WSTRB_S5   = 4'd0   ;
	  WLAST_S5   = 1'd0   ;
	  WVALID_S5  = 1'd0   ;
	end
	`WRITE_M1_SIM_S3: begin
	  WDATA_S0   = 32'd0      ;
	  WSTRB_S0   = 4'd0       ;
	  WLAST_S0   = 1'd0       ;
	  WVALID_S0  = 1'd0       ;	  
	  WDATA_S1   = 32'd0      ; 
	  WSTRB_S1   = 4'd0       ; 
	  WLAST_S1   = 1'd0       ;
	  WVALID_S1  = 1'd0       ;
	  WDATA_S2   = 32'd0  ;
	  WSTRB_S2   = 4'd0   ;
	  WLAST_S2   = 1'd0   ;
	  WVALID_S2  = 1'd0   ;	
	  WDATA_S3   = WDATA      ;
	  WSTRB_S3   = WSTRB      ;
	  WLAST_S3   = WLAST      ; 
	  WVALID_S3  = WVALID     ;   
	  WDATA_S4   = 32'd0  ;
	  WSTRB_S4   = 4'd0   ;
	  WLAST_S4   = 1'd0   ;
	  WVALID_S4  = 1'd0   ;	

	  WDATA_S5   = 32'd0  ;
	  WSTRB_S5   = 4'd0   ;
	  WLAST_S5   = 1'd0   ;
	  WVALID_S5  = 1'd0   ;	  
	end
	`WRITE_M1_SIM_S4: begin
	  WDATA_S0   = 32'd0      ;
	  WSTRB_S0   = 4'd0       ;
	  WLAST_S0   = 1'd0       ;
	  WVALID_S0  = 1'd0       ;	  
	  WDATA_S1   = 32'd0      ; 
	  WSTRB_S1   = 4'd0       ; 
	  WLAST_S1   = 1'd0       ;
	  WVALID_S1  = 1'd0       ;
	  WDATA_S2   = 32'd0  ;
	  WSTRB_S2   = 4'd0   ;
	  WLAST_S2   = 1'd0   ;
	  WVALID_S2  = 1'd0   ;	
	  
	  WDATA_S3   = 32'd0  ;
	  WSTRB_S3   = 4'd0   ;
	  WLAST_S3   = 1'd0   ;
	  WVALID_S3  = 1'd0   ;	  
	  
	  WDATA_S4   = WDATA      ;
	  WSTRB_S4   = WSTRB      ;
	  WLAST_S4   = WLAST      ; 
	  WVALID_S4  = WVALID     ;  

	  WDATA_S5   = 32'd0  ;
	  WSTRB_S5   = 4'd0   ;
	  WLAST_S5   = 1'd0   ;
	  WVALID_S5  = 1'd0   ;	  
	end
	
	`WRITE_M1_SIM_S5: begin
	  WDATA_S0   = 32'd0      ;
	  WSTRB_S0   = 4'd0       ;
	  WLAST_S0   = 1'd0       ;
	  WVALID_S0  = 1'd0       ;	  
	  WDATA_S1   = 32'd0      ; 
	  WSTRB_S1   = 4'd0       ; 
	  WLAST_S1   = 1'd0       ;
	  WVALID_S1  = 1'd0       ;
	  WDATA_S2   = 32'd0  ;
	  WSTRB_S2   = 4'd0   ;
	  WLAST_S2   = 1'd0   ;
	  WVALID_S2  = 1'd0   ;	
	  
	  WDATA_S3   = 32'd0  ;
	  WSTRB_S3   = 4'd0   ;
	  WLAST_S3   = 1'd0   ;
	  WVALID_S3  = 1'd0   ;	  
	  
	  WDATA_S4   = 32'd0  ;
	  WSTRB_S4   = 4'd0   ;
	  WLAST_S4   = 1'd0   ;
	  WVALID_S4  = 1'd0   ;	  

	  WDATA_S5   = WDATA      ;
	  WSTRB_S5   = WSTRB      ;
	  WLAST_S5   = WLAST      ; 
	  WVALID_S5  = WVALID     ;  
	end
	
	default:begin
	  WDATA_S0   = 32'd0      ;
	  WSTRB_S0   = 4'd0       ;
	  WLAST_S0   = 1'd0       ;
	  WVALID_S0  = 1'd0       ;	  
	  WDATA_S1   = 32'd0      ; 
	  WSTRB_S1   = 4'd0       ; 
	  WLAST_S1   = 1'd0       ; 
	  WVALID_S1  = 1'd0       ; 
	  WDATA_S2   = 32'd0  ;
	  WSTRB_S2   = 4'd0   ;
	  WLAST_S2   = 1'd0   ;
	  WVALID_S2  = 1'd0   ;
	  
	  WDATA_S3   = 32'd0  ;
	  WSTRB_S3   = 4'd0   ;
	  WLAST_S3   = 1'd0   ;
	  WVALID_S3  = 1'd0   ;	  
	  
	  WDATA_S4   = 32'd0  ;
	  WSTRB_S4   = 4'd0   ;
	  WLAST_S4   = 1'd0   ;
	  WVALID_S4  = 1'd0   ;	  
	  
	  WDATA_S5   = 32'd0  ;
	  WSTRB_S5   = 4'd0   ;
	  WLAST_S5   = 1'd0   ;
	  WVALID_S5  = 1'd0   ;
	end
  endcase  
end



always_comb begin
  case(CS_W)
	`WRITE_B_M1S0: begin
	   BREADY_S0 = BREADY ;
	   BREADY_S1 = 1'b0   ;
	   BREADY_S2 = 1'b0   ;
	   
	   BREADY_S3 = 1'b0   ;
	   
	   BREADY_S4 = 1'b0   ;
	   BREADY_S5 = 1'b0   ;
	end
	`WRITE_B_M1S1: begin
	   BREADY_S0 = 1'b0   ;
	   BREADY_S1 = BREADY ;	  
	   BREADY_S2 = 1'b0   ;
	   
	   BREADY_S3 = 1'b0   ;
	   
	   BREADY_S4 = 1'b0   ;
	   BREADY_S5 = 1'b0   ;
	end
	`WRITE_B_M1S2: begin
	   BREADY_S0 = 1'b0   ;
	   BREADY_S1 = 1'b0   ;
	   BREADY_S2 = BREADY ;	
	   
	   BREADY_S3 = 1'b0   ;
	   
	   BREADY_S4 = 1'b0   ;
	   BREADY_S5 = 1'b0   ;
	end
	`WRITE_B_M1S3: begin
	   BREADY_S0 = 1'b0   ;
	   BREADY_S1 = 1'b0   ;
	   BREADY_S2 = 1'b0   ;  
	   BREADY_S3 = BREADY ;	
	   BREADY_S4 = 1'b0   ;
	   BREADY_S5 = 1'b0   ;
	end
	`WRITE_B_M1S4: begin
	   BREADY_S0 = 1'b0   ;
	   BREADY_S1 = 1'b0   ;
	   BREADY_S2 = 1'b0   ;
	   
	   BREADY_S3 = 1'b0   ;
	   
	   BREADY_S4 = BREADY ;	
	   BREADY_S5 = 1'b0   ;
	end
	`WRITE_B_M1S5: begin
	   BREADY_S0 = 1'b0   ;
	   BREADY_S1 = 1'b0   ;
	   BREADY_S2 = 1'b0   ;
	   
	   BREADY_S3 = 1'b0   ;
	   
	   BREADY_S4 = 1'b0   ;
	   BREADY_S5 = BREADY ;	
	end
	
	default:begin
	   BREADY_S0 = 1'b0   ;
	   BREADY_S1 = 1'b0   ;		
	   BREADY_S2 = 1'b0   ;
	   
	   BREADY_S3 = 1'b0   ;
	   
	   BREADY_S4 = 1'b0   ;
	   BREADY_S5 = 1'b0   ;
	end
  endcase  
end

always_comb begin
  case(CS_R)
    `READ_DATA_M0S0: begin
	   RREADY_S0 = RREADY ;
	   RREADY_S1 = 1'b0   ;	
	   RREADY_S2 = 1'b0   ;
   
	   RREADY_S3 = 1'b0   ;	
	   
	   RREADY_S4 = 1'b0   ;		  
	   RREADY_S5 = 1'b0   ;		   
	end
    `READ_DATA_M1S0: begin
	   RREADY_S0 = RREADY ;
	   RREADY_S1 = 1'b0   ;	
	   RREADY_S2 = 1'b0   ;	
   
	   RREADY_S3 = 1'b0   ;	
	   
	   RREADY_S4 = 1'b0   ;	
	   RREADY_S5 = 1'b0   ;		 	   
	end	
	`READ_DATA_M0S1: begin
	   RREADY_S0 = 1'b0   ;
	   RREADY_S1 = RREADY ;	
	   RREADY_S2 = 1'b0   ;	
	   
	   RREADY_S3 = 1'b0   ;	
	   
	   RREADY_S4 = 1'b0   ;		
	   RREADY_S5 = 1'b0   ;		 	   
	end
	`READ_DATA_M1S1: begin
	   RREADY_S0 = 1'b0   ;
	   RREADY_S1 = RREADY ;	
	   RREADY_S2 = 1'b0   ;		
	   RREADY_S3 = 1'b0   ;	
	   RREADY_S4 = 1'b0   ;	
	   RREADY_S5 = 1'b0   ;		 	   
	end	
	`READ_DATA_M0S2: begin
	   RREADY_S0 = 1'b0   ;
	   RREADY_S1 = 1'b0   ;	
	   RREADY_S2 = RREADY ;		
	   RREADY_S3 = 1'b0   ;	
	   RREADY_S4 = 1'b0   ;	
	   RREADY_S5 = 1'b0   ;		 	   
	end
	`READ_DATA_M1S2: begin
	   RREADY_S0 = 1'b0   ;
	   RREADY_S1 = 1'b0   ;
	   RREADY_S2 = RREADY ;			
	   RREADY_S3 = 1'b0   ;	
	   RREADY_S4 = 1'b0   ;	
	   RREADY_S5 = 1'b0   ;		 	   
	end	
	`READ_DATA_M0S3: begin
	   RREADY_S0 = 1'b0   ;
	   RREADY_S1 = 1'b0   ;	
	   RREADY_S2 = 1'b0   ;	
	   RREADY_S3 = RREADY ;		
	   RREADY_S4 = 1'b0   ;	
	   RREADY_S5 = 1'b0   ;		 	   
	end
	`READ_DATA_M1S3: begin
	   RREADY_S0 = 1'b0   ;
	   RREADY_S1 = 1'b0   ;
	   RREADY_S2 = 1'b0   ;		
	   RREADY_S3 = RREADY ;		
	   RREADY_S4 = 1'b0   ;	
	   RREADY_S5 = 1'b0   ;		 	   
	end	
	`READ_DATA_M0S4: begin
	   RREADY_S0 = 1'b0   ;
	   RREADY_S1 = 1'b0   ;	
	   RREADY_S2 = 1'b0   ;	
	   RREADY_S3 = 1'b0   ;	
	   RREADY_S4 = RREADY ;	
	   RREADY_S5 = 1'b0   ;		 	   
	end
	`READ_DATA_M1S4: begin
	   RREADY_S0 = 1'b0   ;
	   RREADY_S1 = 1'b0   ;
	   RREADY_S2 = 1'b0   ;		
	   RREADY_S3 = 1'b0   ;				
	   RREADY_S4 = RREADY ;   
	   RREADY_S5 = 1'b0   ;		 
	end		
	`READ_DATA_M0S5: begin
	   RREADY_S0 = 1'b0   ;
	   RREADY_S1 = 1'b0   ;	
	   RREADY_S2 = 1'b0   ;	
	   RREADY_S3 = 1'b0   ;	
	   RREADY_S4 = 1'b0   ;	
	   RREADY_S5 = RREADY ;	 	   
	end
	`READ_DATA_M1S5: begin
	   RREADY_S0 = 1'b0   ;
	   RREADY_S1 = 1'b0   ;
	   RREADY_S2 = 1'b0   ;		
	   RREADY_S3 = 1'b0   ;				
	   RREADY_S4 = 1'b0   ;	
	   RREADY_S5 = RREADY ;  	 
	end	
	
	/*`READ_AR_R_M0S0||`READ_AR_R_M1S0: begin
	   RREADY_S0 = RREADY ;
	   RREADY_S1 = 1'b0  ;
	end
	`READ_AR_R_M0S1||`READ_AR_R_M1S1: begin
	   RREADY_S0 = 1'b0   ;
	   RREADY_S1 = RREADY ;
	end*/



	default:begin
	   RREADY_S0 = 1'b0   ;
	   RREADY_S1 = 1'b0   ;	
	   RREADY_S2 = 1'b0   ;		
	   RREADY_S3 = 1'b0   ;	
	   RREADY_S4 = 1'b0   ;	
	   RREADY_S5 = 1'b0   ;		 	   
	end
  endcase  
end

endmodule 
