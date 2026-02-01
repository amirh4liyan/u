show: wave.ghw
	gtkwave wave.ghw

wave.ghw: Booth.vhd tb_Booth.vhd
	ghdl -a Booth.vhd tb_Booth.vhd
	ghdl -e tb_booth
	ghdl -r tb_booth --wave=wave.ghw

clean:
	rm -f *.ghw
	rm -f *.cf
