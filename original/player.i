; MySong offsets
org_sv_num_waves_b          = $00
org_sv_num_steps_b          = $01
org_sv_num_steps_w          = $02
org_sv_patterns_ptr         = $04
org_sv_inst_patterns_table  = $08 ; 32 ($18) waves max (until $88)
org_sv_curr_pat_pos_l       = $88 ; only byte used FIXME why is this part of MySong? Should be in Player
org_sv_pat_pos_len_l        = $8c ; only byte used
org_sv_pat_restart_pos_l    = $90 ; only byte used
org_sv_pos_data_adr         = $94
org_sv_inst_infos_ptr       = $98
org_sv_waveinfo_ptr         = $9c ; base pointer of wave info
org_sv_pattern_table        = $a0 ; until $49c (excl.)
; $4d0 bytes of nothing here
org_sv_wavegen_order_table  = $96c ; 24 bytes

; ----------------------------------------

; channel structure
org_pcd_arp_notes_l         = 0
org_pcd_arp_note_1_b        = 0
org_pcd_arp_note_2_b        = 1
org_pcd_arp_note_3_b        = 2
org_pcd_last_trigger_pos_w  = 4 ; I think this makes sure that we don't retrigger the note on same pos
org_pcd_pat_vol_b           = 6 ; Multiplied with volume of instrument.
org_pcd_pat_portamento_speed_b = 7
org_pcd_pat_adsr_rel_delay_b = 8 ; counts down until adsr release. Seems unused?
org_pcd_pat_2nd_inst_num_b  = 9
org_pcd_pat_2nd_inst_delay_b = 10 ; low byte only?
org_pcd_pat_vol_ramp_speed_b = 11
org_pcd_new_inst_num_b      = 12 ; load new instrument (number)
org_pcd_wave_offset_b       = 13
org_pcd_note_off_delay_b    = 14  ; time before note is released ($ff = disabled)
org_pcd_note_delay_b        = 15  ; $ff = no note delay
org_pcd_pat_portamento_dest_w = $10 ; portamento destination pitch
org_pcd_pat_pitch_slide_w   = $12
org_pcd_track_delay_steps_b = $14 ; $00 = no track delay, $ff = stop track delay (this is for the next channel!)
org_pcd_track_delay_offset_b = $15 ; $ff = no track delay
org_pcd_track_delay_vol16_b = $16

org_pcd_inst_vol_w          = $18
org_pcd_inst_num_w          = $1a ; current instrument number (lower byte used)
org_pcd_inst_wave_num_w     = $1c ; current wave number (1 based) (lower byte used)
org_pcd_loaded_inst_vol_w   = $1e ; low byte only
org_pcd_inst_sel_arp_note_w = $20
org_pcd_inst_new_step_w     = $22 ; seems to be unused
org_pcd_inst_ping_pong_s_w  = $24 ; direction of pingpong (-1 / +1)
org_pcd_inst_pitch_pinned_b = $26
org_pcd_inst_vol_slide_w    = $28
org_pcd_inst_pitch_w        = $2a
org_pcd_inst_curr_port_pitch_w = $2c
org_pcd_inst_note_pitch_w   = $2e
org_pcd_inst_pitch_slide_w  = $30
org_pcd_inst_subloop_wait_w = $32
org_pcd_inst_loop_offset_l  = $34 ; only lower word reasonable
org_pcd_inst_info_ptr       = $38 ; pointer to currently active instrument

org_pcd_waveinfo_ptr        = $3c ; pointer to currently active waveinfo
org_pcd_adsr_phase_l        = $40 ; 0=attack, 1=decay, 2=sustain, 3=release
org_pcd_adsr_phase_speed_b  = $44 ;
org_pcd_adsr_pos_w          = $46 ; $10 (release pos?)
org_pcd_adsr_vol64_w        = $48 ; speed? ($48)+($46)
org_pcd_adsr_attack_speed_l = $4a ; (low byte only)
org_pcd_adsr_decay_speed_l  = $4e ; (low byte only)
org_pcd_adsr_sustain_l      = $52 ; 15/16 (low byte only)
org_pcd_adsr_release_l 		= $56 ; read in release (low byte only)
org_pcd_adsr_volume_l       = $5a ; 0 for restart / $400 (word only)
org_pcd_adsr_trigger_b      = $5e ; 1 for restart (FIXME: never read??)
org_pcd_vibrato_pos_w       = $60 ;
org_pcd_vibrato_depth_w     = $62 ; is a byte value
org_pcd_vibrato_speed_w     = $64 ; is a byte value
org_pcd_vibrato_delay_w     = $66 ; is a byte value

org_pcd_inst_step_pos_b     = $68
org_pcd_inst_speed_stop_b   = $69 ; speed byte, $ff stops processing
org_pcd_inst_line_ticks_b   = $6a ; $00
org_pcd_channel_num_b       = $6b
org_pcd_track_delay_buffer  = $7c ; 16 bytes x 32 steps, until $27c

org_pcd_out_ptr_l       	= $6c
org_pcd_out_len_w       	= $70
org_pcd_out_lof_w       	= $72
org_pcd_out_per_w       	= $74
org_pcd_out_vol_b       	= $76
org_pcd_out_trg_b       	= $77
org_pcd_out_unused_l    	= $78 ; copied for track delay, but not used?
org_pcd_SIZEOF              = $27c

; player global variables (not bound to channel)
org_pv_pat_curr_row_b       = $9f0 ; what is this? bit 0 is tested for shuffle
org_pv_next_pat_row_b       = $9f1
org_pv_next_pat_pos_b       = $9f2
org_pv_pat_speed_b          = $9f3 ; speed byte (unfiltered)
org_pv_pat_line_ticks_b     = $9f4
org_pv_my_song              = $9f6 ; fw_PretrackerMySong
org_pv_pat_stopped_b        = $9fa ; 0 = stop, 1 = run

org_pv_wave_sample_table    = $9fc ; 24 pointers to sample starts, until $a5c
org_pv_sample_buffer_ptr    = $a5c ; pointer to empty sample (for idle channel)
org_pv_osc_buffers          = $a60
org_pv_loop_pattern_b       = $1c6c ; repeat current pattern, do not advance
