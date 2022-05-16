`timescale 1ns/1ns
// top end ff for verilator

module top(

	input clk_100,
	input clk_vga,
	input clk_25,
	input clk_sys,
	input clk_sys2,
	input clk_cpu,

   input reset,
   input [11:0]  inputs,

   output [7:0] VGA_R,
   output [7:0] VGA_G,
   output [7:0] VGA_B,
   
   output VGA_HS,
   output VGA_VS,
   output VGA_HB,
   output VGA_VB,

	output CE_PIXEL,

   output [15:0] AUDIO_L,
   output [15:0] AUDIO_R,
   
   input        ioctl_download,
   input        ioctl_upload,
   input        ioctl_wr,
   input [24:0] ioctl_addr,
   input [7:0]  ioctl_dout,
   input [7:0]  ioctl_din,   
   input [7:0]  ioctl_index,
   output  reg  ioctl_wait=1'b0
   
);
   
assign CE_PIXEL = 1'b1;
assign ce_pix = 1'b1;

system sys_inst
(	
		.clk_100(clk_100),
		.clk_vga(clk_vga),
		.clk_25(clk_25),
		.clk_sys(clk_sys),
		.clk_sys2(clk_sys2),
		.clk_cpu(clk_cpu),
		
		.reset(reset),
		.disable_splashscreen(1),
		.IRQ0(0),
		
		.VGA_R(r),
		.VGA_G(g),
		.VGA_B(b),
		.VGA_HSYNC(VGA_HS),
		.VGA_VSYNC(VGA_VS),

		//.HBlank(VGA_HB),
		//.VBlank(VGA_VB),

		.de_o(VGA_DE),

//		.SRAM_ADDR(sramA),
//		.SRAM_DATA(sramDQ),
//		.SRAM_WE_n(sramWe),

//		.LED(LED),

		//.SD_n_CS(usdCs),
		//.SD_DI(usdDo),
		//.SD_CK(usdCk),
		//.SD_DO(usdDi),

//		.AUD_L(AUDIO_L),
//		.AUD_R(AUDIO_R),
//		.audio_o(AUDIO_R),

//	 	.PS2_CLK1(ps2_kbd_clk_in),
//		.PS2_CLK2(PS2CLKB),
//		.PS2_DATA1(ps2_kbd_data_in),
//		.PS2_DATA2(PS2DATB),
		.PS2_CLK1_I(ps2_kbd_clk_in),
		.PS2_CLK1_O(ps2_kbd_clk_out),
		.PS2_CLK2_I(ps2_mouse_clk_in),
		.PS2_CLK2_O(ps2_mouse_clk_out),
		.PS2_DATA1_I(ps2_kbd_data_in),
		.PS2_DATA1_O(ps2_kbd_data_out),
		.PS2_DATA2_I(ps2_mouse_data_in),
		.PS2_DATA2_O(ps2_mouse_data_out),

		.ioctl_download(ioctl_download),
		.ioctl_index(ioctl_index),
		.ioctl_wr(ioctl_wr),
		.ioctl_addr(ioctl_addr),
		.ioctl_dout(ioctl_data),

		.bios_loaded(bios_loaded)
	);	

	wire de_o;
	wire [5:0] r, g, b;	
	reg [5:0] raux, gaux, baux;	
	
	always @ (r, g, b) begin
		raux = r;
		gaux = g;
		baux = b;
	end

	assign VGA_R = {raux, 2'b0};
	assign VGA_G = {gaux, 2'b0};
	assign VGA_B = {baux, 2'b0};

/*
always @ (posedge clk_sys) begin
    $display( "reset %x", reset);
	$display( "clk_100 %x", clk_100);
end
*/

endmodule
