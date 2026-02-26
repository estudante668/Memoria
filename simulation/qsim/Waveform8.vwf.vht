-- Copyright (C) 2018  Intel Corporation. All rights reserved.
-- Your use of Intel Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Intel Program License 
-- Subscription Agreement, the Intel Quartus Prime License Agreement,
-- the Intel FPGA IP License Agreement, or other applicable license
-- agreement, including, without limitation, that your use is for
-- the sole purpose of programming logic devices manufactured by
-- Intel and sold by Intel or its authorized distributors.  Please
-- refer to the applicable agreement for further details.

-- *****************************************************************************
-- This file contains a Vhdl test bench with test vectors .The test vectors     
-- are exported from a vector file in the Quartus Waveform Editor and apply to  
-- the top level entity of the current Quartus project .The user can use this   
-- testbench to simulate his design using a third-party simulation tool .       
-- *****************************************************************************
-- Generated on "02/25/2026 17:53:31"
                                                             
-- Vhdl Test Bench(with test vectors) for design  :          SR_LATCH_SCLOCK
-- 
-- Simulation tool : 3rd Party
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY SR_LATCH_SCLOCK_vhd_vec_tst IS
END SR_LATCH_SCLOCK_vhd_vec_tst;
ARCHITECTURE SR_LATCH_SCLOCK_arch OF SR_LATCH_SCLOCK_vhd_vec_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL Q : STD_LOGIC;
SIGNAL Q_Bar : STD_LOGIC;
SIGNAL R : STD_LOGIC;
SIGNAL S : STD_LOGIC;
COMPONENT SR_LATCH_SCLOCK
	PORT (
	Q : BUFFER STD_LOGIC;
	Q_Bar : BUFFER STD_LOGIC;
	R : IN STD_LOGIC;
	S : IN STD_LOGIC
	);
END COMPONENT;
BEGIN
	i1 : SR_LATCH_SCLOCK
	PORT MAP (
-- list connections between master ports and signals
	Q => Q,
	Q_Bar => Q_Bar,
	R => R,
	S => S
	);

-- R
t_prcs_R: PROCESS
BEGIN
	R <= '1';
WAIT;
END PROCESS t_prcs_R;

-- S
t_prcs_S: PROCESS
BEGIN
	S <= '1';
WAIT;
END PROCESS t_prcs_S;
END SR_LATCH_SCLOCK_arch;
