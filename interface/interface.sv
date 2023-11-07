interface axi #(
    parameter DATA_WIDTH = 4,
    parameter ADDR_WIDTH = 32
);

typedef struct{
    logic [ADDR_WIDTH-1:0] a;
    logic [ADDR_WIDTH-1:0] b;
    logic c;
} axi_from_M;

typedef struct{
    logic [DATA_WIDTH-1:0] d;
    logic [DATA_WIDTH-1:0] e;
    logic f;
} axi_from_S;

axi_from_M M;
axi_from_S S;

modport Master (
    output M,
    input S
);

modport Slave (
    input M,
    output S
);

endinterface

