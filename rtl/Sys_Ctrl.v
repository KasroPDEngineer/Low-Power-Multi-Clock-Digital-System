module SYS_CTRL 
(
    // Input Ports
    input  wire        CLK           , // System clock
    input  wire        RST           , // Active-low reset
    input  wire        ALU_Valid     , // Indicates ALU_OUT is valid
    input  wire        Rd_Data_Valid , // Indicates RdData is valid from Reg_file   
    input  wire        RX_ENABLE     , // Data sync Enable 
    input  wire        FIFO_FULL     , // FIFO full flag  
    input  wire [7:0]  Rd_Data       , // Data read from Reg_file
    input  wire [7:0]  RX_P_DATA     , // RX parallel data
    input  wire [15:0] ALU_OUT       , // ALU operation result

    // Output Ports
    output reg        Wr_En         , // Write enable for memory/peripheral
    output reg        Rd_En         , // Read enable for memory/peripheral
    output reg        ALU_EN        , // ALU enable signal
    output reg        CLK_EN        , // Clock gate enable
    output reg        TX_D_VLD      , // TX parallel data valid (WR_INC)
    output wire        clk_div_en    , // Enable signal for clock divider
    output reg [3:0]  ALU_FUN       , // ALU function select
    output reg [3:0]  Address       , // Address bus for Reg_file
    output reg [7:0]  Wr_Data       , // Data to be written in Reg_file
    output reg [7:0]  TX_P_DATA       // TX parallel data (written in FIFO)
);

    //===========================
    // Command Opcodes
    //===========================
    localparam Reg_file_W = 8'hAA ; // Write Reg_file command
    localparam Reg_file_R = 8'hBB ; // Read Reg_file command
    localparam ALU_OP     = 8'hCC ; // ALU operation command
    localparam ALU_NOP    = 8'hDD ; // ALU no-operation command

    //===========================
    // State Encoding (Verilog style)
    //===========================
    localparam [3:0] IDLE        = 4'd0,
                     WR_CMD      = 4'd1,
                     WR_ADD      = 4'd2,
                     WR_DATA     = 4'd3,
                     RD_CMD      = 4'd4,
                     RD_ADD      = 4'd5,
                     RD_REG_FILE = 4'd6,
                     ALU_CMD_OP  = 4'd7,
                     ALU_CMD_NOP = 4'd8,
                     OP_A        = 4'd9,
                     OP_B        = 4'd10,
                     FUN         = 4'd11,
                     RD_ALU_low  = 4'd12,
                     RD_ALU_high = 4'd13;

    reg [3:0] Current_State, Next_State;
    reg [7:0] RX_P_DATA_reg;  
    reg [3:0] W_add_reg ;     

    assign clk_div_en = 1'b1 ;  

    //===========================
    // State Register
    //===========================
    always @(posedge CLK or negedge RST) begin
        if(!RST)
            Current_State <= IDLE ;      
        else 
            Current_State <= Next_State; 
    end

    //===========================
    // Next-State Logic
    //===========================
    always @(*) begin
        case (Current_State)
            IDLE: 
                if     (RX_ENABLE && (RX_P_DATA == Reg_file_W))  Next_State = WR_CMD ; 
                else if(RX_ENABLE && (RX_P_DATA == Reg_file_R))  Next_State = RD_CMD ; 
                else if(RX_ENABLE && (RX_P_DATA == ALU_OP)    )  Next_State = ALU_CMD_OP ; 
                else if(RX_ENABLE && (RX_P_DATA == ALU_NOP)   )  Next_State = ALU_CMD_NOP ; 
                else                                             Next_State = IDLE ; 

            WR_CMD     : Next_State = (RX_ENABLE) ? WR_ADD  : WR_CMD; 
            WR_ADD     : Next_State = (RX_ENABLE) ? WR_DATA : WR_ADD; 
            WR_DATA    : Next_State = IDLE;  

            RD_CMD     : Next_State = (RX_ENABLE)                   ? RD_ADD      : RD_CMD;  
            RD_ADD     : Next_State = (Rd_Data_Valid && !FIFO_FULL) ? RD_REG_FILE : RD_ADD ;  
            RD_REG_FILE: Next_State = IDLE;  

            ALU_CMD_OP : Next_State = (RX_ENABLE) ? OP_A : ALU_CMD_OP; 
            OP_A       : Next_State = (RX_ENABLE) ? OP_B : OP_A; 
            OP_B       : Next_State = (RX_ENABLE) ? FUN  : OP_B; 
            FUN        : Next_State = (ALU_Valid && !FIFO_FULL) ? RD_ALU_low : FUN ; 

            ALU_CMD_NOP: Next_State = (RX_ENABLE) ? FUN : ALU_CMD_NOP; 

            RD_ALU_low : Next_State = (ALU_Valid && !FIFO_FULL) ? RD_ALU_high : RD_ALU_low ; 
            RD_ALU_high: Next_State = IDLE; 

            default    : Next_State = IDLE; 
        endcase    
    end

    //===========================
    // Output Logic
    //===========================
    always @(*) begin
        Wr_En     = 0 ;  
        Rd_En     = 0 ;   
        ALU_EN    = 0 ; 
        CLK_EN    = 0 ; 
        TX_D_VLD  = 0 ; 
        ALU_FUN   = 0 ;
        Address   = 0 ;
        Wr_Data   = 0 ;
        TX_P_DATA = 0 ;

        case (Current_State)
            WR_DATA: begin
                Address = W_add_reg ;
                Wr_Data = RX_P_DATA ;
                Wr_En   = 1'b1 ;
            end    

            RD_ADD: begin
                Address = RX_P_DATA ; 
                Rd_En   = 1'b1 ;
            end                       

            RD_REG_FILE: begin
                TX_P_DATA = Rd_Data ; 
                TX_D_VLD  = 1'b1 ; 
            end                       

            ALU_CMD_NOP: begin
                CLK_EN = 1'b1 ; 
            end                       

            OP_A: begin
                Address = 4'd0 ;
                Wr_Data = RX_P_DATA_reg ; 
                Wr_En   = 1'b1 ; 
            end                       

            OP_B: begin
                CLK_EN  = 1'b1 ;
                Address = 4'd1 ;
                Wr_Data = RX_P_DATA_reg ; 
                Wr_En   = 1'b1 ; 
            end                       

            FUN: begin
                CLK_EN  = 1'b1 ;
                ALU_EN  = 1'b1 ;
                ALU_FUN = RX_P_DATA[3:0] ; 
            end                       

            RD_ALU_low: begin
                TX_P_DATA = ALU_OUT[7:0] ; 
                TX_D_VLD  = 1'b1 ; 
            end                       

            RD_ALU_high: begin
                TX_P_DATA = ALU_OUT[15:8] ; 
                TX_D_VLD  = 1'b1 ; 
            end 
        endcase 
    end

    //===========================
    // Write Address Register
    //===========================
    always @(posedge CLK or negedge RST) begin
        if(!RST)
            W_add_reg <= 4'b0;            
        else if(Current_State == WR_ADD && RX_ENABLE) 
            W_add_reg <= RX_P_DATA;       
    end

    //===========================
    // RX Data Register
    //===========================
    always @(posedge CLK or negedge RST) begin
        if(!RST)
            RX_P_DATA_reg <= 8'b0;            
        else if(Current_State == OP_A || Current_State == OP_B) 
            RX_P_DATA_reg <= RX_P_DATA;       
    end
endmodule

