`timescale 1ns / 1ps
`default_nettype none
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:24:47 03/04/2014 
// Design Name: 
// Module Name:    spi 
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

module spi (
   input wire clk,         // 7MHz
   input wire enviar_dato, // a 1 para indicar que queremos enviar un dato por SPI
   input wire recibir_dato,// a 1 para indicar que queremos recibir un dato
   input wire [7:0] din,   // del bus de datos de salida de la CPU
   output reg [7:0] dout,  // al bus de datos de entrada de la CPU
   output reg wait_n,
   
   output wire spi_clk,    // Interface SPI
   output wire spi_di,     //
   input wire spi_do       //
   );

   // Modulo SPI.
   reg ciclo_lectura = 1'b0;       // ciclo de lectura en curso
   reg ciclo_escritura = 1'b0;     // ciclo de escritura en curso
   reg [4:0] contador = 5'b00000;  // contador del FSM (ciclos)
   reg [7:0] data_to_spi;          // dato a enviar a la spi por DI
   reg [7:0] data_from_spi;        // dato a recibir desde la spi
   
   assign spi_clk = contador[0];   // spi_CLK es la mitad que el reloj del m�dulo
   assign spi_di = data_to_spi[7]; // la transmisi�n es del bit 7 al 0
   
   initial wait_n = 1'b1;
   initial dout = 8'hFF;
   
   always @(posedge clk) begin
      if (enviar_dato && !ciclo_escritura) begin  // si ha sido se�alizado, iniciar ciclo de escritura
         ciclo_escritura <= 1'b1;
         ciclo_lectura <= 1'b0;
         contador <= 5'b00000;
         data_to_spi <= din;
         wait_n <= 1'b0;         
      end
      else if (recibir_dato && !ciclo_lectura) begin // si no, si mirar si hay que iniciar ciclo de lectura
         ciclo_lectura <= 1'b1;
         ciclo_escritura <= 1'b0;
         contador <= 5'b00000;
         data_from_spi <= 8'h00;
         data_to_spi <= 8'hFF;  // mientras leemos, MOSI debe estar a nivel alto!       
         wait_n <= 1'b0;         
      end
      
      // FSM para enviar un dato a la spi
      else if (ciclo_escritura==1'b1) begin
         if (contador!=5'b10000) begin
            if (spi_clk==1'b1) begin
               data_to_spi <= {data_to_spi[6:0],1'b0};
               data_from_spi <= {data_from_spi[6:0],spi_do};
            end
            contador <= contador + 1;
         end
         else begin
            wait_n <= 1'b1;            
            if (!enviar_dato)
               ciclo_escritura <= 1'b0;
         end
      end
      
      // FSM para leer un dato de la spi
      else if (ciclo_lectura==1'b1) begin
         if (contador!=5'b10000) begin
            if (spi_clk==1'b1)
               data_from_spi <= {data_from_spi[6:0],spi_do};
            contador <= contador + 1;
         end
         else begin
            wait_n <= 1'b1;            
            dout <= data_from_spi;
            if (!recibir_dato)
               ciclo_lectura <= 1'b0;
         end
      end
   end
endmodule
