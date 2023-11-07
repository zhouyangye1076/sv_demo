module Hub #(
    parameter DATA_WIDTH = 4,
    parameter ADDR_WIDTH = 32
)(
    input clk,
    axi.Slave m,
    axi.Master s0,
    axi.Master s1 
);
    axi  #(
        .ADDR_WIDTH(2),
        .DATA_WIDTH(4)   
    ) zero;
    assign zero.M='{a:{ADDR_WIDTH{1'b0}},b:{ADDR_WIDTH{1'b0}},c:1'b1};

    reg select = 0;
    always@(posedge clk)begin
        select<=~select;
    end
    assign m.S = select ? s1.S : s0.S;
    assign s0.M = select==1'b0 ? m.M : zero.M;
    assign s1.M = select==1'b1 ? m.M : zero.M;

endmodule