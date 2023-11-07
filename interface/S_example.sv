module S_example(
    input clk,
    axi.Slave  axi_from_S
);
    reg [3:0] mem [3:0];
    integer i;
    initial begin
        for(i=0;i<=3;i=i+1)begin
            mem[i[1:0]]=i[3:0];
        end
    end

    assign axi_from_S.S.f = axi_from_S.M.c;
    assign axi_from_S.S.d = mem[axi_from_S.M.a];
    assign axi_from_S.S.e = mem[axi_from_S.M.b];
endmodule