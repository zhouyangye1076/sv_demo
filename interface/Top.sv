module Top;
    reg clk=1'b1;
    
    axi #(
        .ADDR_WIDTH(2),
        .DATA_WIDTH(4)
    ) master;

    axi #(
        .ADDR_WIDTH(2),
        .DATA_WIDTH(4)
     ) slave [1:0];

    M_example m(
        .clk(clk),
        .axi_from_M(master.Master)
    );

    S_example s0(
        .clk(clk),
        .axi_from_S(slave[0].Slave)
    );

    S_example S1(
        .clk(clk),
        .axi_from_S(slave[1].Slave)
    );

    Hub #(
        .ADDR_WIDTH(2),
        .DATA_WIDTH(4)
    ) hub (
        .clk(clk),
        .m(master.Slave),
        .s0(slave[0].Master),
        .s1(slave[1].Master)
    );

    always begin
        #5;
        clk=~clk;
    end

    initial begin
		$dumpfile({`TOP,"/build/Testbench.vcd"});
		$dumpvars(0,master);
		$dumpon;
	end

	reg [31:0] cnt=32'b0;
	reg [31:0] max_cycles=32'd200000;
	always@(negedge clk)begin
		cnt<=cnt+32'b1;
		if(cnt==max_cycles)begin
			$display("[CJ] no simulation time");
			$dumpoff;
			$finish;
		end
	end

endmodule