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
`define READ_AR_R_M1S1       5'b10011*/
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

module Mux2 (
    input logic ACLK,
	input logic ARESETn,
	input logic [5:0]CS_R,
	input logic [5:0]CS_W,  
	input logic [5:0]NS_R,
	input logic [5:0]NS_W, 	
	input logic [`AXI_IDS_BITS-1:0]  RID_S0   ,
	input logic [`AXI_DATA_BITS-1:0] RDATA_S0 ,
	input logic [1:0]                RRESP_S0 ,
	input logic                      RLAST_S0 ,
	input logic                      RVALID_S0,
	input logic [`AXI_IDS_BITS-1:0]  RID_S1   ,
	input logic [`AXI_DATA_BITS-1:0] RDATA_S1 ,
	input logic [1:0]                RRESP_S1 ,
	input logic                      RLAST_S1 ,
	input logic                      RVALID_S1,
	input logic [`AXI_IDS_BITS-1:0]  RID_S2   ,
	input logic [`AXI_DATA_BITS-1:0] RDATA_S2 ,
	input logic [1:0]                RRESP_S2 ,
	input logic                      RLAST_S2 ,
	input logic                      RVALID_S2,	
	
	input logic [`AXI_IDS_BITS-1:0]  RID_S3   ,
	input logic [`AXI_DATA_BITS-1:0] RDATA_S3 ,
	input logic [1:0]                RRESP_S3 ,
	input logic                      RLAST_S3 ,
	input logic                      RVALID_S3,	
	
	input logic [`AXI_IDS_BITS-1:0]  RID_S4   ,
	input logic [`AXI_DATA_BITS-1:0] RDATA_S4 ,
	input logic [1:0]                RRESP_S4 ,
	input logic                      RLAST_S4 ,
	input logic                      RVALID_S4,
	
	input logic [`AXI_IDS_BITS-1:0]  RID_S5   ,
	input logic [`AXI_DATA_BITS-1:0] RDATA_S5 ,
	input logic [1:0]                RRESP_S5 ,
	input logic                      RLAST_S5 ,
	input logic                      RVALID_S5,	
	
	
	input logic [`AXI_IDS_BITS-1:0]  BID_S0   ,
	input logic [1:0]                BRESP_S0 ,
	input logic                      BVALID_S0,
	input logic [`AXI_IDS_BITS-1:0]  BID_S1   ,
	input logic [1:0]                BRESP_S1 ,
	input logic                      BVALID_S1,
	input logic [`AXI_IDS_BITS-1:0]  BID_S2   ,
	input logic [1:0]                BRESP_S2 ,
	input logic                      BVALID_S2,	
	
	input logic [`AXI_IDS_BITS-1:0]  BID_S3   ,
	input logic [1:0]                BRESP_S3 ,
	input logic                      BVALID_S3,	
	
	input logic [`AXI_IDS_BITS-1:0]  BID_S4   ,
	input logic [1:0]                BRESP_S4 ,
	input logic                      BVALID_S4,	
	
	input logic [`AXI_IDS_BITS-1:0]  BID_S5   ,
	input logic [1:0]                BRESP_S5 ,
	input logic                      BVALID_S5,		
	
    input logic AWREADY_S0,
    input logic AWREADY_S1,
    input logic AWREADY_S2,
	
    input logic AWREADY_S3,
	
    input logic AWREADY_S4,	
	input logic AWREADY_S5,	
	
    input logic ARREADY_S0,
    input logic ARREADY_S1,
	input logic ARREADY_S2,
	
	input logic ARREADY_S3,
	
	input logic ARREADY_S4,	
	input logic ARREADY_S5,	
    input logic WREADY_S0 ,
    input logic WREADY_S1 ,
    input logic WREADY_S2 ,	
	
    input logic WREADY_S3 ,
	
    input logic WREADY_S4 ,
    input logic WREADY_S5 ,	
    input logic [1:0] RRESP_default,
    input logic [1:0] BRESP_default,
    input logic ARVALID,	
	input logic [`AXI_ADDR_BITS-1:0]ARADDR_M0,
	input logic [`AXI_ADDR_BITS-1:0]AWADDR_M1,
	input logic [`AXI_ADDR_BITS-1:0]ARADDR_M1,
	output logic [`AXI_IDS_BITS-1:0]  RID   ,
	output logic [`AXI_DATA_BITS-1:0] RDATA ,
	output logic [1:0]                RRESP ,
	output logic                     RLAST ,
	output logic                     RVALID,	
	output logic [`AXI_IDS_BITS-1:0] BID   ,
	output logic [1:0]               BRESP ,
	output logic                    BVALID,
    output logic AWREADY,
    output logic WREADY,
    output logic ARREADY
);
/*
always_comb
begin
		  case(CS_R)
		    `READ_DATA_M0S0 :begin
		      RID       =     RID_S0       ;
		      RDATA     =     RDATA_S0     ;
		      RRESP     =     RRESP_S0     ;
		      RLAST     =     RLAST_S0     ;
		      RVALID    =     RVALID_S0    ;
			end
		    `READ_DATA_M1S0:begin
		      RID       =     RID_S0       ;
		      RDATA     =     RDATA_S0     ;
		      RRESP     =     RRESP_S0     ;
		      RLAST     =     RLAST_S0     ;
		      RVALID    =     RVALID_S0    ;
			end			
			`READ_DATA_M0S1:begin
		      RID       =     RID_S1       ;
		      RDATA     =     RDATA_S1     ;
		      RRESP     =     RRESP_S1     ;
		      RLAST     =     RLAST_S1     ;
		      RVALID    =     RVALID_S1    ;                   
			end
			`READ_DATA_M1S1:begin
		      RID       =     RID_S1       ;
		      RDATA     =     RDATA_S1     ;
		      RRESP     =     RRESP_S1     ;
		      RLAST     =     RLAST_S1     ;
		      RVALID    =     RVALID_S1    ;                   
			end			
			`default_slave:begin
		      RID       =     8'd0            ;
		      RDATA     =     32'd0           ;
		      RRESP     =     `AXI_RESP_DECERR;
		      RLAST     =     1'd0            ;
		      RVALID    =     1'd0            ;	  
			end			
			default:begin
		      RID       =     8'd0            ;
		      RDATA     =     32'd0           ;
		      RRESP     =     2'd0            ;
		      RLAST     =     1'd0            ;
		      RVALID    =     1'd0            ;	  
			end
		  endcase
end

always_comb
begin
		  case(CS_W)
		    `WRITE_B_M1S0:begin
		      BID        =   BID_S0        ;
		      BRESP      =   BRESP_S0      ;
		      BVALID     =   BVALID_S0     ;
			end
			`WRITE_B_M1S1:begin
		      BID        =   BID_S1        ;
		      BRESP      =   BRESP_S1      ;
		      BVALID     =   BVALID_S1     ;
			end
			`default_slave:begin
		      BID        =   8'd0          ;
		      BRESP      =  `AXI_RESP_DECERR;
		      BVALID     =   1'd0             ;	  
			end			
			default:begin
		      BID        =   8'd0             ;
		      BRESP      =   2'd0             ;
		      BVALID     =   1'd0             ;	  
			end
		  endcase
end

always_comb
begin
  case(CS_R)
    `READ_ADDR_M0:begin
	  if(ARADDR_M0[31:16]==16'd0)
         ARREADY = ARREADY_S0;
	  else if(ARADDR_M0[31:16]==16'd1)	
         ARREADY = ARREADY_S1;
      else 	ARREADY = 1'd0;	 
	end
	`READ_ADDR_M1:begin
	  if(ARADDR_M1[31:16]==16'd0)
         ARREADY = ARREADY_S0;
	  else if(ARADDR_M1[31:16]==16'd1)	
         ARREADY = ARREADY_S1;
      else 	ARREADY = 1'd0;	
	end
	default:begin
	  ARREADY = 1'd0;  
	end
  endcase
end

always_comb
begin
  case(CS_W)
    `WRITE_ADDR_M1:begin
	     if(AWADDR_M1[31:16]==16'd0)
	       AWREADY = AWREADY_S0;
		 else if(AWADDR_M1[31:16]==16'd1)
	       AWREADY = AWREADY_S1; 
		 else AWREADY = 1'd0;	
	end
     `WRITE_M1_SIM_S0:begin
	       AWREADY = AWREADY_S0;
	end
    `WRITE_M1_SIM_S1:begin
	       AWREADY = AWREADY_S1;	
	end       
	default:begin
	  AWREADY = 1'd0;  
	end
  endcase
end

always_comb
begin
  case(CS_W)
     `WRITE_DATA_M1S0:begin
      WREADY = WREADY_S0;
	end
	`WRITE_DATA_M1S1:begin
      WREADY = WREADY_S1;
	end
     `WRITE_M1_SIM_S0:begin
      WREADY = WREADY_S0;
	end
	`WRITE_M1_SIM_S1:begin
      WREADY = WREADY_S1;
	end
	default:begin
	  WREADY = 1'd0;  
	end
 dmodule

*/

always_comb begin
		  case(CS_R)
		  	`READ_DATA_M0S0 :begin
		      RID       =     RID_S0       ;
		      RDATA     =     RDATA_S0     ;
		      RRESP     =     RRESP_S0     ;
		      RLAST     =     RLAST_S0     ;
		      RVALID    =     RVALID_S0    ;
			end
		   	`READ_DATA_M1S0:begin
		      RID       =     RID_S0       ;
		      RDATA     =     RDATA_S0     ;
		      RRESP     =     RRESP_S0     ;
		      RLAST     =     RLAST_S0     ;
		      RVALID    =     RVALID_S0    ;
			end			
			`READ_DATA_M0S1:begin
		      RID       =     RID_S1       ;
		      RDATA     =     RDATA_S1     ;
		      RRESP     =     RRESP_S1     ;
		      RLAST     =     RLAST_S1     ;
		      RVALID    =     RVALID_S1    ;                   
			end
			`READ_DATA_M1S1:begin
		      RID       =     RID_S1       ;
		      RDATA     =     RDATA_S1     ;
		      RRESP     =     RRESP_S1     ;
		      RLAST     =     RLAST_S1     ;
		      RVALID    =     RVALID_S1    ;                  
			end	
			`READ_DATA_M0S2:begin
		      RID       =     RID_S2       ;
		      RDATA     =     RDATA_S2     ;
		      RRESP     =     RRESP_S2     ;
		      RLAST     =     RLAST_S2     ;
		      RVALID    =     RVALID_S2    ;                   
			end
			`READ_DATA_M1S2:begin
		      RID       =     RID_S2       ;
		      RDATA     =     RDATA_S2     ;
		      RRESP     =     RRESP_S2     ;
		      RLAST     =     RLAST_S2     ;
		      RVALID    =     RVALID_S2    ;                  
			end	
			`READ_DATA_M0S3:begin
		      RID       =     RID_S3       ;
		      RDATA     =     RDATA_S3     ;
		      RRESP     =     RRESP_S3     ;
		      RLAST     =     RLAST_S3     ;
		      RVALID    =     RVALID_S3    ;                   
			end
			`READ_DATA_M1S3:begin
		      RID       =     RID_S3       ;
		      RDATA     =     RDATA_S3     ;
		      RRESP     =     RRESP_S3     ;
		      RLAST     =     RLAST_S3     ;
		      RVALID    =     RVALID_S3    ;                  
			end	
			`READ_DATA_M0S4:begin
		      RID       =     RID_S4       ;
		      RDATA     =     RDATA_S4     ;
		      RRESP     =     RRESP_S4     ;
		      RLAST     =     RLAST_S4     ;
		      RVALID    =     RVALID_S4    ;                   
			end
			`READ_DATA_M1S4:begin
		      RID       =     RID_S4       ;
		      RDATA     =     RDATA_S4     ;
		      RRESP     =     RRESP_S4     ;
		      RLAST     =     RLAST_S4     ;
		      RVALID    =     RVALID_S4    ;                  
			end		

			`READ_DATA_M0S5:begin
		      RID       =     RID_S5       ;
		      RDATA     =     RDATA_S5     ;
		      RRESP     =     RRESP_S5     ;
		      RLAST     =     RLAST_S5     ;
		      RVALID    =     RVALID_S5    ;                   
			end
			`READ_DATA_M1S5:begin
		      RID       =     RID_S5       ;
		      RDATA     =     RDATA_S5     ;
		      RRESP     =     RRESP_S5     ;
		      RLAST     =     RLAST_S5     ;
		      RVALID    =     RVALID_S5    ;                  
			end	
			
			/*`READ_AR_R_M0S0||`READ_AR_R_M1S0:begin
		      RID       =     RID_S0       ;
		      RDATA     =     RDATA_S0     ;
		      RRESP     =     RRESP_S0     ;
		      RLAST     =     RLAST_S0     ;
		      RVALID    =     RVALID_S0    ;
			end
			`READ_AR_R_M0S1||`READ_AR_R_M1S1:begin
		      RID       =     RID_S1       ;
		      RDATA     =     RDATA_S1     ;
		      RRESP     =     RRESP_S1     ;
		      RLAST     =     RLAST_S1     ;
		      RVALID    =     RVALID_S1    ;
			end*/
			`default_slave:begin
		      RID       =     8'd0            ;
		      RDATA     =     32'd0           ;
		      RRESP     =   `AXI_RESP_DECERR  ;
		      RLAST     =     1'd0            ;
		      RVALID    =     1'd0            ;	  
			end			
			default:begin
		      RID       =     8'd0            ;
		      RDATA     =     32'd0           ;
		      RRESP     =     2'd0            ;
		      RLAST     =     1'd0            ;
		      RVALID    =     1'd0            ;	  
			end
		  endcase
end


always_comb begin
		  case(CS_W)
		    `WRITE_B_M1S0:begin
		      BID        =   BID_S0        ;
		      BRESP      =   BRESP_S0      ;
		      BVALID     =   BVALID_S0     ;
			end
			`WRITE_B_M1S1:begin
		      BID        =   BID_S1        ;
		      BRESP      =   BRESP_S1      ;
		      BVALID     =   BVALID_S1     ;
			end
			`WRITE_B_M1S2:begin
		      BID        =   BID_S2        ;
		      BRESP      =   BRESP_S2      ;
		      BVALID     =   BVALID_S2     ;
			end
			`WRITE_B_M1S3:begin
		      BID        =   BID_S3        ;
		      BRESP      =   BRESP_S3      ;
		      BVALID     =   BVALID_S3     ;
			end
			`WRITE_B_M1S4:begin
		      BID        =   BID_S4        ;
		      BRESP      =   BRESP_S4      ;
		      BVALID     =   BVALID_S4     ;
			end
			
			`WRITE_B_M1S5:begin
		      BID        =   BID_S5        ;
		      BRESP      =   BRESP_S5      ;
		      BVALID     =   BVALID_S5     ;
			end			
			
			`default_slave:begin
		      BID        =   8'd0          ;
		      BRESP      =  `AXI_RESP_DECERR ;
		      BVALID     =   1'd0             ;	  
			end			
			default:begin
		      BID        =   8'd0             ;
		      BRESP      =   2'd0             ;
		      BVALID     =   1'd0             ;	  
			end
		  endcase
end


always_comb begin
  case(CS_R)
    `READ_ADDR_M0:begin
	  if((ARADDR_M0[31:0]>=32'h0000_0000)&&(ARADDR_M0[31:0]<=32'h0000_3fff))
         ARREADY = ARREADY_S0;
	  else if(ARADDR_M0[31:16]==16'd1)	
         ARREADY = ARREADY_S1;
	  else if(ARADDR_M0[31:16]==16'd2)	
         ARREADY = ARREADY_S2;
	  else if((ARADDR_M0[31:0]>=32'h1000_0000)&&(ARADDR_M0[31:0]<=32'h1000_03ff))	
         ARREADY = ARREADY_S3;
	  //else if(ARADDR_M0[31:16]>=16'h2000 && ARADDR_M0[31:16]<=16'h2020)	
	  else if((ARADDR_M0[31:0]>=32'h2000_0000)&&(ARADDR_M0[31:0]<=32'h207f_ffff))
         ARREADY = ARREADY_S4;	
	  else if(ARADDR_M0[31:16]==16'h3000)	
         ARREADY = ARREADY_S5;		 
      else 	ARREADY = 1'd0;	 
	end
	`READ_ADDR_M1:begin
	  if((ARADDR_M1[31:0]>=32'h0000_0000)&&(ARADDR_M1[31:0]<=32'h0000_3fff))
         ARREADY = ARREADY_S0;
	  else if(ARADDR_M1[31:16]==16'd1)	
         ARREADY = ARREADY_S1;
	  else if(ARADDR_M1[31:16]==16'd2)	
         ARREADY = ARREADY_S2;
	  else if((ARADDR_M1[31:0]>=32'h1000_0000)&&(ARADDR_M1[31:0]<=32'h1000_03ff))	
         ARREADY = ARREADY_S3;
	  //else if(ARADDR_M1[31:16]>=16'h2000 && ARADDR_M1[31:16]<=16'h2020)	
	  else if((ARADDR_M1[31:0]>=32'h2000_0000)&&(ARADDR_M1[31:0]<=32'h207f_ffff))
         ARREADY = ARREADY_S4;
	  else if(ARADDR_M1[31:16]==16'h3000)	
         ARREADY = ARREADY_S5;
      else 	ARREADY = 1'd0;	
	end
	default:begin
	  ARREADY = 1'd0;  
	end
  endcase
end

always_comb begin
  case(CS_W)
    `WRITE_ADDR_M1:begin
	     if((AWADDR_M1[31:0]>=32'h0000_0000)&&(AWADDR_M1[31:0]<=32'h0000_3fff))
	       AWREADY = AWREADY_S0;
		 else if(AWADDR_M1[31:16]==16'd1)
	       AWREADY = AWREADY_S1; 
		 else if(AWADDR_M1[31:16]==16'd2)
	       AWREADY = AWREADY_S2;
		 else if((AWADDR_M1[31:0]>=32'h1000_0000)&&(AWADDR_M1[31:0]<=32'h1000_03ff))
	       AWREADY = AWREADY_S3;
		 //else if(AWADDR_M1[31:16]>=16'h2000 && AWADDR_M1[31:16]<=16'h2020)
		 else if((AWADDR_M1[31:0]>=32'h2000_0000)&&(AWADDR_M1[31:0]<=32'h207f_ffff))
	       AWREADY = AWREADY_S4;
		 else if(AWADDR_M1[31:16]==16'h3000)
	       AWREADY = AWREADY_S5;
		 else AWREADY = 1'd0;	
	end
    `WRITE_M1_SIM_S0:begin
	       AWREADY = AWREADY_S0;
	end
    `WRITE_M1_SIM_S1:begin
	       AWREADY = AWREADY_S1;
	end   
    `WRITE_M1_SIM_S2:begin
	       AWREADY = AWREADY_S2;
	end   
    `WRITE_M1_SIM_S3:begin
	       AWREADY = AWREADY_S3;
	end 
    `WRITE_M1_SIM_S4:begin
	       AWREADY = AWREADY_S4;
	end 
    `WRITE_M1_SIM_S5:begin
	       AWREADY = AWREADY_S5;
	end
  
	default:begin
	  AWREADY = 1'd0;  
	end
  endcase
end

always_comb begin
  case(CS_W)
    `WRITE_DATA_M1S0:begin
      		WREADY = WREADY_S0;
	end
	`WRITE_DATA_M1S1:begin
     		WREADY = WREADY_S1;
	end
	`WRITE_DATA_M1S2:begin
     		WREADY = WREADY_S2;
	end
	`WRITE_DATA_M1S3:begin
     		WREADY = WREADY_S3;
	end
	`WRITE_DATA_M1S4:begin
     		WREADY = WREADY_S4;
	end
	`WRITE_DATA_M1S5:begin
     		WREADY = WREADY_S5;
	end	
	
    `WRITE_M1_SIM_S0:begin
     	 	WREADY = WREADY_S0;
	end
	`WRITE_M1_SIM_S1:begin
      		WREADY = WREADY_S1;
	end
	`WRITE_M1_SIM_S2:begin
      		WREADY = WREADY_S2;
	end
	`WRITE_M1_SIM_S3:begin
      		WREADY = WREADY_S3;
	end
	`WRITE_M1_SIM_S4:begin
      		WREADY = WREADY_S4;
	end
	`WRITE_M1_SIM_S5:begin
      		WREADY = WREADY_S5;
	end	
	default:begin
		WREADY = 1'd0;  
	end
  endcase
end
endmodule




