verilator \
-cc -exe --public --trace --savable \
--compiler msvc +define+SIMULATION=1 \
-O3 --x-assign fast --x-initial fast --noassert \
--converge-limit 6000 \
-Wno-fatal \
--top-module top sim.v \
../rtl/system.v \
../rtl/common/cga_vgaport.v \
../rtl/common/cga.v \
../rtl/common/crtc6845.v \
../rtl/common/cga_sequencer.v \
../rtl/common/cga_scandoubler.v \
../rtl/common/cga_pixel.v \
../rtl/common/cga_attrib.v \
../rtl/common/bios.v \
../rtl/common/dpr.v \
../rtl/common/vram.v \
../rtl/common/KB_8042.v \
../rtl/common/PIC_8259.v \
../rtl/common/timer8253.v \
../rtl/common/ram.v \
../rtl/8088/i8088.v \
../rtl/8088/biu_min.v \
../rtl/8088/biu_max.v \
../rtl/8088/eu_rom.v \
../rtl/8088/mcl86_eu_core.v
