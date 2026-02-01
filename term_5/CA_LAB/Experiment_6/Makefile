show: wave.ghw
	gtkwave wave.ghw

wave.ghw: D_FF.vhd tb_D_FF.vhd
	ghdl -a D_FF.vhd tb_D_FF.vhd
	ghdl -e tb_D_FF
	ghdl -r tb_D_FF --wave=wave.ghw
