`timescale 1ns / 1ps
`default_nettype none

//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:   01:24:02 08/15/2016 
// Design Name: 
// Module Name:   tld_test_prod_v4 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////

module tld_test_placa_unamiga (
  input wire clk50mhz,
  //---------------------------
  input wire clkps2,
  input wire dataps2,
  //---------------------------
  inout wire mousedata,
  inout wire mouseclk,
  //---------------------------
  output wire testled1,
  output wire testled2,
  //---------------------------
  output wire ser_tx,
  output wire ser_rx,
  //---------------------------
  output wire sd_cs_n,
  output wire sd_clk,
  output wire sd_mosi,
  input wire sd_miso,
  //---------------------------
  output wire flash_cs_n,
  output wire flash_clk,
  output wire flash_mosi,
  input wire flash_miso,
  //---------------------------
  input wire joy1up, 
  input wire joy1down,
  input wire joy1left,
  input wire joy1right,
  input wire joy1fire1,
  input wire joy1fire2,
  input wire joy2up,
  input wire joy2down,
  input wire joy2left,
  input wire joy2right,
  input wire joy2fire1,
  input wire joy2fire2,
  //---------------------------
  output wire sdram_clk,       // señales validas en flanco de suida de CK
  output wire sdram_cke,
  output wire sdram_dqmh_n,    // mascara para byte alto o bajo
  output wire sdram_dqml_n,    // durante operaciones de escritura
  output wire [12:0] sdram_addr, // pag.14. row=[12:0], col=[8:0]. A10=1 significa precharge all.
  output wire [1:0] sdram_ba,   // banco al que se accede
  output wire sdram_cs_n,
  output wire sdram_we_n,
  output wire sdram_ras_n,
  output wire sdram_cas_n,
  inout tri [15:0] sdram_dq,
  //---------------------------
  output wire [5:0] r,
  output wire [5:0] g,
  output wire [5:0] b,
  output wire hsync,
  output wire vsync,
  output wire audio_out_left,
  output wire audio_out_right
  );

  wire clk100, clk100n, clk14, clk7;

  wire mode, vga;

  wire [5:0] r_to_vga, g_to_vga, b_to_vga;
  wire hsync_to_vga, vsync_to_vga, csync_to_vga;

  wire sdtest_init, sdtest_progress, sdtest_result;
  wire flashtest_init, flashtest_progress, flashtest_result;
  wire sdramtest_init, sdramtest_progress, sdramtest_result;
  wire hidetextwindow;

  wire [2:0] mousebutton;  // M R L
  wire mousetest_init;

  wire [15:0] flash_vendor_id;

  wire clocks_ready;

  relojes los_relojes (
   .inclk0(clk50mhz),
   .c0(clk100),
   .c1(clk100n),
   .c2(clk14),
   .c3(clk7),
   .locked(clocks_ready)
   );

  switch_mode teclas (
    .clk(clk7),
    .clkps2(clkps2),
    .dataps2(dataps2),
    .mode(mode),
    .vga(vga),
    .sdtest(sdtest_init),
    .flashtest(flashtest_init),
    .mousetest(mousetest_init),
    .sdramtest(sdramtest_init),
    .serialtest(),
    .hidetextwindow(hidetextwindow)
  );

  sdtest test_slot_sd (
    .clk(clk7),
    .rst(sdtest_init),
    .spi_clk(sd_clk),
    .spi_di(sd_mosi),
    .spi_do(sd_miso),
    .spi_cs(sd_cs_n),
    .test_in_progress(sdtest_progress),
    .test_result(sdtest_result)
  );

  flashtest test_spi_flash (
    .clk(clk7),
    .rst(flashtest_init),
    .spi_clk(flash_clk),
    .spi_di(flash_mosi),
    .spi_do(flash_miso),
    .spi_cs(flash_cs_n),
    .test_in_progress(flashtest_progress),
    .test_result(flashtest_result),
    .vendor_code_hex(flash_vendor_id)
  );

  mousetest test_raton (
    .clk(clk7),
    .rst(mousetest_init),
    .ps2clk(mouseclk),
    .ps2data(mousedata),
    .botones(mousebutton)
  );

  sdramtest #(.FREQCLKSDRAM(100), .CL(2)) test_sdram (
    .clk(clk100),
    .clksdram(clk100n),
    .rst(sdramtest_init),
    .pll_locked(clocks_ready),
    .test_in_progress(sdramtest_progress),
    .test_result(sdramtest_result),
    .sdram_clk(sdram_clk),       // se�ales validas en flanco de suida de CK
    .sdram_cke(sdram_cke),
    .sdram_dqmh_n(sdram_dqmh_n),    // mascara para byte alto o bajo
    .sdram_dqml_n(sdram_dqml_n),    // durante operaciones de escritura
    .sdram_addr(sdram_addr), // pag.14. row=[12:0], col=[8:0]. A10=1 significa precharge all.
    .sdram_ba(sdram_ba),   // banco al que se accede
    .sdram_cs_n(sdram_cs_n),
    .sdram_we_n(sdram_we_n),
    .sdram_ras_n(sdram_ras_n),
    .sdram_cas_n(sdram_cas_n),
    .sdram_dq(sdram_dq)   
  );

  updater mensajes (
    .clk(clk7),
    .mode(mode),
    .vga(vga),
    
    .joystick1(~{joy1up,joy1down,joy1left,joy1right,joy1fire1,joy1fire2}),
    .joystick2(~{joy2up,joy2down,joy2left,joy2right,joy2fire1,joy2fire2}),
    .sdtest_progress(sdtest_progress),
    .sdtest_result(sdtest_result),
    .flashtest_progress(flashtest_progress),
    .flashtest_result(flashtest_result),
    .flash_vendor_id(flash_vendor_id),
    .sdramtest_progress(sdramtest_progress),
    .sdramtest_result(sdramtest_result),
    .mousebutton(mousebutton),
    .hidetextwindow(hidetextwindow),
    
    .r(r_to_vga),
    .g(g_to_vga),
    .b(b_to_vga),
    .hsync(hsync_to_vga),
    .vsync(vsync_to_vga),
    .csync(csync_to_vga)
    );

  vga_scandoubler #(.CLKVIDEO(7000)) modo_vga (
    .clkvideo(clk7),
    .clkvga(clk14),
    .enable_scandoubling(vga),
    .disable_scaneffect(1'b1),
    .ri(r_to_vga),
    .gi(g_to_vga),
    .bi(b_to_vga),
    .hsync_ext_n(hsync_to_vga),
    .vsync_ext_n(vsync_to_vga),
    .csync_ext_n(csync_to_vga),
    .ro(r),
    .go(g),
    .bo(b),
    .hsync(hsync),
    .vsync(vsync)
  );
  
  audio_test audio (
    .clk(clk14),
    .left(audio_out_left),
    .right(audio_out_right),
    .led1(testled1),
    .led2(testled2)
  );

endmodule
