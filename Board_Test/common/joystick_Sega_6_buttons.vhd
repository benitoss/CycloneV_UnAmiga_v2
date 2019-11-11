
--------------------------------------------------------------------------------
--
--   FileName:         joystick_Sega_6_buttons.vhd
--   Dependencies:     
--   Design Software:  Quartus II 32-bit Version 18.1
--
--   HDL CODE IS PROVIDED "AS IS."  DIGI-KEY EXPRESSLY DISCLAIMS ANY
--   WARRANTY OF ANY KIND, WHETHER EXPRESS OR IMPLIED, INCLUDING BUT NOT
--   LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY, FITNESS FOR A
--   PARTICULAR PURPOSE, OR NON-INFRINGEMENT. IN NO EVENT SHALL DIGI-KEY
--   BE LIABLE FOR ANY INCIDENTAL, SPECIAL, INDIRECT OR CONSEQUENTIAL
--   DAMAGES, LOST PROFITS OR LOST DATA, HARM TO YOUR EQUIPMENT, COST OF
--   PROCUREMENT OF SUBSTITUTE GOODS, TECHNOLOGY OR SERVICES, ANY CLAIMS
--   BY THIRD PARTIES (INCLUDING BUT NOT LIMITED TO ANY DEFENSE THEREOF),
--   ANY CLAIMS FOR INDEMNITY OR CONTRIBUTION, OR OTHER SIMILAR COSTS.
--
--   Version History
--   Version 1.0 06/29/2019 Fernando Mosquera
--     Initial Public Release
--
--   Based in "Joystick read with sega 6 button support" by Victor trucco for Multicore 2
--   https://gitlab.com/victor.trucco/Multicore/blob/master/_MC2_firmware/synth/multicore2/top.vhd
--    
--------------------------------------------------------------------------------
 

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;


entity sega_joystick is
	port (
		joy1_up_i			: in    std_logic;
		joy1_down_i			: in    std_logic;
		joy1_left_i			: in    std_logic;
		joy1_right_i		: in    std_logic;
		joy1_p6_i			: in    std_logic;
		joy1_p9_i			: in    std_logic;
		joy2_up_i			: in    std_logic;
		joy2_down_i			: in    std_logic;
		joy2_left_i			: in    std_logic;
		joy2_right_i		: in    std_logic;
		joy2_p6_i			: in    std_logic;
		joy2_p9_i			: in    std_logic;
		joyX_p7_o			: out   std_logic;  -- send to Select pin 7 of the Megadrive Joystick
		vga_hsync_n_s		: in    std_logic;
      joy1_o				: out   std_logic_vector(11 downto 0) := (others => '1'); -- MS ZYX CBA RLDU
		joy2_o				: out   std_logic_vector(11 downto 0) := (others => '1')  -- MS ZYX CBA RLDU
	);
end entity;

architecture rtl of sega_joystick is

--- Joystick read with sega 6 button support---------------------- 



-- joystick
	signal joy1_s			: std_logic_vector(11 downto 0) := (others => '1'); -- MS ZYX CBA RLDU	
	signal joy2_s			: std_logic_vector(11 downto 0) := (others => '1'); -- MS ZYX CBA RLDU	
	signal joyP7_s			: std_logic;
	 
 begin

process(vga_hsync_n_s)
		variable state_v : unsigned(7 downto 0) := (others=>'0');
		variable j1_sixbutton_v : std_logic := '0';
		variable j2_sixbutton_v : std_logic := '0';
	begin
		if falling_edge(vga_hsync_n_s) then
		
			state_v := state_v + 1;
			
			case state_v is
				-- joy_s format MXYZ SACB RLDU
			
				when X"00" =>  
					joyP7_s <= '0';
					
				when X"01" =>
					joyP7_s <= '1';

				when X"02" => 
					joy1_s(3 downto 0) <= joy1_right_i & joy1_left_i & joy1_down_i & joy1_up_i; -- R, L, D, U
					joy2_s(3 downto 0) <= joy2_right_i & joy2_left_i & joy2_down_i & joy2_up_i; -- R, L, D, U
					joy1_s(5 downto 4) <= joy1_p9_i & joy1_p6_i; -- C, B
					joy2_s(5 downto 4) <= joy2_p9_i & joy2_p6_i; -- C, B					
					joyP7_s <= '0';
					j1_sixbutton_v := '0'; -- Assume it's not a six-button controller
					j2_sixbutton_v := '0'; -- Assume it's not a six-button controller

				when X"03" =>
					joy1_s(7 downto 6) <= joy1_p9_i & joy1_p6_i; -- Start, A
					joy2_s(7 downto 6) <= joy2_p9_i & joy2_p6_i; -- Start, A
					joyP7_s <= '1';
			
				when X"04" =>  
					joyP7_s <= '0';

				when X"05" =>
					if joy1_right_i = '0' and joy1_left_i = '0' and joy1_down_i = '0' and joy1_up_i = '0' then 
						j1_sixbutton_v := '1'; --it's a six button
					end if;
					
					if joy2_right_i = '0' and joy2_left_i = '0' and joy2_down_i = '0' and joy2_up_i = '0' then 
						j2_sixbutton_v := '1'; --it's a six button
					end if;
					
					joyP7_s <= '1';
					
				when X"06" =>
					if j1_sixbutton_v = '1' then
						joy1_s(11 downto 8) <= joy1_right_i & joy1_left_i & joy1_down_i & joy1_up_i; -- Mode, X, Y e Z
					end if;
					
					if j2_sixbutton_v = '1' then
						joy2_s(11 downto 8) <= joy2_right_i & joy2_left_i & joy2_down_i & joy2_up_i; -- Mode, X, Y e Z
					end if;
					
					joyP7_s <= '0';

				when others =>
					joyP7_s <= '1';
					
			end case;

		end if;
	end process;
	
	joyX_p7_o <= joyP7_s;
	joy1_o <= joy1_s;
	joy2_o <= joy2_s;
	
	--------------------------- 
	
end architecture;	
	