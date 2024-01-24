SRC 	:= $(shell find . -name "*.v" -o -name "*.sv")
TFLAG	:= --timescale 1ns/10ps --trace --timing
BUILD   := $(CURDIR)/build 
TOP		:= Top
FLAG   	:= --cc --exe --main --Mdir $(BUILD) --top-module Top -o $(TOP)

all:
	mkdir -p $(BUILD)
	verilator $(FLAG) $(TFLAG) $(SRC) +define+TOP=\"$(CURDIR)\"
	make -C $(BUILD) -f V$(TOP).mk $(TOP) 
	cd $(BUILD); ./$(TOP)

wave:
	gtkwave ./build/Testbench.vcd

clean:
	rm -rf build
