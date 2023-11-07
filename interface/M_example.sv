module M_example(
    input clk,
    axi.Master axi_from_M
);

    reg [1:0] addr=0;
    always@(posedge clk)begin
        addr<=addr+2'b1;
    end

    assign axi_from_M.M.a = addr;
    assign axi_from_M.M.b = addr;
    assign axi_from_M.M.c = addr[0];
    
endmodule

