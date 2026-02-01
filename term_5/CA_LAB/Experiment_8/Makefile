show: wave.ghw
	gtkwave wave.ghw

wave.ghw: ALU.vhd tb_ALU.vhd
	ghdl -a ALU.vhd tb_ALU.vhd
	ghdl -e tb_alu
	ghdl -r tb_alu --wave=wave.ghw

clean:
	rm -f *.ghw
	rm -f *.cf
