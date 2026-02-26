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

-- DATE "02/23/2026 08:18:44"

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

ENTITY 	Latch_SR IS
    PORT (
	S : IN std_logic;
	R : IN std_logic;
	Q : OUT std_logic;
	Q_bar : OUT std_logic
	);
END Latch_SR;

ARCHITECTURE structure OF Latch_SR IS
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
SIGNAL ww_Q_bar : std_logic;
SIGNAL \Q~output_o\ : std_logic;
SIGNAL \Q_bar~output_o\ : std_logic;
SIGNAL \S~input_o\ : std_logic;
SIGNAL \R~input_o\ : std_logic;
SIGNAL \q_int~0_combout\ : std_logic;
SIGNAL \qbar_int~0_combout\ : std_logic;
SIGNAL \ALT_INV_qbar_int~0_combout\ : std_logic;
SIGNAL \ALT_INV_q_int~0_combout\ : std_logic;
SIGNAL \ALT_INV_S~input_o\ : std_logic;
SIGNAL \ALT_INV_R~input_o\ : std_logic;

BEGIN

ww_S <= S;
ww_R <= R;
Q <= ww_Q;
Q_bar <= ww_Q_bar;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;
\ALT_INV_qbar_int~0_combout\ <= NOT \qbar_int~0_combout\;
\ALT_INV_q_int~0_combout\ <= NOT \q_int~0_combout\;
\ALT_INV_S~input_o\ <= NOT \S~input_o\;
\ALT_INV_R~input_o\ <= NOT \R~input_o\;

\Q~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \ALT_INV_q_int~0_combout\,
	devoe => ww_devoe,
	o => \Q~output_o\);

\Q_bar~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \ALT_INV_qbar_int~0_combout\,
	devoe => ww_devoe,
	o => \Q_bar~output_o\);

\S~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_S,
	o => \S~input_o\);

\R~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_R,
	o => \R~input_o\);

\q_int~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \q_int~0_combout\ = ((\q_int~0_combout\ & !\S~input_o\)) # (\R~input_o\)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0100111101001111010011110100111101001111010011110100111101001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_q_int~0_combout\,
	datab => \ALT_INV_S~input_o\,
	datac => \ALT_INV_R~input_o\,
	combout => \q_int~0_combout\);

\qbar_int~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \qbar_int~0_combout\ = (!\q_int~0_combout\) # (\S~input_o\)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1011101110111011101110111011101110111011101110111011101110111011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_q_int~0_combout\,
	datab => \ALT_INV_S~input_o\,
	combout => \qbar_int~0_combout\);

ww_Q <= \Q~output_o\;

ww_Q_bar <= \Q_bar~output_o\;
END structure;


