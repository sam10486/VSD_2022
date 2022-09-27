`include "../../include/AXI_define.svh"

module AW (
    input ACLK, ARESETn,

    //WRITE ADDRESS
	input [`AXI_ID_BITS-1:0] AWID_M1,
	input [`AXI_ADDR_BITS-1:0] AWADDR_M1,
	input [`AXI_LEN_BITS-1:0] AWLEN_M1,
	input [`AXI_SIZE_BITS-1:0] AWSIZE_M1,
	input [1:0] AWBURST_M1,
	input AWVALID_M1,
	output logic AWREADY_M1,

    //WRITE ADDRESS0
	output logic [`AXI_IDS_BITS-1:0] AWID_S0,
	output logic [`AXI_ADDR_BITS-1:0] AWADDR_S0,
	output logic [`AXI_LEN_BITS-1:0] AWLEN_S0,
	output logic [`AXI_SIZE_BITS-1:0] AWSIZE_S0,
	output logic [1:0] AWBURST_S0,
	output logic AWVALID_S0,
	input AWREADY_S0,
    //WRITE ADDRESS1
	output logic [`AXI_IDS_BITS-1:0] AWID_S1,
	output logic [`AXI_ADDR_BITS-1:0] AWADDR_S1,
	output logic [`AXI_LEN_BITS-1:0] AWLEN_S1,
	output logic [`AXI_SIZE_BITS-1:0] AWSIZE_S1,
	output logic [1:0] AWBURST_S1,
	output logic AWVALID_S1,
	input AWREADY_S1,

    //WRITE ADDRESS_Defalut
	output logic [`AXI_IDS_BITS-1:0] AWID_SD,
	output logic [`AXI_ADDR_BITS-1:0] AWADDR_SD,
	output logic [`AXI_LEN_BITS-1:0] AWLEN_SD,
	output logic [`AXI_SIZE_BITS-1:0] AWSIZE_SD,
	output logic [1:0] AWBURST_SD,
	output logic AWVALID_SD,
	input AWREADY_SD
);

always_comb begin: Ready_source_select
    case(AWADDR_M1[17:16])
        2'b00: begin
            if (AWVALID_S0) begin
                AWREADY_M1 = AWREADY_S0;
            end else begin
                AWREADY_M1 = 1'd0;
            end
        end
        2'b01: begin
            if (AWVALID_S1) begin
                AWREADY_M1 = AWREADY_S1;
            end else begin
                AWREADY_M1 = 1'd0;
            end
        end
        default: begin
            if (AWVALID_SD) begin
                AWREADY_M1 = AWREADY_SD; 
            end else begin
                AWREADY_M1 = 1'd0;
            end
        end
    endcase
end

always_comb begin: address_transfer
    AWID_S0 = {4'b0001, AWID_M1};
    AWADDR_S0 = AWADDR_M1;
    AWLEN_S0 = AWLEN_M1;
    AWSIZE_S0 = AWSIZE_M1;
    AWBURST_S0 = AWBURST_M1;

    AWID_S1 = {4'b0001, AWID_M1};
    AWADDR_S1 = AWADDR_M1;
    AWLEN_S1 = AWLEN_M1;
    AWSIZE_S1 = AWSIZE_M1;
    AWBURST_S1 = AWBURST_M1;

    AWID_SD = {4'b0001, AWID_M1};
    AWADDR_SD = AWADDR_M1;
    AWLEN_SD = AWLEN_M1;
    AWSIZE_SD = AWSIZE_M1;
    AWBURST_SD = AWBURST_M1;

    case(AWADDR_M1[17:16])
        2'b00: begin
            AWVALID_S0 = AWVALID_M1;
            AWVALID_S1 = 1'd0;
            AWVALID_SD = 1'd0;
        end
        2'b01: begin
            AWVALID_S0 = 1'd0;
            AWVALID_S1 = AWVALID_M1;
            AWVALID_SD = 1'd0;
        end
        default: begin
            AWVALID_S0 = 1'd0;
            AWVALID_S1 = 1'd0;
            AWVALID_SD = AWVALID_M1;
        end
    endcase
    
end

endmodule