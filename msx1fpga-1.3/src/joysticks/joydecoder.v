`timescale 1ns / 1ps
`default_nettype none

//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    09:00:25 07/20/2018 
// Design Name: 
// Module Name:    joydecoder 
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

module joydecoder (
//-------------------------------------------
  input wire clk,//si reloj de entrada en este caso 1.3888Mhz va a patilla 11 integrado
  input wire joy_data,//datos serializados patilla viene de la patilla 9 integrado
  output wire joy_clk,//este reloj no se usa
  output wire joy_load,//este reloj negado se usa directamente en las patillas 12 y 13
  input wire clock_locked,
//-----------------------------------------
  output wire joy1up,
  output wire joy1down,
  output wire joy1left,
  output wire joy1right,
  output wire joy1fire1,
  output wire joy1fire2,
  output wire joy1fire3,
  output wire joy1start,
  output wire joy2up,
  output wire joy2down,
  output wire joy2left,
  output wire joy2right,
  output wire joy2fire1,
  output wire joy2fire2,
  output wire joy2fire3,
  output wire joy2start  
  );
  

     // Divisor de relojes
  reg [7:0] delay_count;
  wire ena_x;
  
  always @ (posedge clk or negedge clock_locked) begin
    if (!clock_locked) begin
      delay_count <= 8'd0;
    end else begin
      delay_count <= delay_count + 1'b1;       
    end
  end
    
  assign ena_x = delay_count[4];

  
  
  //Gestion de Joystick
// wire [11:0] j1 , j2;
   reg [11:0] joy1  = 12'hFFF, joy2  = 12'hFFF;
   reg joy_renew = 1'b1;
   reg [4:0]joy_count = 5'd0;
   
   assign joy_clk = ena_x;
   assign joy_load = joy_renew;
	
   assign joy1up    = joy1[0];
   assign joy1down  = joy1[1];
   assign joy1left  = joy1[2];
   assign joy1right = joy1[3];
   assign joy1fire1 = joy1[4];
   assign joy1fire2 = joy1[5];
   assign joy1fire3 = joy1[6];
   assign joy1start = joy1[8];
   assign joy2up    = joy2[0];
   assign joy2down  = joy2[1];
   assign joy2left  = joy2[2];
   assign joy2right = joy2[3];
   assign joy2fire1 = joy2[4];
   assign joy2fire2 = joy2[5];
   assign joy2fire3 = joy2[6];
   assign joy2start = joy2[8];
	
	always @(posedge ena_x) 
	  begin 
      if (joy_count == 5'd0) 
		  begin
         joy_renew <= 1'b0;
        end 
		else 
		  begin
         joy_renew <= 1'b1;
        end
      if (joy_count == 5'd25) 
		  begin
         joy_count <= 5'd0;
        end
		else 
		  begin
         joy_count <= joy_count + 1'd1;
        end      
     end
   always @(posedge ena_x) begin
         case (joy_count)
            5'd2  : joy1[8]  <= joy_data;   //  1p start
            5'd3  : joy1[6]  <= joy_data;   //  1p fire3
            5'd4  : joy1[5]  <= joy_data;   //  1p fire2
            5'd5  : joy1[4]  <= joy_data;   //  1p fire1
            5'd6  : joy1[3]  <= joy_data;   //  1p right
            5'd7  : joy1[2]  <= joy_data;   //  1p left
            5'd8  : joy1[1]  <= joy_data;   //  1p down
            5'd9  : joy1[0]  <= joy_data;   //  1p up
            5'd10 : joy2[8]  <= joy_data;   //  2p start
            5'd11 : joy2[6]  <= joy_data;   //  2p fire3
            5'd12 : joy2[5]  <= joy_data;   //  2p fire2
            5'd13 : joy2[4]  <= joy_data;   //  2p fire1
            5'd14 : joy2[3]  <= joy_data;   //  2p right
            5'd15 : joy2[2]  <= joy_data;   //  2p left
            5'd16 : joy2[1]  <= joy_data;   //  2p down
            5'd17 : joy2[0]  <= joy_data;   //  2p up
            5'd18 : joy2[10] <= joy_data;   //  2p select
            5'd19 : joy2[11] <= joy_data;   //  test
            5'd20 : joy2[9]  <= joy_data;   //  2p coin
            5'd21 : joy2[7]  <= joy_data;   //  2p fire4
            5'd22 : joy1[10] <= joy_data;   //  1p select
            5'd23 : joy1[11] <= joy_data;   //  service
            5'd24 : joy1[9]  <= joy_data;   //  1p coin
            5'd25 : joy1[7]  <= joy_data;   //  1p fire4
         endcase              
      end
endmodule