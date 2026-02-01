show: wave.ghw
	gtkwave wave.ghw

wave.ghw: MUX_2_TO_1.vhd tb_MUX_2_TO_1.vhd
	ghdl -a MUX_2_TO_1.vhd tb_MUX_2_TO_1.vhd
	ghdl -e tb_MUX_2_TO_1
	ghdl -r tb_MUX_2_TO_1 --wave=wave.ghw
