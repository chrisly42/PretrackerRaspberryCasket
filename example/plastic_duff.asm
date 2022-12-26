; Framework settings

FW_STANDALONE_FILE_MODE     = 1 ; enable standalone (part testing)
FW_HD_TRACKMO_MODE          = 0 ; DO NOT CHANGE (not supported for standalone mode)

FW_MUSIC_SUPPORT            = 0
FW_MUSIC_PLAYER_CHOICE      = 0 ; 0 = None, 1 = LSP, 2 = LSP_CIA, 3 = P61A, 4 = Pretracker Turbo, 5 = Pretracker Copper
FW_LMB_EXIT_SUPPORT         = 1 ; allows abortion of intro with LMB
FW_MULTIPART_SUPPORT        = 0 ; DO NOT CHANGE (not supported for standalone mode)
FW_DYNAMIC_MEMORY_SUPPORT   = 0 ; enable dynamic memory allocation. Otherwise, use fw_ChipMemStack/End etc fields.
FW_MAX_MEMORY_STATES        = 4 ; the amount of memory states
FW_TOP_BOTTOM_MEM_SECTIONS  = 0 ; allow allocations from both sides of the memory
FW_64KB_PAGE_MEMORY_SUPPORT = 0 ; allow allocation of chip memory that doesn't cross the 64 KB page boundary
FW_MULTITASKING_SUPPORT     = 0 ; enable multitasking
FW_ROUNDROBIN_MT_SUPPORT    = 0 ; enable fair scheduling among tasks with same priority
FW_BLITTERTASK_MT_SUPPORT   = 0 ; enable single parallel task during large blits
FW_MAX_VPOS_FOR_BG_TASK     = 300 ; max vpos that is considered to be worth switching to a background task, if any
FW_SCRIPTING_SUPPORT        = 0 ; enable simple timed scripting functions
FW_PALETTE_LERP_SUPPORT     = 0 ; enable basic palette fading functions
FW_YIELD_FROM_MAIN_TOO      = 0 ; adds additional code that copes with Yield being called from main code instead of task
FW_VBL_IRQ_SUPPORT          = 0 ; enable custom VBL IRQ routine
FW_COPPER_IRQ_SUPPORT       = 1 ; enable copper IRQ routine support
FW_AUDIO_IRQ_SUPPORT        = 0 ; enable audio IRQ support (unimplemented)
FW_VBL_MUSIC_IRQ            = 0 ; enable calling of VBL based music ticking (disable, if using CIA timing!)
FW_BLITTERQUEUE_SUPPORT     = 0 ; enable blitter queue support
FW_A5_A6_UNTOUCHED          = 1 ; speed up blitter queue if registers a5/a6 are never changed in main code

FW_LZ4_SUPPORT              = 0 ; compile in LZ4 decruncher
FW_DOYNAX_SUPPORT           = 0 ; compile in doynax decruncher
FW_ZX0_SUPPORT              = 0 ; compile in ZX0 decruncher

CHIPMEM_SIZE = 4
FASTMEM_SIZE = 4

; Raspberry Casket settings
PRETRACKER_SUPPORT_V1_5 = 1
PRETRACKER_PARANOIA_MODE = 0
PRETRACKER_DUBIOUS_PITCH_SHIFT_FOR_DELAYED_TRACK = 0
PRETRACKER_KEEP_JUMP_TABLE = 0
PRETRACKER_SONG_END_DETECTION = 0
PRETRACKER_PROGRESS_SUPPORT = 0
PRETRACKER_FASTER_CODE = 1
PRETRACKER_VOLUME_TABLE = 1
PRETRACKER_BUGFIX_CODE = 1
PRETRACKER_DONT_TRASH_REGS = 0
PRETRACKER_COPPER_OUTPUT = 1

DEBUG_DETAIL	SET	    0

NEWAGE_DEBUG    = 1

        include "../frameworkng/framework.i"

        STRUCTURE	PartData,fw_SIZEOF
		ULONG	pd_Progress
        ULONG   pd_SamplesSize
        
        ULONG	pd_StartVHPos
		ULONG	pd_MinClocks
		ULONG	pd_SumClocks
		ULONG	pd_MaxClocks
		UWORD	pd_SumCount
		STRUCT  pd_MyPlayer,pv_SIZEOF
		STRUCT  pd_MySong,sv_SIZEOF
        LABEL   pd_SIZEOF

        include "../frameworkng/framework.asm"

entrypoint:

        IFNE    PRETRACKER_COPPER_OUTPUT
        lea     pld_pretracker_copperlist,a0
        move.w  #300,d0
        bsr     pre_PrepareCopperlist
		move.l	d1,(a0)	; terminate copperlist
        ENDC

        ;lea     pd_MyPlayer(a6),a0
        lea		pd_MySong(a6),a1
        move.l  #pretracker_data,a2
        PUTMSG  10,<"NewInit songInit %p, %p, %p">,a0,a1,a2
        PUSHM   a5/a6
        bsr		pre_SongInit
		POPM
		PUTMSG	10,<"Return val %ld">,d0
        move.l  d0,pd_SamplesSize(a6)

        CALLFW  VSync
        move.w  fw_FrameCounter(a6),d6
        lea		pd_MyPlayer(a6),a0
        move.l  #lsp_samples,a1
		lea		pd_MySong(a6),a2
        sub.l   a3,a3
        PUTMSG  10,<"NewInit playerInit %p, %p, %p">,a0,a1,a2
        PUSHM   d6/a5/a6
        bsr		pre_PlayerInit
        POPM
		move.w	fw_FrameCounter(a6),d1
		sub.w	d6,d1
		PUTMSG	10,<"Return val %ld, Frames: %d">,d0,d1

        move.l	#100000,pd_MinClocks(a6)

        lea     pld_copperlist,a0
        CALLFW  SetCopper

        lea		.track_time(pc),a0
		move.l	a0,fw_CopperIRQ(a6)

.loop   moveq.l #63,d0
        and.w   fw_FrameCounter(a6),d0
        bne.s   .nooutput
		move.l	pd_SumClocks(a6),d0
		divu	pd_SumCount(a6),d0
        PUTMSG	10,<"Min %d   Max %d   Average %d">,pd_MinClocks(a6),pd_MaxClocks(a6),d0
.nooutput
		CALLFW  VSync
        bra.s   .loop

.track_time
		move.w	#$5ff,color(a5)
		move.l	vposr(a5),pd_StartVHPos(a6)
        PUSHM	d1-d7/a0-a6
        lea		pd_MyPlayer(a6),a0
        lea     pld_pretracker_copperlist,a1
		bsr		pre_PlayerTick
		POPM
        move.l	vposr(a5),d0
		move.w	#$f6f,color(a5)

        PUSHM	d1-d4
		and.l	#$1ffff,d0
		move.l	pd_StartVHPos(a6),d1
		and.l	#$1ffff,d1
		moveq.l	#0,d3
		move.b	d0,d3
		lsr.l	#8,d0
		mulu	#227,d0
		add.l	d3,d0

        moveq.l	#0,d4
		move.b	d1,d4
		lsr.l	#8,d1
		mulu	#227,d1
		add.l	d4,d1
		PUTMSG	20,<"Startclocks %ld Clocks %ld">,d1,d0
		sub.l	d1,d0
		cmp.l	pd_MinClocks(a6),d0
		bge.s	.nomin
		move.l	d0,pd_MinClocks(a6)
.nomin
		cmp.l	pd_MaxClocks(a6),d0
		ble.s	.nomax
		move.l	d0,pd_MaxClocks(a6)
.nomax
		add.l	d0,pd_SumClocks(a6)
		addq.w	#1,pd_SumCount(a6)
		POPM
		rts

        include "../frameworkng/musicplayers/raspberry_casket.asm"

;--------------------------------------------------------------------

        section "pld_copper",data,chip

pld_copperlist:
        COP_MOVE diwstrt,$2c81	        ; window start
        COP_MOVE diwstop,$2cc1	        ; window stop
        COP_MOVE ddfstrt,$0038	        ; bitplane start
        COP_MOVE ddfstop,$00d0	        ; bitplane stop

        COP_MOVE bplcon3,$0c00
pld_fmode:
        COP_MOVE fmode,$0000            ; fixes the aga modulo problem
        COP_MOVE bplcon0,$0200

		COP_MOVE color,$fff
		;dc.w	$0180,$0fff,$01a2,$0eee,$01a4,$0edd,$01a6,$0e9b
		;dc.w	$01a8,$0e69,$01aa,$0b78,$01ac,$0d57,$01ae,$0a56
		;dc.w	$01b0,$0a34,$01b2,$0934,$01b4,$0923,$01b6,$0612
		;dc.w	$01b8,$0211,$01ba,$0000

        COP_WAITLINE $80
        COP_MOVE intreq,INTF_SETCLR|INTF_COPER

        COP_WAITRAST $ff,$de
pld_pretracker_copperlist
		COP_END
        ds.l    36
        COP_END

		;incbin	"../data/pretracker/raspberry_casket64x64.SPR"
		
        section "pretracker_data",data
pretracker_data:
		incbin  "../data/pretracker/Pink - Plastic Dove (from Coda Intro).prt"

        section "lsp_samples",data,chip
lsp_samples:
        ds.b        19522

        END