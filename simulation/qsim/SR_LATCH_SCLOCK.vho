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

-- VENDOR "Altera"
-- PROGRAM "Quartus Prime"
-- VERSION "Version 18.1.0 Build 625 09/12/2018 SJ Lite Edition"

-- DATE "02/25/2026 17:53:33"

-- 
-- Device: Altera 5CGXFC7C7F23C8 Package FBGA484
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY ALTERA_LNSIM;
LIBRARY CYCLONEV;
LIBRARY IEEE;
USE ALTERA_LNSIM.ALTERA_LNSIM_COMPONENTS.ALL;
USE CYCLONEV.CYCLONEV_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	SR_LATCH_SCLOCK IS
    PORT (
	S : IN std_logic;
	R : IN std_logic;
	Q : BUFFER std_logic;
	Q_Bar : BUFFER std_logic
	);
END SR_LATCH_SCLOCK;

ARCHITECTURE structure OF SR_LATCH_SCLOCK IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_S : std_logic;
SIGNAL ww_R : std_logic;
SIGNAL ww_Q : std_logic;
SIGNAL ww_Q_Bar : std_logic;
SIGNAL \Q~output_o\ : std_logic;
SIGNAL \Q_Bar~output_o\ : std_logic;
SIGNAL \R~input_o\ : std_logic;
SIGNAL \S~input_o\ : std_logic;
SIGNAL \TQ~0_combout\ : std_logic;
SIGNAL \TQ_Bar~0_combout\ : std_logic;
SIGNAL \ALT_INV_TQ_Bar~0_combout\ : std_logic;
SIGNAL \ALT_INV_TQ~0_combout\ : std_logic;
SIGNAL \ALT_INV_R~input_o\ : std_logic;
SIGNAL \ALT_INV_S~input_o\ : std_logic;

BEGIN

ww_S <= S;
ww_R <= R;
Q <= ww_Q;
Q_Bar <= ww_Q_Bar;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;
\ALT_INV_TQ_Bar~0_combout\ <= NOT \TQ_Bar~0_combout\;
\ALT_INV_TQ~0_combout\ <= NOT \TQ~0_combout\;
\ALT_INV_R~input_o\ <= NOT \R~input_o\;
\ALT_INV_S~input_o\ <= NOT \S~input_o\;

\Q~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \ALT_INV_TQ~0_combout\,
	devoe => ww_devoe,
	o => \Q~output_o\);

\Q_Bar~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \ALT_INV_TQ_Bar~0_combout\,
	devoe => ww_devoe,
	o => \Q_Bar~output_o\);

\R~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_R,
	o => \R~input_o\);

\S~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_S,
	o => \S~input_o\);

\TQ~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \TQ~0_combout\ = (\S~input_o\ & ((!\R~input_o\) # (\TQ~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000110100001101000011010000110100001101000011010000110100001101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_TQ~0_combout\,
	datab => \ALT_INV_R~input_o\,
	datac => \ALT_INV_S~input_o\,
	combout => \TQ~0_combout\);

\TQ_Bar~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \TQ_Bar~0_combout\ = (!\TQ~0_combout\ & \R~input_o\)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0010001000100010001000100010001000100010001000100010001000100010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_TQ~0_combout\,
	datab => \ALT_INV_R~input_o\,
	combout => \TQ_Bar~0_combout\);

ww_Q <= \Q~output_o\;

ww_Q_Bar <= \Q_Bar~output_o\;
END structure;


