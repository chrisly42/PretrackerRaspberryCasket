lbL000000:          dc.l     songInit
                    dc.l     playerInit
                    dc.l     playerTick
                    dc.l     lbC0038A2
                    dc.l     lbC001DAE
                    dc.l     lbC0001E0

                    dc.b     '$VER: PreTracker 1.0 (c) 2019 Abyss!',0
                    dc.b     $4E
                    dc.b     $71,$4E

lbC000040:          subq.l   #8,sp
                    movem.l  d2-d7/a2/a3/a5/a6,-(sp)
                    movea.l  ($34,sp),a3
                    movea.l  ($38,sp),a0
                    move.w   ($3E,sp),d4
                    move.b   (a3),d6
                    move.b   (3,a3),d0
                    andi.b   #7,d0
                    move.b   (3,a3),d1
                    andi.b   #$20,d1
                    move.b   d1,($2D,sp)
                    clr.w    d7
                    move.b   d0,d7
                    move.w   d7,($2E,sp)
                    tst.b    d0
                    beq.w    lbC00012C
lbC000076:          lea      (lbW003E8C,pc),a5
                    moveq    #0,d7
                    andi.w   #$FF,d6
                    clr.w    d0
                    move.w   d6,d1
                    muls.w   d0,d1
                    move.l   d1,d0
                    asr.l    #8,d0
                    movea.l  d0,a6
lbC00008C:          move.w   d7,d1
                    move.w   (a5)+,d2
                    clr.w    d0
                    move.b   (1,a3),d0
                    mulu.w   d2,d0
                    moveq    #0,d2
lbC00009A:          move.b   (2,a3),d2
                    tst.b    ($2D,sp)
                    bne.w    lbC000142
                    lsr.l    #2,d0
                    lsl.l    #6,d2
                    movea.l  d2,a1
                    adda.l   d0,a1
lbC0000AE:          tst.w    d4
                    beq.b    lbC000122
                    move.l   d7,d5
                    addq.l   #8,d5
                    btst     #0,d1
                    bne.w    lbC00014C
                    moveq    #0,d2
                    moveq    #0,d3
                    lea      (lbW003E4C,pc),a2
                    move.l   d7,($28,sp)
lbC0000CA:          add.l    d5,d3
                    move.b   (a0,d2.l),d0
                    move.w   d3,d1
                    moveq    #11,d7
                    lsr.w    d7,d1
                    andi.l   #$FFFF,d1
                    add.l    d1,d1
                    move.w   (a2,d1.l),d1
                    andi.l   #$FFFF,d1
                    lsl.l    #5,d1
                    add.l    a1,d1
                    lsr.l    #6,d1
                    move.w   d2,d7
                    sub.w    d1,d7
                    bmi.b    lbC000134
                    move.b   (a0,d7.w),d1
                    ext.w    d1
                    move.w   d6,d7
                    muls.w   d1,d7
                    move.l   d7,d1
                    asr.l    #8,d1
                    ext.w    d0
                    add.w    d1,d0
                    cmpi.w   #$7F,d0
                    bgt.b    lbC00013E
lbC00010C:          cmpi.w   #$FF80,d0
                    bge.b    lbC000114
                    moveq    #-$80,d0
lbC000114:          move.b   d0,(a0,d2.l)
                    addq.l   #1,d2
                    cmp.w    d4,d2
                    bcs.b    lbC0000CA
lbC00011E:          move.l   ($28,sp),d7
lbC000122:          addq.l   #1,d7
                    cmp.w    ($2E,sp),d7
                    bcs.w    lbC00008C
lbC00012C:          movem.l  (sp)+,d2-d7/a2/a3/a5/a6
                    addq.l   #8,sp
                    rts

lbC000134:          ext.w    d0
                    add.w    a6,d0
                    cmpi.w   #$7F,d0
                    ble.b    lbC00010C
lbC00013E:          moveq    #$7F,d0
                    bra.b    lbC00010C

lbC000142:          lsl.l    #8,d2
                    movea.l  d2,a1
                    adda.l   d0,a1
                    bra.w    lbC0000AE

lbC00014C:          moveq    #0,d1
                    moveq    #0,d3
                    lea      (lbW003E4C,pc),a2
                    move.l   d7,($28,sp)
                    add.l    d5,d3
                    move.b   (a0,d1.l),d0
                    move.w   d3,d2
                    moveq    #11,d7
                    lsr.w    d7,d2
                    andi.l   #$FFFF,d2
                    add.l    d2,d2
                    move.w   (a2,d2.l),d2
                    andi.l   #$FFFF,d2
                    lsl.l    #5,d2
                    add.l    a1,d2
                    lsr.l    #6,d2
                    move.w   d1,d7
                    sub.w    d2,d7
                    bmi.b    lbC0001DC
lbC000182:          move.b   (a0,d7.w),d2
                    ext.w    d2
lbC000188:          neg.w    d2
                    move.w   d6,d7
                    muls.w   d2,d7
                    move.l   d7,d2
                    asr.l    #8,d2
                    ext.w    d0
                    add.w    d2,d0
                    cmpi.w   #$7F,d0
                    ble.b    lbC00019E
                    moveq    #$7F,d0
lbC00019E:          cmpi.w   #$FF80,d0
                    bge.b    lbC0001A6
                    moveq    #-$80,d0
lbC0001A6:          move.b   d0,(a0,d1.l)
                    addq.l   #1,d1
                    cmp.w    d4,d1
                    bcc.w    lbC00011E
                    add.l    d5,d3
                    move.b   (a0,d1.l),d0
                    move.w   d3,d2
                    moveq    #11,d7
                    lsr.w    d7,d2
                    andi.l   #$FFFF,d2
                    add.l    d2,d2
                    move.w   (a2,d2.l),d2
                    andi.l   #$FFFF,d2
                    lsl.l    #5,d2
                    add.l    a1,d2
                    lsr.l    #6,d2
                    move.w   d1,d7
                    sub.w    d2,d7
                    bpl.b    lbC000182
lbC0001DC:          clr.w    d2
                    bra.b    lbC000188

lbC0001E0:          lea      (-$24,sp),sp
                    movem.l  d2-d7/a2/a3/a5/a6,-(sp)
                    movea.l  ($50,sp),a1
                    movea.l  a1,a0
                    tst.b    ($9FA,a1)
                    bne.w    lbC00122E
lbC0001F6:          clr.l    ($28,sp)
                    lea      (lbW004000,pc),a2
                    move.l   a2,($34,sp)
                    clr.w    d0
                    moveq    #$2A,d1
                    mulu.w   d1,d0
                    move.l   d0,($40,sp)
                    lea      (lbW004484,pc),a2
                    move.l   a2,($38,sp)
                    lea      (lbW000328,pc),a6
                    lea      (lbB003D3C,pc),a3
                    move.l   a3,($3C,sp)
lbC000220:          movea.l  ($38,a0),a2
                    move.w   ($2A,a0),d0
                    move.w   ($18,a0),d1
                    cmpa.w   #0,a2
                    beq.w    lbC000B6C
lbC000234:          add.w    ($30,a0),d0
                    add.w    ($12,a0),d0
                    cmpi.w   #$240,d0
                    bgt.w    lbC000E2A
                    move.w   d0,($2A,a0)
                    add.w    ($28,a0),d1
                    bmi.w    lbC000E38
lbC000250:          cmpi.w   #$40,d1
                    ble.w    lbC001126
                    move.w   #$40,($18,a0)
                    moveq    #$40,d1
lbC000260:          move.b   ($6A,a0),d2
                    move.w   ($1C,a0),($2C,sp)
                    tst.b    d2
                    bne.w    lbC00037A
                    clr.w    ($30,a0)
                    clr.w    ($28,a0)
                    move.w   ($22,a0),d1
                    blt.w    lbC000EC8
                    cmpi.w   #$20,d1
                    ble.b    lbC000288
                    moveq    #$20,d1
lbC000288:          move.b   d1,d0
                    move.b   d1,($68,a0)
                    move.w   #$FFFF,($22,a0)
                    moveq    #0,d5
                    move.b   (7,a2),d5
                    clr.b    d7
                    clr.b    d3
                    moveq    #-1,d4
                    movea.l  ($38,sp),a5
lbC0002A4:          move.b   d0,d1
                    ext.w    d1
                    movea.w  d1,a3
                    cmp.l    a3,d5
                    ble.w    lbC00036C
lbC0002B0:          movea.l  ($9F6,a1),a2
                    move.b   ($1B,a0),d1
                    subq.b   #1,d1
                    andi.l   #$FF,d1
                    addq.l   #2,d1
                    add.l    d1,d1
                    add.l    d1,d1
                    moveq    #0,d2
                    move.b   d0,d2
                    add.l    d2,d2
                    move.w   (a5,d2.l),d2
                    andi.l   #$FFFF,d2
                    movea.l  (a2,d1.l),a2
                    adda.l   d2,a2
                    move.b   (a2),d1
                    move.b   (1,a2),d6
                    andi.b   #15,d6
                    tst.b    d1
                    blt.w    lbC000C88
                    clr.b    d2
lbC0002EE:          tst.b    d3
                    bne.b    lbC000314
                    andi.b   #$3F,d1
                    beq.b    lbC000314
                    andi.l   #$FF,d1
                    lsl.w    #4,d1
                    addi.w   #$FFF0,d1
                    move.w   d1,($2E,a0)
                    move.b   (a2),d1
                    lsr.b    #6,d1
                    andi.b   #1,d1
                    move.b   d1,($26,a0)
lbC000314:          move.b   (2,a2),d1
                    andi.l   #$FF,d6
                    add.l    d6,d6
                    move.w   (a6,d6.l),d3
                    jmp      (lbW000328,pc,d3.w)

lbW000328:          dc.w     lbC0009AC-lbW000328,lbC000A8A-lbW000328
                    dc.w     lbC00088C-lbW000328,lbC00097E-lbW000328
                    dc.w     lbC0008A8-lbW000328,lbC000898-lbW000328
                    dc.w     lbC000898-lbW000328,lbC000898-lbW000328
                    dc.w     lbC000898-lbW000328,lbC000898-lbW000328
                    dc.w     lbC000A68-lbW000328,lbC00085C-lbW000328
                    dc.w     lbC00083C-lbW000328,lbC000898-lbW000328
                    dc.w     lbC000800-lbW000328,lbC000348-lbW000328
lbC000348:          addq.b   #1,d0
                    tst.b    d1
                    beq.w    lbC000F62
                    move.b   d1,($69,a0)
lbC000354:          move.b   d0,($68,a0)
                    tst.b    d2
                    beq.b    lbC00036E
lbC00035C:          moveq    #1,d7
                    move.b   d2,d3
lbC000360:          move.b   d0,d1
                    ext.w    d1
                    movea.w  d1,a3
                    cmp.l    a3,d5
                    bgt.w    lbC0002B0
lbC00036C:          st       d2
lbC00036E:          add.b    ($69,a0),d2
                    move.b   d2,($6A,a0)
                    move.w   ($18,a0),d1
lbC00037A:          cmpi.w   #$FF,($2C,sp)
                    beq.w    lbC000EE0
                    movea.l  ($3C,a0),a3
                    moveq    #0,d3
                    move.b   (4,a3),d3
                    lsl.l    #8,d3
                    or.b     (5,a3),d3
lbC000394:          move.w   ($2A,a0),d0
                    cmpi.b   #$FF,d2
                    beq.b    lbC0003A4
                    subq.b   #1,d2
                    move.b   d2,($6A,a0)
lbC0003A4:          move.b   (12,a0),d2
                    bne.w    lbC000B84
lbC0003AC:          move.l   ($40,a0),d4
                    move.l   ($5A,a0),d2
                    moveq    #1,d7
                    cmp.l    d4,d7
                    beq.w    lbC000E80
                    tst.l    d4
                    beq.w    lbC001C8C
                    subq.l   #3,d4
                    bne.w    lbC000E42
                    move.w   ($46,a0),d4
                    add.w    ($48,a0),d4
                    move.w   d4,($46,a0)
                    cmpi.w   #15,d4
                    ble.w    lbC000E42
                    move.b   ($44,a0),d5
                    cmpi.b   #$8E,d5
                    bhi.w    lbC001142
                    move.b   d5,d6
                    addq.b   #1,d6
                    andi.l   #$FF,d5
                    add.l    d5,d5
                    lea      (lbW003C1C,pc),a2
                    move.w   (a2,d5.l),d5
                    andi.l   #$FFFF,d5
                    move.b   d6,($44,a0)
                    sub.l    d5,d2
                    bmi.w    lbC001150
lbC00040C:          move.l   d2,($5A,a0)
                    lsr.w    #4,d2
                    addi.w   #$FFF0,d4
                    move.w   d4,($46,a0)
lbC00041A:          move.b   (14,a0),d4
                    beq.b    lbC000432
                    subq.b   #1,d4
                    move.b   d4,(14,a0)
                    bne.b    lbC000432
                    clr.l    ($5A,a0)
                    moveq    #3,d6
                    move.l   d6,($40,a0)
lbC000432:          mulu.w   d2,d1
                    move.b   (6,a0),d2
                    ext.w    d2
                    lsr.l    #6,d1
                    mulu.w   d1,d2
                    move.l   d2,d1
                    lsr.l    #6,d1
                    move.b   d1,($76,a0)
                    move.b   (13,a0),d1
                    tst.w    d3
                    beq.w    lbC000D8E
                    tst.b    d1
                    beq.w    lbC000E48
                    tst.b    (6,a3)
                    beq.w    lbC000E48
                    andi.l   #$FF,d1
                    lsl.l    #7,d1
                    move.l   d1,($34,a0)
                    clr.b    (13,a0)
                    move.w   ($24,a0),d4
                    moveq    #0,d2
                    move.b   (8,a3),d2
                    lsl.l    #8,d2
                    or.b     (9,a3),d2
                    tst.w    d4
                    ble.w    lbC001178
                    sub.l    d2,d1
                    move.l   d1,($34,a0)
lbC00048A:          clr.w    d5
                    move.b   (7,a3),d5
                    move.w   d5,($32,a0)
                    tst.w    d4
                    ble.w    lbC0010A0
                    add.l    d2,d1
                    moveq    #0,d4
                    move.w   d3,d4
                    add.l    d1,d4
                    moveq    #0,d2
                    move.b   (2,a3),d2
                    lsl.l    #8,d2
                    or.b     (3,a3),d2
                    cmp.l    d1,d2
                    bge.b    lbC0004BE
                    moveq    #0,d2
                    move.b   (10,a3),d2
                    lsl.l    #8,d2
                    or.b     (11,a3),d2
lbC0004BE:          sub.l    d4,d2
                    tst.l    d2
                    ble.w    lbC000C4C
lbC0004C6:          move.l   d1,($34,a0)
                    move.w   d1,d4
lbC0004CC:          move.w   d3,($70,a0)
                    move.w   d4,($72,a0)
                    moveq    #0,d1
                    move.w   ($1C,a0),d1
                    addi.l   #$27F,d1
                    add.l    d1,d1
                    add.l    d1,d1
                    move.l   (a1,d1.l),($6C,a0)
lbC0004EA:          tst.b    ($26,a0)
                    bne.w    lbC000DF4
lbC0004F2:          move.w   ($20,a0),d1
                    lsl.w    #4,d1
                    add.w    ($2C,a0),d1
                    add.w    d1,d0
                    move.w   ($2E,a0),d1
                    addi.w   #$FFE0,d1
                    add.w    d1,d0
                    move.w   ($66,a0),d1
                    bne.w    lbC000E0A
lbC000510:          move.w   ($62,a0),d4
                    move.w   ($64,a0),d2
lbC000518:          move.w   d2,d1
                    add.w    ($60,a0),d1
                    move.w   d1,($60,a0)
                    movea.w  d1,a2
                    moveq    #0,d3
                    move.w   d4,d3
                    cmp.l    a2,d3
                    bge.b    lbC00053A
                    neg.w    d2
                    move.w   d2,($64,a0)
                    move.w   d4,d1
                    move.w   d4,($60,a0)
                    movea.w  d4,a2
lbC00053A:          neg.l    d3
                    cmpa.l   d3,a2
                    bge.b    lbC00054E
                    neg.w    d2
                    move.w   d2,($64,a0)
                    move.w   d4,d1
                    neg.w    d1
                    move.w   d1,($60,a0)
lbC00054E:          asr.w    #3,d1
                    add.w    d1,d0
lbC000552:          move.b   ($77,a0),d6
                    move.w   ($70,a0),d3
                    cmpi.w   #$219,d0
                    ble.w    lbC000D80
                    movea.w  #$231,a2
                    btst     #2,($14,a3)
                    beq.w    lbC0005F2
                    moveq    #0,d4
                    move.b   (10,a3),d4
                    lsl.l    #8,d4
                    or.b     (11,a3),d4
                    move.w   d4,d2
                    movea.w  d0,a2
                    move.l   a2,d5
                    addi.l   #$FFFFFDE7,d5
                    asr.l    #4,d5
                    moveq    #0,d7
                    not.b    d7
                    and.l    d7,d5
                    lea      (lbB003DD8,pc),a2
                    move.b   (a2,d5.l),d1
                    move.w   ($72,a0),d7
                    cmpi.w   #$FFFF,d7
                    beq.w    lbC001052
                    moveq    #0,d4
                    move.b   d1,d4
                    andi.l   #$FFFF,d7
                    asr.l    d4,d7
                    move.w   d7,($72,a0)
                    andi.l   #$FFFF,d3
                    asr.l    d4,d3
                    move.w   d3,($70,a0)
lbC0005C0:          tst.b    d1
                    beq.b    lbC0005D8
                    move.l   ($6C,a0),d4
lbC0005C8:          moveq    #0,d7
                    move.w   d2,d7
                    add.l    d7,d4
                    lsr.w    #1,d2
                    subq.b   #1,d1
                    bne.b    lbC0005C8
                    move.l   d4,($6C,a0)
lbC0005D8:          lea      (lbB003D6C,pc),a2
                    clr.w    d1
                    move.b   (a2,d5.l),d1
                    lsl.w    #4,d1
                    sub.w    d1,d0
                    cmpi.w   #$231,d0
                    ble.b    lbC0005F0
                    move.w   #$231,d0
lbC0005F0:          movea.w  d0,a2
lbC0005F2:          tst.b    d6
                    beq.b    lbC00060E
                    move.w   ($72,a0),d0
                    cmpi.w   #$FFFF,d0
                    beq.b    lbC00060E
                    andi.l   #$FFFF,d0
                    add.l    d0,($6C,a0)
                    clr.w    ($72,a0)
lbC00060E:          cmp.w    (4,a0),d3
                    beq.b    lbC00061E
                    move.b   #1,($77,a0)
                    move.w   d3,(4,a0)
lbC00061E:          move.l   a2,d0
                    add.l    a2,d0
                    movea.l  ($34,sp),a2
                    move.w   (a2,d0.l),($74,a0)
                    move.b   ($14,a0),d0
                    beq.w    lbC000C96
                    moveq    #3,d1
                    cmp.l    ($28,sp),d1
                    bne.w    lbC000AA2
lbC00063E:          tst.b    ($77,a1)
                    bne.w    lbC000CB0
lbC000646:          clr.w    d0
                    move.b   ($76,a1),d0
                    move.w   d0,($DFF0A8)
                    move.w   ($74,a1),($DFF0A6)
                    tst.b    ($2F3,a1)
                    bne.w    lbC000CE8
lbC000662:          clr.w    d0
                    move.b   ($2F2,a1),d0
                    move.w   d0,($DFF0B8)
                    move.w   ($2F0,a1),($DFF0B6)
                    tst.b    ($56F,a1)
                    bne.w    lbC000D20
lbC00067E:          clr.w    d0
                    move.b   ($56E,a1),d0
                    move.w   d0,($DFF0C8)
                    move.w   ($56C,a1),($DFF0C6)
                    tst.b    ($7EB,a1)
                    beq.w    lbC000D58
lbC00069A:          move.w   #8,($DFF096)
                    move.l   ($7E0,a1),($DFF0D0)
                    move.w   ($7E4,a1),d0
                    lsr.w    #1,d0
                    move.w   d0,($DFF0D4)
                    move.w   #0,($DFF0D8)
                    clr.b    ($7EB,a1)
                    move.w   ($7E8,a1),($DFF0D6)
                    moveq    #4,d2
                    move.l   #$FFFFFF,d1
lbC0006D2:          move.l   ($DFF004),d0
                    move.l   d0,($44,sp)
                    move.l   ($44,sp),d0
                    lsr.l    #8,d0
                    andi.l   #$1FF,d0
                    move.l   d0,($44,sp)
                    move.l   ($44,sp),d0
                    cmp.l    d0,d1
                    beq.b    lbC0006D2
                    move.l   ($44,sp),d1
                    subq.b   #1,d2
                    bne.b    lbC0006D2
                    move.w   #$800F,($DFF096)
                    moveq    #4,d2
                    move.l   #$FFFFFF,d1
lbC00070C:          move.l   ($DFF004),d0
                    move.l   d0,($48,sp)
                    move.l   ($48,sp),d0
                    lsr.l    #8,d0
                    andi.l   #$1FF,d0
                    move.l   d0,($48,sp)
                    move.l   ($48,sp),d0
                    cmp.l    d0,d1
                    beq.b    lbC00070C
                    move.l   ($48,sp),d1
                    subq.b   #1,d2
                    bne.b    lbC00070C
                    move.w   #$8001,($DFF096)
                    move.w   ($72,a1),d0
                    cmpi.w   #$FFFF,d0
                    beq.w    lbC001756
                    andi.l   #$FFFF,d0
                    add.l    ($6C,a1),d0
                    move.l   d0,($DFF0A0)
lbC00075A:          clr.w    d0
                    move.b   ($76,a1),d0
                    move.w   d0,($DFF0A8)
                    move.w   #$8002,($DFF096)
                    move.w   ($2EE,a1),d0
                    cmpi.w   #$FFFF,d0
                    beq.w    lbC001742
                    andi.l   #$FFFF,d0
                    add.l    ($2E8,a1),d0
                    move.l   d0,($DFF0B0)
lbC00078A:          clr.w    d0
                    move.b   ($2F2,a1),d0
                    move.w   d0,($DFF0B8)
                    move.w   #$8004,($DFF096)
                    move.w   ($56A,a1),d0
                    cmpi.w   #$FFFF,d0
                    beq.w    lbC00172E
                    andi.l   #$FFFF,d0
                    add.l    ($564,a1),d0
                    move.l   d0,($DFF0C0)
lbC0007BA:          clr.w    d0
                    move.b   ($56E,a1),d0
                    move.w   d0,($DFF0C8)
                    move.w   #$8008,($DFF096)
                    move.w   ($7E6,a1),d0
                    cmpi.w   #$FFFF,d0
                    beq.w    lbC001708
                    andi.l   #$FFFF,d0
                    add.l    ($7E0,a1),d0
                    move.l   d0,($DFF0D0)
                    clr.w    d0
                    move.b   ($7EA,a1),d0
                    move.w   d0,($DFF0D8)
                    movem.l  (sp)+,d2-d7/a2/a3/a5/a6
                    lea      ($24,sp),sp
                    rts

lbC000800:          move.b   d1,d3
                    lsr.b    #4,d3
                    addq.b   #1,d0
                    tst.b    d3
                    beq.w    lbC001032
                    cmpi.b   #1,d3
                    bne.w    lbC000354
                    andi.b   #3,d1
                    beq.w    lbC001020
                    andi.l   #$FF,d1
                    move.b   (-1,a0,d1.l),d1
lbC000826:          andi.w   #$FF,d1
                    move.w   d1,($20,a0)
                    move.b   d0,($68,a0)
                    tst.b    d2
                    bne.w    lbC00035C
                    bra.w    lbC00036E

lbC00083C:          andi.w   #$FF,d1
                    addq.b   #1,d0
                    cmpi.w   #$40,d1
                    bgt.w    lbC000F74
                    move.w   d1,($18,a0)
                    move.b   d0,($68,a0)
                    tst.b    d2
                    bne.w    lbC00035C
                    bra.w    lbC00036E

lbC00085C:          moveq    #0,d3
                    move.b   d1,d3
                    cmp.l    a3,d3
                    bge.b    lbC000898
                    moveq    #-1,d6
                    cmp.l    d4,d6
                    beq.b    lbC00086E
                    cmp.l    d3,d4
                    ble.b    lbC000898
lbC00086E:          move.b   d1,d0
                    subq.b   #1,d0
                    move.b   d0,($68,a0)
                    move.b   d1,d0
                    tst.b    d7
                    bne.w    lbC00119E
                    move.b   d1,($68,a0)
                    moveq    #-1,d4
                    moveq    #1,d7
                    move.b   d2,d3
                    bra.w    lbC000360

lbC00088C:          andi.l   #$FF,d1
                    neg.w    d1
                    move.w   d1,($30,a0)
lbC000898:          addq.b   #1,d0
                    move.b   d0,($68,a0)
                    tst.b    d2
                    bne.w    lbC00035C
                    bra.w    lbC00036E

lbC0008A8:          move.b   d1,d3
                    subq.b   #1,d3
                    clr.w    d1
                    move.b   d3,d1
                    addq.b   #1,d0
                    cmp.w    ($2C,sp),d1
                    beq.w    lbC000354
                    cmpi.b   #$17,d3
                    bhi.w    lbC000354
                    move.w   d1,($1C,a0)
                    movea.l  ($9F6,a1),a2
                    move.w   d1,d6
                    moveq    #$2A,d7
                    mulu.w   d7,d6
                    movea.l  ($9C,a2),a2
                    adda.l   d6,a2
                    move.l   a2,($3C,a0)
                    moveq    #0,d6
                    move.b   (4,a2),d6
                    lsl.l    #8,d6
                    or.b     (5,a2),d6
                    tst.l    d6
                    bne.w    lbC0011B4
                    moveq    #0,d7
                    move.b   (12,a2),d7
                    lsl.l    #8,d7
                    or.b     (13,a2),d7
                    move.l   d7,($30,sp)
                    move.b   #1,($77,a0)
                    andi.l   #$FF,d3
                    addi.l   #$27F,d3
                    add.l    d3,d3
                    add.l    d3,d3
                    moveq    #0,d6
                    move.w   d7,d6
                    movea.l  d6,a3
                    move.l   (a1,d3.l),d3
                    add.l    a3,d3
                    move.l   d3,($6C,a0)
                    moveq    #0,d6
                    move.b   (10,a2),d6
                    lsl.l    #8,d6
                    or.b     (11,a2),d6
                    moveq    #0,d3
                    move.w   d6,d3
                    move.l   d3,d7
                    subq.l   #1,d7
                    cmp.l    a3,d7
                    bgt.w    lbC001666
                    moveq    #2,d6
                    move.w   d6,($70,a0)
                    move.w   #$FFFF,($72,a0)
lbC000948:          move.l   ($34,a0),d6
                    cmp.l    d6,d3
                    bge.b    lbC000956
                    move.w   #1,($24,a0)
lbC000956:          clr.w    ($32,a0)
                    moveq    #0,d3
                    move.b   (8,a2),d3
                    lsl.l    #8,d3
                    or.b     (9,a2),d3
                    sub.l    d3,d6
                    move.l   d6,($34,a0)
                    move.w   d1,($2C,sp)
                    move.b   d0,($68,a0)
                    tst.b    d2
                    bne.w    lbC00035C
                    bra.w    lbC00036E

lbC00097E:          addq.b   #1,d0
                    cmpi.b   #1,d1
                    beq.w    lbC000FDA
                    cmpi.b   #2,d1
                    bne.w    lbC000354
                    clr.l    ($40,a0)
                    clr.l    ($5A,a0)
                    move.b   #1,($5E,a0)
                    move.b   d0,($68,a0)
                    tst.b    d2
                    bne.w    lbC00035C
                    bra.w    lbC00036E

lbC0009AC:          subq.b   #1,d1
                    clr.w    d3
                    move.b   d1,d3
                    addq.b   #1,d0
                    cmp.w    ($2C,sp),d3
                    beq.w    lbC000354
                    cmpi.b   #$17,d1
                    bhi.w    lbC000354
                    move.w   d3,($1C,a0)
                    movea.l  ($9F6,a1),a2
                    move.w   d3,d6
                    moveq    #$2A,d7
                    mulu.w   d7,d6
                    movea.l  ($9C,a2),a2
                    adda.l   d6,a2
                    move.l   a2,($3C,a0)
                    moveq    #0,d6
                    move.b   (4,a2),d6
                    lsl.l    #8,d6
                    or.b     (5,a2),d6
                    tst.l    d6
                    bne.w    lbC0011E4
                    moveq    #0,d7
                    move.b   (12,a2),d7
                    lsl.l    #8,d7
                    or.b     (13,a2),d7
                    moveq    #0,d6
                    move.w   d7,d6
                    move.b   #1,($77,a0)
                    andi.l   #$FF,d1
                    addi.l   #$27F,d1
                    add.l    d1,d1
                    add.l    d1,d1
                    move.l   (a1,d1.l),d1
                    add.l    d6,d1
                    move.l   d1,($6C,a0)
                    moveq    #0,d1
                    move.b   (10,a2),d1
                    lsl.l    #8,d1
                    or.b     (11,a2),d1
                    movea.l  d1,a3
                    subq.l   #1,a3
                    cmpa.l   d6,a3
                    bgt.w    lbC001656
                    moveq    #2,d1
                    move.w   d1,($70,a0)
                    move.w   #$FFFF,($72,a0)
lbC000A40:          clr.w    d1
                    move.b   (7,a2),d1
                    addq.w   #1,d1
                    move.w   d1,($32,a0)
                    move.l   d6,($34,a0)
                    move.w   #1,($24,a0)
                    move.w   d3,($2C,sp)
lbC000A5A:          move.b   d0,($68,a0)
                    tst.b    d2
                    bne.w    lbC00035C
                    bra.w    lbC00036E

lbC000A68:          move.b   d1,d3
                    andi.b   #15,d3
                    beq.w    lbC000F88
                    neg.b    d1
                    ext.w    d1
                    move.w   d1,($28,a0)
                    addq.b   #1,d0
lbC000A7C:          move.b   d0,($68,a0)
                    tst.b    d2
                    bne.w    lbC00035C
                    bra.w    lbC00036E

lbC000A8A:          andi.w   #$FF,d1
                    move.w   d1,($30,a0)
                    addq.b   #1,d0
                    move.b   d0,($68,a0)
                    tst.b    d2
                    bne.w    lbC00035C
                    bra.w    lbC00036E

lbC000AA2:          cmpi.b   #$FF,d0
                    beq.w    lbC001162
                    move.b   ($290,a0),d3
                    move.b   d0,($290,a0)
                    move.b   ($291,a0),d1
                    addq.b   #1,d1
                    andi.b   #$1F,d1
                    move.b   d1,($291,a0)
                    move.b   d1,d2
                    ext.w    d2
                    movea.w  d2,a2
                    move.l   a2,d2
                    lsl.l    #4,d2
                    lea      (a0,d2.l),a2
                    lea      ($2F8,a2),a3
                    move.l   ($6C,a0),(a3)+
                    move.l   ($70,a0),(a3)+
                    move.l   ($74,a0),(a3)+
                    move.l   ($78,a0),(a3)
                    move.b   ($16,a0),d2
                    ext.w    d2
                    lea      ($302,a2),a3
                    clr.w    d4
                    move.b   (a3),d4
                    mulu.w   d4,d2
                    lsr.l    #4,d2
                    move.b   d2,(a3)
                    tst.b    d3
                    bne.b    lbC000B00
                    move.b   #1,($303,a2)
lbC000B00:          sub.b    d0,d1
                    bmi.w    lbC0018A4
                    move.b   d1,d0
                    ext.w    d0
                    ext.l    d0
                    moveq    #7,d4
                    and.l    d4,d1
                    lea      (lbB003E44,pc),a2
                    move.b   (a2,d1.l),d1
                    ext.w    d1
lbC000B1A:          lsl.l    #4,d0
                    lea      (a0,d0.l),a2
                    lea      ($2E8,a0),a3
                    lea      ($2F8,a2),a5
                    move.l   (a5)+,(a3)+
                    move.l   (a5)+,(a3)+
                    move.l   (a5)+,(a3)+
                    move.l   (a5),(a3)
                    clr.b    ($302,a2)
                    move.w   ($2F0,a0),d2
                    move.w   d1,d0
                    muls.w   d2,d0
                    moveq    #12,d6
                    asr.l    d6,d0
                    add.w    d0,d2
                    move.w   d2,($2F0,a0)
                    moveq    #2,d7
                    cmp.l    ($28,sp),d7
                    beq.w    lbC00063E
                    lea      ($4F8,a0),a0
                    addq.l   #2,($28,sp)
                    movea.l  ($38,a0),a2
                    move.w   ($2A,a0),d0
                    move.w   ($18,a0),d1
                    cmpa.w   #0,a2
                    bne.w    lbC000234
lbC000B6C:          movea.l  ($3C,a0),a3
                    moveq    #0,d3
                    move.b   (4,a3),d3
                    lsl.l    #8,d3
                    or.b     (5,a3),d3
                    move.b   (12,a0),d2
                    beq.w    lbC0003AC
lbC000B84:          movea.l  ($9F6,a1),a2
                    moveq    #0,d4
                    move.b   d2,d4
                    addi.l   #$1FFFFFFF,d4
                    lsl.l    #3,d4
                    movea.l  ($98,a2),a2
                    adda.l   d4,a2
                    move.w   d1,($1E,a0)
                    move.l   a2,($38,a0)
                    andi.w   #$FF,d2
                    move.w   d2,($1A,a0)
                    clr.l    ($40,a0)
                    clr.l    ($5A,a0)
                    move.b   #1,($5E,a0)
                    moveq    #0,d4
                    move.b   (3,a2),d4
                    move.l   d4,($4A,a0)
                    moveq    #0,d2
                    move.b   (4,a2),d2
                    move.l   d2,($4E,a0)
                    move.b   (5,a2),d2
                    move.l   d2,($52,a0)
                    move.b   (6,a2),d2
                    move.l   d2,($56,a0)
                    clr.w    ($60,a0)
                    move.b   (a2),d2
                    lea      (lbB003C0C,pc),a5
                    move.b   (a5,d2.l),d2
                    andi.w   #$FF,d2
                    addq.w   #1,d2
                    move.w   d2,($66,a0)
                    moveq    #0,d2
                    move.b   (1,a2),d2
                    lea      (lbB003BFC,pc),a5
                    move.b   (a5,d2.l),d2
                    andi.w   #$FF,d2
                    move.w   d2,($62,a0)
                    moveq    #0,d2
                    move.b   (2,a2),d2
                    lea      (lbB003BEC,pc),a2
                    move.b   (a2,d2.l),d2
                    andi.w   #$FF,d2
                    move.w   d2,($64,a0)
                    clr.b    (12,a0)
                    moveq    #0,d2
lbC000C26:          add.l    d4,d4
                    lea      (lbW003D4C,pc),a2
                    move.w   (a2,d4.l),d4
                    andi.l   #$FFFF,d4
                    add.l    d4,d2
                    cmpi.l   #$3FF,d2
                    bgt.w    lbC000FAE
                    move.l   d2,($5A,a0)
                    lsr.w    #4,d2
                    bra.w    lbC00041A

lbC000C4C:          add.l    d2,d1
                    move.l   d1,($34,a0)
                    move.w   #$FFFF,($24,a0)
                    move.w   d1,d4
                    tst.l    d2
                    bne.w    lbC0004CC
                    subq.w   #1,d5
                    move.w   d5,($32,a0)
lbC000C66:          move.w   d3,($70,a0)
                    move.w   d4,($72,a0)
                    moveq    #0,d1
                    move.w   ($1C,a0),d1
                    addi.l   #$27F,d1
                    add.l    d1,d1
                    add.l    d1,d1
                    move.l   (a1,d1.l),($6C,a0)
                    bra.w    lbC0004EA

lbC000C88:          moveq    #-1,d2
                    cmp.l    d4,d2
                    beq.w    lbC000D78
                    moveq    #1,d2
                    bra.w    lbC0002EE

lbC000C96:          lea      ($27C,a0),a0
                    addq.l   #1,($28,sp)
                    moveq    #4,d0
                    cmp.l    ($28,sp),d0
                    bne.w    lbC000220
                    tst.b    ($77,a1)
                    beq.w    lbC000646
lbC000CB0:          move.w   #1,($DFF096)
                    move.l   ($6C,a1),($DFF0A0)
                    move.w   ($70,a1),d0
                    lsr.w    #1,d0
                    move.w   d0,($DFF0A4)
                    move.w   #0,($DFF0A8)
                    clr.b    ($77,a1)
                    move.w   ($74,a1),($DFF0A6)
                    tst.b    ($2F3,a1)
                    beq.w    lbC000662
lbC000CE8:          move.w   #2,($DFF096)
                    move.l   ($2E8,a1),($DFF0B0)
                    move.w   ($2EC,a1),d0
                    lsr.w    #1,d0
                    move.w   d0,($DFF0B4)
                    move.w   #0,($DFF0B8)
                    clr.b    ($2F3,a1)
                    move.w   ($2F0,a1),($DFF0B6)
                    tst.b    ($56F,a1)
                    beq.w    lbC00067E
lbC000D20:          move.w   #4,($DFF096)
                    move.l   ($564,a1),($DFF0C0)
                    move.w   ($568,a1),d0
                    lsr.w    #1,d0
                    move.w   d0,($DFF0C4)
                    move.w   #0,($DFF0C8)
                    clr.b    ($56F,a1)
                    move.w   ($56C,a1),($DFF0C6)
                    tst.b    ($7EB,a1)
                    bne.w    lbC00069A
lbC000D58:          clr.w    d0
                    move.b   ($7EA,a1),d0
                    move.w   d0,($DFF0D8)
                    move.w   ($7E8,a1),($DFF0D6)
                    moveq    #4,d2
                    move.l   #$FFFFFF,d1
                    bra.w    lbC0006D2

lbC000D78:          move.l   a3,d4
                    moveq    #1,d2
                    bra.w    lbC0002EE

lbC000D80:          tst.w    d0
                    bge.w    lbC0005F0
                    clr.w    d0
                    movea.w  d0,a2
                    bra.w    lbC0005F2

lbC000D8E:          tst.b    d1
                    beq.w    lbC0004EA
                    tst.b    (6,a3)
                    beq.w    lbC0004EA
                    moveq    #0,d2
                    move.w   ($1C,a0),d2
                    andi.w   #$FF,d1
                    lsl.w    #7,d1
                    move.b   #1,($77,a0)
                    addi.l   #$27F,d2
                    add.l    d2,d2
                    add.l    d2,d2
                    moveq    #0,d3
                    move.w   d1,d3
                    move.l   (a1,d2.l),d2
                    add.l    d3,d2
                    move.l   d2,($6C,a0)
                    moveq    #0,d2
                    move.b   (10,a3),d2
                    lsl.l    #8,d2
                    or.b     (11,a3),d2
                    move.l   d2,d4
                    subq.l   #1,d4
                    cmp.l    d3,d4
                    ble.w    lbC00112E
                    sub.w    d1,d2
                    move.w   d2,($70,a0)
                    move.w   #$FFFF,($72,a0)
                    clr.b    (13,a0)
lbC000DEC:          tst.b    ($26,a0)
                    beq.w    lbC0004F2
lbC000DF4:          addi.w   #$10,d0
                    move.w   ($2E,a0),d1
                    addi.w   #$FFE0,d1
                    add.w    d1,d0
                    move.w   ($66,a0),d1
                    beq.w    lbC000510
lbC000E0A:          subq.w   #1,d1
                    move.w   d1,($66,a0)
                    bne.w    lbC000552
                    move.w   ($62,a0),d4
                    move.w   ($64,a0),d1
                    move.w   d4,d2
                    muls.w   d1,d2
                    asr.w    #4,d2
                    move.w   d2,($64,a0)
                    bra.w    lbC000518

lbC000E2A:          move.w   #$240,($2A,a0)
                    add.w    ($28,a0),d1
                    bpl.w    lbC000250
lbC000E38:          clr.w    ($18,a0)
                    clr.w    d1
                    bra.w    lbC000260

lbC000E42:          lsr.w    #4,d2
                    bra.w    lbC00041A

lbC000E48:          move.w   ($32,a0),d1
                    cmpi.w   #1,d1
                    bls.w    lbC00110C
                    subq.w   #1,d1
                    move.w   d1,($32,a0)
                    move.w   ($36,a0),d4
                    move.w   d3,($70,a0)
                    move.w   d4,($72,a0)
                    moveq    #0,d1
                    move.w   ($1C,a0),d1
                    addi.l   #$27F,d1
                    add.l    d1,d1
                    add.l    d1,d1
                    move.l   (a1,d1.l),($6C,a0)
                    bra.w    lbC0004EA

lbC000E80:          move.b   ($44,a0),d4
                    cmpi.b   #$8E,d4
                    bhi.w    lbC000FA6
                    move.b   d4,d5
                    addq.b   #1,d5
                    andi.l   #$FF,d4
                    add.l    d4,d4
                    lea      (lbW003C1C,pc),a2
                    move.w   (a2,d4.l),d4
                    andi.l   #$FFFF,d4
lbC000EA6:          move.b   d5,($44,a0)
                    sub.l    d4,d2
                    move.l   d2,d4
                    move.l   d2,($5A,a0)
                    move.l   ($52,a0),d2
                    lsl.l    #6,d2
                    movea.w  d2,a2
                    cmpa.l   d4,a2
                    bge.w    lbC000F96
                    move.w   d4,d2
                    lsr.w    #4,d2
                    bra.w    lbC00041A

lbC000EC8:          move.b   ($68,a0),d0
                    moveq    #0,d5
                    move.b   (7,a2),d5
                    clr.b    d7
                    clr.b    d3
                    moveq    #-1,d4
                    movea.l  ($38,sp),a5
                    bra.w    lbC0002A4

lbC000EE0:          clr.w    ($1C,a0)
                    movea.l  ($9F6,a1),a2
                    movea.l  ($9C,a2),a3
                    adda.l   ($40,sp),a3
                    move.l   a3,($3C,a0)
                    moveq    #0,d3
                    move.b   (4,a3),d3
                    lsl.l    #8,d3
                    or.b     (5,a3),d3
                    tst.w    d3
                    bne.w    lbC0010D6
                    moveq    #0,d5
                    move.b   (12,a3),d5
                    lsl.l    #8,d5
                    or.b     (13,a3),d5
                    moveq    #0,d4
                    move.w   d5,d4
                    move.b   #1,($77,a0)
                    move.l   ($9FC,a1),d6
                    add.l    d4,d6
                    move.l   d6,($6C,a0)
                    moveq    #0,d0
                    move.b   (10,a3),d0
                    lsl.l    #8,d0
                    or.b     (11,a3),d0
                    move.l   d0,d6
                    subq.l   #1,d6
                    cmp.l    d4,d6
                    ble.w    lbC00118E
                    sub.w    d5,d0
                    move.w   d0,($70,a0)
                    move.w   #$FFFF,($72,a0)
lbC000F48:          clr.w    d0
                    move.b   (7,a3),d0
                    addq.w   #1,d0
                    move.w   d0,($32,a0)
                    move.l   d4,($34,a0)
                    move.w   #1,($24,a0)
                    bra.w    lbC000394

lbC000F62:          st       ($69,a0)
                    move.b   d0,($68,a0)
                    tst.b    d2
                    bne.w    lbC00035C
                    bra.w    lbC00036E

lbC000F74:          move.w   #$40,($18,a0)
                    move.b   d0,($68,a0)
                    tst.b    d2
                    bne.w    lbC00035C
                    bra.w    lbC00036E

lbC000F88:          lsr.b    #4,d1
                    ext.w    d1
                    move.w   d1,($28,a0)
                    addq.b   #1,d0
                    bra.w    lbC000A7C

lbC000F96:          move.l   d2,($5A,a0)
                    moveq    #2,d5
                    move.l   d5,($40,a0)
                    lsr.w    #4,d2
                    bra.w    lbC00041A

lbC000FA6:          moveq    #2,d4
                    moveq    #-$71,d5
                    bra.w    lbC000EA6

lbC000FAE:          move.l   #$400,($5A,a0)
                    moveq    #1,d6
                    move.l   d6,($40,a0)
                    move.l   ($4E,a0),d2
                    movea.l  ($3C,sp),a2
                    move.b   (a2,d2.l),($44,a0)
                    moveq    #15,d2
                    cmp.l    ($52,a0),d2
                    beq.w    lbC001182
                    moveq    #$40,d2
                    bra.w    lbC00041A

lbC000FDA:          move.l   ($5A,a0),d1
                    asr.l    #6,d1
                    move.l   d1,d3
                    andi.l   #$FFFF,d3
                    moveq    #$10,d6
                    sub.l    d3,d6
                    move.l   d6,d3
                    asr.l    #1,d3
                    move.l   ($56,a0),d6
                    movea.l  ($3C,sp),a2
                    move.b   (a2,d6.l),d6
                    add.b    d3,d6
                    move.b   d6,($44,a0)
                    move.w   d1,($48,a0)
                    move.w   #$10,($46,a0)
                    moveq    #3,d1
                    move.l   d1,($40,a0)
                    move.b   d0,($68,a0)
                    tst.b    d2
                    bne.w    lbC00035C
                    bra.w    lbC00036E

lbC001020:          clr.w    ($20,a0)
                    move.b   d0,($68,a0)
                    tst.b    d2
                    bne.w    lbC00035C
                    bra.w    lbC00036E

lbC001032:          andi.b   #3,d1
                    beq.b    lbC001020
                    andi.l   #$FF,d1
                    move.b   (-1,a0,d1.l),d1
                    bne.w    lbC000826
                    move.b   d0,($68,a0)
                    moveq    #1,d7
                    move.b   d2,d3
                    bra.w    lbC000360

lbC001052:          tst.b    d6
                    beq.w    lbC0005D8
                    moveq    #0,d7
                    move.w   ($1C,a0),d7
                    addi.l   #$27F,d7
                    add.l    d7,d7
                    add.l    d7,d7
                    movea.l  (a1,d7.l),a3
                    move.l   ($6C,a0),d7
                    sub.l    a3,d7
                    move.l   d7,($2C,sp)
                    movea.w  d3,a2
                    adda.w   d7,a2
                    moveq    #0,d7
                    move.b   d1,d7
                    movea.w  d4,a5
                    suba.w   a2,a5
                    cmp.w    a5,d3
                    bcc.w    lbC001636
                    move.w   #2,($70,a0)
                    moveq    #2,d3
                    move.l   ($2C,sp),d4
                    lsr.l    d7,d4
                    add.l    a3,d4
                    move.l   d4,($6C,a0)
                    bra.w    lbC0005C0

lbC0010A0:          sub.l    d2,d1
                    moveq    #0,d2
                    move.b   (a3),d2
                    lsl.l    #8,d2
                    or.b     (1,a3),d2
                    move.w   d2,d4
                    andi.l   #$FFFF,d2
                    move.l   d2,d6
                    sub.l    d1,d6
                    bmi.w    lbC0004C6
                    move.l   d2,($34,a0)
                    move.w   #1,($24,a0)
                    tst.l    d6
                    bne.w    lbC0004CC
                    subq.w   #1,d5
                    move.w   d5,($32,a0)
                    bra.w    lbC000C66

lbC0010D6:          clr.w    ($72,a0)
                    move.b   #1,($77,a0)
                    move.l   ($9FC,a1),($6C,a0)
                    moveq    #0,d4
                    move.b   (12,a3),d4
                    lsl.l    #8,d4
                    or.b     (13,a3),d4
                    clr.w    d0
                    move.b   (7,a3),d0
                    addq.w   #1,d0
                    move.w   d0,($32,a0)
                    move.l   d4,($34,a0)
                    move.w   #1,($24,a0)
                    bra.w    lbC000394

lbC00110C:          move.w   ($24,a0),d4
                    moveq    #0,d1
                    move.b   (8,a3),d1
                    lsl.l    #8,d1
                    move.l   d1,d2
                    or.b     (9,a3),d2
                    move.l   ($34,a0),d1
                    bra.w    lbC00048A

lbC001126:          move.w   d1,($18,a0)
                    bra.w    lbC000260

lbC00112E:          moveq    #2,d2
                    move.w   d2,($70,a0)
                    move.w   #$FFFF,($72,a0)
                    clr.b    (13,a0)
                    bra.w    lbC000DEC

lbC001142:          moveq    #2,d5
                    moveq    #-$71,d6
                    move.b   d6,($44,a0)
                    sub.l    d5,d2
                    bpl.w    lbC00040C
lbC001150:          clr.l    ($5A,a0)
                    clr.w    d2
                    addi.w   #$FFF0,d4
                    move.w   d4,($46,a0)
                    bra.w    lbC00041A

lbC001162:          clr.b    ($14,a0)
                    clr.b    ($282,a0)
                    move.w   #$FF,($290,a0)
                    clr.w    d1
                    moveq    #$1F,d0
                    bra.w    lbC000B1A

lbC001178:          add.l    d2,d1
                    move.l   d1,($34,a0)
                    bra.w    lbC00048A

lbC001182:          moveq    #$10,d4
                    move.l   d4,($52,a0)
                    moveq    #$40,d2
                    bra.w    lbC00041A

lbC00118E:          moveq    #2,d0
                    move.w   d0,($70,a0)
                    move.w   #$FFFF,($72,a0)
                    bra.w    lbC000F48

lbC00119E:          move.b   d1,($68,a0)
                    clr.b    d2
                    add.b    ($69,a0),d2
                    move.b   d2,($6A,a0)
                    move.w   ($18,a0),d1
                    bra.w    lbC00037A

lbC0011B4:          clr.w    ($72,a0)
                    move.b   #1,($77,a0)
                    andi.l   #$FF,d3
                    addi.l   #$27F,d3
                    add.l    d3,d3
                    add.l    d3,d3
                    move.l   (a1,d3.l),($6C,a0)
                    moveq    #0,d3
                    move.b   (10,a2),d3
                    lsl.l    #8,d3
                    or.b     (11,a2),d3
                    bra.w    lbC000948

lbC0011E4:          clr.w    ($72,a0)
                    move.b   #1,($77,a0)
                    andi.l   #$FF,d1
                    addi.l   #$27F,d1
                    add.l    d1,d1
                    add.l    d1,d1
                    move.l   (a1,d1.l),($6C,a0)
                    moveq    #0,d6
                    move.b   (12,a2),d6
                    lsl.l    #8,d6
                    or.b     (13,a2),d6
                    clr.w    d1
                    move.b   (7,a2),d1
                    addq.w   #1,d1
                    move.w   d1,($32,a0)
                    move.l   d6,($34,a0)
                    move.w   #1,($24,a0)
                    move.w   d3,($2C,sp)
                    bra.w    lbC000A5A

lbC00122E:          movea.l  ($9F6,a1),a6
                    movea.l  a1,a2
                    moveq    #0,d0
                    lea      (lbB003D3C,pc),a3
                    move.l   a3,d7
                    lea      (lbW004484,pc),a3
                    move.l   a3,($28,sp)
                    lea      (lbW00147C,pc),a3
                    move.l   a3,($2C,sp)
                    lea      (lbB003BFC,pc),a3
                    move.l   a3,($30,sp)
                    lea      (lbB003BEC,pc),a3
                    move.l   a3,($34,sp)
                    lea      ($774,a1),a3
                    move.l   a3,($38,sp)
                    move.l   a1,($40,sp)
                    movea.l  d7,a5
lbC00126A:          move.l   a2,d1
                    addi.l   #$27C,d1
                    move.b   (8,a2),d2
                    ble.b    lbC001282
                    subq.b   #1,d2
                    move.b   d2,(8,a2)
                    beq.w    lbC00149C
lbC001282:          move.b   (9,a2),d2
                    beq.w    lbC0014D8
lbC00128A:          move.b   (10,a2),d3
                    bne.w    lbC0016E2
                    clr.w    ($12,a2)
                    move.b   #$40,(6,a2)
                    clr.w    ($10,a2)
                    st       ($15,a2)
                    clr.b    (9,a2)
                    clr.w    (10,a2)
                    clr.w    (12,a2)
                    move.w   #$40,($1E,a2)
                    move.w   #$40,($18,a2)
                    move.w   #$FF,($1C,a2)
                    clr.w    ($20,a2)
                    move.w   #$FFFF,($22,a2)
                    clr.b    ($26,a2)
                    clr.w    ($28,a2)
                    clr.w    ($2E,a2)
                    clr.w    ($30,a2)
                    move.w   #$10,($2A,a2)
                    clr.b    ($68,a2)
                    clr.b    ($6A,a2)
                    move.b   #1,($69,a2)
                    movea.l  ($9F6,a1),a3
                    moveq    #0,d3
                    move.b   d2,d3
                    addi.l   #$1FFFFFFF,d3
                    lsl.l    #3,d3
                    add.l    ($98,a3),d3
                    move.l   d3,($38,a2)
                    clr.w    d3
                    move.b   d2,d3
                    move.w   d3,($1A,a2)
                    move.b   d2,(12,a2)
lbC001314:          move.b   (15,a2),d4
                    blt.w    lbC00152C
lbC00131C:          tst.b    d4
                    beq.b    lbC00132C
                    subq.b   #1,d4
                    bne.w    lbC0016F4
                    st       (15,a2)
                    st       d4
lbC00132C:          moveq    #0,d2
                    not.b    d2
                    and.l    ($88,a6),d2
                    add.l    d2,d2
                    add.l    d2,d2
                    add.l    d0,d2
                    add.l    d2,d2
                    movea.l  ($94,a6),a3
                    adda.l   d2,a3
                    cmpa.w   #0,a3
                    beq.w    lbC00152C
                    move.b   ($9F0,a1),d2
                    cmp.b    (1,a6),d2
                    bcc.w    lbC00152C
                    move.b   (a3),d5
                    moveq    #0,d3
                    move.b   d5,d3
                    beq.w    lbC00152C
                    moveq    #$27,d6
                    add.l    d6,d3
                    add.l    d3,d3
                    add.l    d3,d3
                    andi.l   #$FF,d2
                    add.l    d2,d2
                    movea.l  ($28,sp),a0
                    moveq    #0,d5
                    move.w   (a0,d2.l),d5
                    add.l    (a6,d3.l),d5
                    beq.w    lbC00152C
                    movea.l  d5,a0
                    move.b   (1,a0),d2
                    andi.b   #15,d2
                    cmpi.b   #14,d2
                    bne.b    lbC0013B4
                    tst.b    d4
                    bne.b    lbC0013B4
                    move.b   (2,a0),d3
                    lsr.b    #4,d3
                    move.b   (2,a0),d2
                    andi.b   #15,d2
                    cmpi.b   #13,d3
                    beq.w    lbC001B6C
                    cmpi.b   #10,d3
                    beq.w    lbC001A26
lbC0013B4:          st       (15,a2)
                    move.b   (1,a3),d2
                    ext.w    d2
                    movea.w  d2,a3
                    movea.l  d5,a0
                    move.b   (a0),d3
                    move.b   (1,a0),d2
                    move.b   d3,d4
                    lsr.b    #7,d4
                    lsl.b    #4,d4
                    move.b   d2,d6
                    lsr.b    #4,d6
                    add.b    d6,d4
                    move.b   d3,d7
                    andi.b   #$3F,d7
                    tst.b    d4
                    beq.b    lbC00140C
lbC0013DE:          tst.b    d7
                    bne.b    lbC00140C
                    moveq    #0,d2
                    move.b   d4,d2
                    addi.l   #$1FFFFFFF,d2
                    lsl.l    #3,d2
                    movea.l  ($9F6,a1),a0
                    add.l    ($98,a0),d2
                    move.b   ($1F,a2),(6,a2)
                    cmp.l    ($38,a2),d2
                    beq.w    lbC001A5A
                    movea.l  d5,a0
                    move.b   (a0),d3
                    move.b   (1,a0),d2
lbC00140C:          andi.b   #$40,d3
                    andi.b   #15,d2
                    movea.l  d5,a0
                    move.b   (2,a0),d5
                    tst.b    d3
                    beq.w    lbC00176A
                    move.b   d2,d3
                    or.b     d5,d3
                    bne.w    lbC0018C0
                    clr.b    d5
                    moveq    #1,d6
                    st       d2
lbC00142E:          cmpi.b   #$3D,d7
                    beq.w    lbC0018E2
lbC001436:          tst.b    d4
                    beq.w    lbC00191A
                    tst.b    d7
                    bne.w    lbC0017AE
lbC001442:          tst.b    d3
                    beq.b    lbC001452
                    move.b   d3,(9,a2)
                    move.b   d5,d3
                    lsr.b    #4,d3
                    move.b   d3,(10,a2)
lbC001452:          clr.b    (11,a2)
                    clr.w    ($12,a2)
                    tst.b    d6
                    bne.w    lbC00152C
                    cmpi.b   #15,d2
                    bhi.w    lbC00152C
                    andi.l   #$FF,d2
                    add.l    d2,d2
                    movea.l  ($2C,sp),a0
                    move.w   (a0,d2.l),d2
                    jmp      (lbW00147C,pc,d2.w)

lbW00147C:          dc.w     lbC00152C-lbW00147C,lbC001A74-lbW00147C
                    dc.w     lbC001B56-lbW00147C,lbC00152C-lbW00147C
                    dc.w     lbC001B16-lbW00147C,lbC001678-lbW00147C
                    dc.w     lbC00152C-lbW00147C,lbC00152C-lbW00147C
                    dc.w     lbC00152C-lbW00147C,lbC001B06-lbW00147C
                    dc.w     lbC001ABC-lbW00147C,lbC001AAC-lbW00147C
                    dc.w     lbC001A98-lbW00147C,lbC001A88-lbW00147C
                    dc.w     lbC00152C-lbW00147C,lbC001AE0-lbW00147C
lbC00149C:          move.l   ($5A,a2),d3
                    asr.l    #6,d3
                    move.l   d3,d2
                    andi.l   #$FFFF,d2
                    moveq    #$10,d4
                    sub.l    d2,d4
                    move.l   d4,d2
                    asr.l    #1,d2
                    move.l   ($56,a2),d4
                    move.b   (a5,d4.l),d4
                    add.b    d2,d4
                    move.b   d4,($44,a2)
                    move.w   d3,($48,a2)
                    move.w   #$10,($46,a2)
                    moveq    #3,d5
                    move.l   d5,($40,a2)
                    move.b   (9,a2),d2
                    bne.w    lbC00128A
lbC0014D8:          move.w   ($10,a2),d3
                    beq.w    lbC0016DA
                    move.w   ($2C,a2),d2
                    moveq    #0,d4
                    move.w   d3,d4
                    clr.w    d5
                    move.b   (7,a2),d5
                    movea.w  d2,a3
                    cmp.l    a3,d4
                    ble.w    lbC0016BC
                    add.w    d5,d2
                    move.w   d2,($2C,a2)
                    move.b   (11,a2),d5
                    movea.w  d2,a3
                    cmpa.l   d4,a3
                    bgt.w    lbC0016CE
lbC001508:          tst.b    d5
                    beq.w    lbC001314
                    add.b    (6,a2),d5
                    bmi.w    lbC0016EC
                    cmpi.b   #$40,d5
                    ble.w    lbC001956
                    move.b   #$40,(6,a2)
                    move.b   (15,a2),d4
                    bge.w    lbC00131C
lbC00152C:          move.b   ($14,a2),d2
lbC001530:          tst.b    d2
                    bne.w    lbC0016A8
lbC001536:          movea.l  d1,a2
                    addq.l   #1,d0
                    moveq    #3,d1
                    cmp.l    d0,d1
                    bge.w    lbC00126A
lbC001542:          movea.l  ($40,sp),a0
                    move.b   ($9F4,a1),d0
                    subq.b   #1,d0
                    move.b   d0,($9F4,a1)
                    bne.w    lbC0001F6
                    clr.b    (15,a1)
                    clr.b    ($28B,a1)
                    clr.b    ($507,a1)
                    clr.b    ($783,a1)
                    move.b   ($9F1,a1),d0
                    move.b   (1,a6),d2
                    moveq    #0,d1
                    move.b   d2,d1
                    subq.l   #1,d1
                    tst.b    d0
                    blt.w    lbC00195E
                    move.b   d0,d3
                    ext.w    d3
                    movea.w  d3,a2
                    cmp.l    a2,d1
                    ble.w    lbC0019D4
                    move.b   d0,($9F0,a1)
                    moveq    #0,d3
                    not.b    d3
                    and.l    ($88,a6),d3
                    addq.l   #1,d3
                    move.l   d3,($88,a6)
                    cmp.l    ($8C,a6),d3
                    blt.b    lbC0015A2
lbC00159C:          move.l   ($90,a6),($88,a6)
lbC0015A2:          st       ($9F1,a1)
                    move.b   ($9F2,a1),d3
                    blt.w    lbC001A0A
lbC0015AE:          clr.b    ($9F0,a1)
                    move.b   ($1C6C,a1),d0
                    bne.w    lbC00187E
                    ext.w    d3
                    movea.w  d3,a2
                    move.l   a2,($88,a6)
                    cmpa.l   ($8C,a6),a2
                    blt.w    lbC00187E
                    move.l   ($90,a6),($88,a6)
                    st       ($9F2,a1)
                    cmpi.b   #1,d2
                    bhi.b    lbC0015F8
                    clr.b    ($9F0,a1)
lbC0015DE:          moveq    #0,d0
                    not.b    d0
                    and.l    ($88,a6),d0
                    addq.l   #1,d0
                    move.l   d0,($88,a6)
                    cmp.l    ($8C,a6),d0
                    blt.b    lbC0015F8
                    move.l   ($90,a6),($88,a6)
lbC0015F8:          move.b   ($9F3,a1),d1
                    cmpi.b   #$2F,d1
                    bhi.w    lbC001A00
lbC001604:          move.b   d1,($9F4,a1)
lbC001608:          clr.l    ($28,sp)
                    lea      (lbW004000,pc),a2
                    move.l   a2,($34,sp)
                    clr.w    d0
                    moveq    #$2A,d1
                    mulu.w   d1,d0
                    move.l   d0,($40,sp)
                    lea      (lbW004484,pc),a2
                    move.l   a2,($38,sp)
                    lea      (lbW000328,pc),a6
                    lea      (lbB003D3C,pc),a3
                    move.l   a3,($3C,sp)
                    bra.w    lbC000220

lbC001636:          add.w    a2,d3
                    sub.w    d4,d3
                    moveq    #0,d4
                    move.w   d3,d4
                    asr.l    d7,d4
                    move.w   d4,d3
                    move.w   d4,($70,a0)
                    move.l   ($2C,sp),d4
                    lsr.l    d7,d4
                    add.l    a3,d4
                    move.l   d4,($6C,a0)
                    bra.w    lbC0005C0

lbC001656:          sub.w    d7,d1
                    move.w   d1,($70,a0)
                    move.w   #$FFFF,($72,a0)
                    bra.w    lbC000A40

lbC001666:          sub.w    ($32,sp),d6
                    move.w   d6,($70,a0)
                    move.w   #$FFFF,($72,a0)
                    bra.w    lbC000948

lbC001678:          cmpa.l   ($38,sp),a2
                    beq.w    lbC00152C
                    lea      ($302,a2),a3
                    move.l   a2,d2
                    addi.l   #$502,d2
                    movea.l  ($40,sp),a0
lbC001690:          clr.b    (a3)
                    lea      ($10,a3),a3
                    cmp.l    a3,d2
                    bne.b    lbC001690
                    move.l   a0,($40,sp)
                    tst.b    d5
                    bne.w    lbC001C4E
                    st       ($14,a2)
lbC0016A8:          lea      ($4F8,a2),a2
                    addq.l   #1,d0
                    addq.l   #1,d0
                    moveq    #3,d1
                    cmp.l    d0,d1
                    bge.w    lbC00126A
                    bra.w    lbC001542

lbC0016BC:          sub.w    d5,d2
                    move.w   d2,($2C,a2)
                    move.b   (11,a2),d5
                    movea.w  d2,a3
                    cmpa.l   d4,a3
                    bge.w    lbC001508
lbC0016CE:          move.w   d3,($2C,a2)
                    clr.w    ($10,a2)
                    bra.w    lbC001508

lbC0016DA:          move.b   (11,a2),d5
                    bra.w    lbC001508

lbC0016E2:          subq.b   #1,d3
                    move.b   d3,(10,a2)
                    bra.w    lbC0014D8

lbC0016EC:          clr.b    (6,a2)
                    bra.w    lbC001314

lbC0016F4:          move.b   d4,(15,a2)
                    movea.l  d1,a2
                    addq.l   #1,d0
                    moveq    #3,d1
                    cmp.l    d0,d1
                    bge.w    lbC00126A
                    bra.w    lbC001542

lbC001708:          move.l   ($A5C,a1),($DFF0D0)
                    move.w   #1,($DFF0D4)
                    clr.w    d0
                    move.b   ($7EA,a1),d0
                    move.w   d0,($DFF0D8)
                    movem.l  (sp)+,d2-d7/a2/a3/a5/a6
                    lea      ($24,sp),sp
                    rts

lbC00172E:          move.l   ($A5C,a1),($DFF0C0)
                    move.w   #1,($DFF0C4)
                    bra.w    lbC0007BA

lbC001742:          move.l   ($A5C,a1),($DFF0B0)
                    move.w   #1,($DFF0B4)
                    bra.w    lbC00078A

lbC001756:          move.l   ($A5C,a1),($DFF0A0)
                    move.w   #1,($DFF0A4)
                    bra.w    lbC00075A

lbC00176A:          tst.b    d2
                    bne.w    lbC001950
                    tst.b    d5
                    beq.w    lbC0019F6
                    move.b   d5,d6
                    andi.b   #15,d6
                    tst.b    d7
                    bne.w    lbC00194C
                    move.l   a3,d2
                    addq.l   #1,d2
                    lsl.l    #4,d2
                    movea.l  d2,a3
                    move.w   d2,($3C,sp)
                    tst.b    d6
                    bne.w    lbC001B98
                    clr.l    (a2)
                    move.b   d7,d2
                    move.b   d4,d3
lbC00179A:          move.w   #$10,($2A,a2)
                    move.w   ($3C,sp),($2C,a2)
                    clr.w    ($10,a2)
                    bra.w    lbC001442

lbC0017AE:          andi.l   #$FF,d7
                    add.l    a3,d7
                    lsl.l    #4,d7
                    movea.l  d7,a3
                    move.w   d7,($3C,sp)
                    cmpi.b   #3,d2
                    beq.w    lbC001936
                    clr.w    ($12,a2)
                    move.b   #$40,(6,a2)
                    clr.w    ($10,a2)
                    st       ($15,a2)
                    clr.b    (9,a2)
                    clr.w    (10,a2)
                    clr.w    (12,a2)
                    move.w   #$40,($1E,a2)
                    move.w   #$40,($18,a2)
                    move.w   #$FF,($1C,a2)
                    clr.w    ($20,a2)
                    move.w   #$FFFF,($22,a2)
                    clr.b    ($26,a2)
                    clr.w    ($28,a2)
                    clr.w    ($2C,a2)
                    clr.w    ($2E,a2)
                    clr.w    ($30,a2)
                    move.w   #$10,($2A,a2)
                    clr.b    ($68,a2)
                    clr.b    ($6A,a2)
                    move.b   #1,($69,a2)
                    moveq    #0,d7
                    move.b   d4,d7
                    addi.l   #$1FFFFFFF,d7
                    lsl.l    #3,d7
                    movea.l  ($9F6,a1),a0
                    add.l    ($98,a0),d7
                    move.l   d7,($38,a2)
                    clr.w    d7
                    move.b   d4,d7
                    move.w   d7,($1A,a2)
                    move.b   d4,(12,a2)
lbC00184C:          tst.b    d6
                    beq.w    lbC00193C
lbC001852:          cmpi.b   #3,d2
                    bne.w    lbC00179A
lbC00185A:          lea      ($10,a3),a3
                    move.w   a3,($10,a2)
                    move.w   ($2A,a2),d2
                    add.w    d2,($2C,a2)
                    clr.w    ($2A,a2)
                    tst.b    d5
                    beq.w    lbC001B92
                    move.b   d5,(7,a2)
                    moveq    #3,d2
                    bra.w    lbC001442

lbC00187E:          st       ($9F2,a1)
                    cmpi.b   #1,d2
                    bhi.w    lbC0015F8
                    clr.b    ($9F0,a1)
                    tst.b    d0
                    beq.w    lbC0015DE
lbC001894:          move.b   ($9F3,a1),d1
                    cmpi.b   #$2F,d1
                    bls.w    lbC001604
                    bra.w    lbC001A00

lbC0018A4:          addi.b   #$20,d1
                    move.b   d1,d0
                    ext.w    d0
                    ext.l    d0
                    moveq    #7,d5
                    and.l    d5,d1
                    lea      (lbB003E44,pc),a2
                    move.b   (a2,d1.l),d1
                    ext.w    d1
                    bra.w    lbC000B1A

lbC0018C0:          move.b   d2,(a2)
                    move.b   d5,d2
                    lsr.b    #4,d2
                    move.b   d2,(1,a2)
                    move.b   d5,d2
                    andi.b   #15,d2
                    move.b   d2,(2,a2)
                    moveq    #1,d6
                    st       d2
                    clr.b    d3
                    cmpi.b   #$3D,d7
                    bne.w    lbC001436
lbC0018E2:          move.l   ($5A,a2),d4
                    asr.l    #6,d4
                    move.l   d4,d7
                    andi.l   #$FFFF,d7
                    movea.w  #$10,a3
                    suba.l   d7,a3
                    move.l   a3,d7
                    asr.l    #1,d7
                    movea.l  ($56,a2),a3
                    add.b    (a5,a3.l),d7
                    move.b   d7,($44,a2)
                    move.w   d4,($48,a2)
                    move.w   #$10,($46,a2)
                    moveq    #3,d4
                    move.l   d4,($40,a2)
                    bra.w    lbC001442

lbC00191A:          tst.b    d7
                    beq.w    lbC001442
                    moveq    #0,d4
                    move.b   d7,d4
                    add.l    a3,d4
                    lsl.l    #4,d4
                    movea.l  d4,a3
                    move.w   d4,($3C,sp)
                    tst.b    d6
                    bne.w    lbC001852
                    bra.b    lbC00193C

lbC001936:          tst.b    d6
                    bne.w    lbC00185A
lbC00193C:          clr.l    (a2)
                    clr.b    d6
                    cmpi.b   #3,d2
                    bne.w    lbC00179A
                    bra.w    lbC00185A

lbC00194C:          move.b   d4,d3
                    move.b   d6,d4
lbC001950:          clr.b    d6
                    bra.w    lbC00142E

lbC001956:          move.b   d5,(6,a2)
                    bra.w    lbC001314

lbC00195E:          move.b   ($9F2,a1),d3
                    bge.w    lbC0015AE
                    move.b   ($9F0,a1),d0
                    moveq    #0,d2
                    move.b   d0,d2
                    cmp.l    d1,d2
                    bge.w    lbC001A14
                    addq.l   #1,d2
                    movea.l  ($9F6,a1),a2
                    moveq    #0,d1
                    move.b   (1,a2),d1
                    cmp.l    d2,d1
                    ble.w    lbC001B88
                    addq.b   #1,d0
                    move.b   d0,($9F0,a1)
lbC00198C:          move.b   ($9F3,a1),d1
                    cmpi.b   #$2F,d1
                    bls.w    lbC001604
                    btst     #0,d0
                    beq.b    lbC001A00
                    andi.b   #15,d1
                    move.b   d1,($9F4,a1)
                    clr.l    ($28,sp)
                    lea      (lbW004000,pc),a2
                    move.l   a2,($34,sp)
                    clr.w    d0
                    moveq    #$2A,d1
                    mulu.w   d1,d0
                    move.l   d0,($40,sp)
                    lea      (lbW004484,pc),a2
                    move.l   a2,($38,sp)
                    lea      (lbW000328,pc),a6
                    lea      (lbB003D3C,pc),a3
                    move.l   a3,($3C,sp)
                    bra.w    lbC000220

lbC0019D4:          move.b   d2,d0
                    subq.b   #1,d0
                    move.b   d0,($9F0,a1)
                    moveq    #0,d3
                    not.b    d3
                    and.l    ($88,a6),d3
                    addq.l   #1,d3
                    move.l   d3,($88,a6)
                    cmp.l    ($8C,a6),d3
                    blt.w    lbC0015A2
                    bra.w    lbC00159C

lbC0019F6:          clr.b    d6
                    move.b   d5,d2
                    move.b   d5,d3
                    bra.w    lbC00142E

lbC001A00:          lsr.b    #4,d1
                    move.b   d1,($9F4,a1)
                    bra.w    lbC001608

lbC001A0A:          moveq    #0,d2
                    move.b   d0,d2
                    cmp.l    d2,d1
                    bgt.w    lbC00198C
lbC001A14:          move.b   ($1C6C,a1),d0
                    clr.b    ($9F0,a1)
                    tst.b    d0
                    bne.w    lbC001894
                    bra.w    lbC0015DE

lbC001A26:          move.b   d2,(14,a2)
                    st       (15,a2)
                    move.b   (1,a3),d2
                    ext.w    d2
                    movea.w  d2,a3
                    movea.l  d5,a0
                    move.b   (a0),d3
                    move.b   (1,a0),d2
                    move.b   d3,d4
                    lsr.b    #7,d4
                    lsl.b    #4,d4
                    move.b   d2,d6
                    lsr.b    #4,d6
                    add.b    d6,d4
                    move.b   d3,d7
                    andi.b   #$3F,d7
                    tst.b    d4
                    beq.w    lbC00140C
                    bra.w    lbC0013DE

lbC001A5A:          clr.l    ($40,a2)
                    clr.l    ($5A,a2)
                    move.b   #1,($5E,a2)
                    movea.l  d5,a0
                    move.b   (a0),d3
                    move.b   (1,a0),d2
                    bra.w    lbC00140C

lbC001A74:          andi.w   #$FF,d5
                    move.w   d5,($12,a2)
                    move.b   ($14,a2),d2
                    beq.w    lbC001536
                    bra.w    lbC0016A8

lbC001A88:          move.b   d5,($9F1,a1)
                    move.b   ($14,a2),d2
                    beq.w    lbC001536
                    bra.w    lbC0016A8

lbC001A98:          cmpi.b   #$40,d5
                    bls.b    lbC001AA0
                    moveq    #$40,d5
lbC001AA0:          move.b   d5,(6,a2)
                    move.b   ($14,a2),d2
                    bra.w    lbC001530

lbC001AAC:          move.b   d5,($9F2,a1)
                    move.b   ($14,a2),d2
                    beq.w    lbC001536
                    bra.w    lbC0016A8

lbC001ABC:          move.b   ($14,a2),d2
                    tst.b    d5
                    beq.w    lbC001530
                    move.b   d5,d3
                    andi.b   #15,d3
                    beq.w    lbC001C82
                    neg.b    d5
                    move.b   d5,(11,a2)
lbC001AD6:          tst.b    d2
                    beq.w    lbC001536
                    bra.w    lbC0016A8

lbC001AE0:          move.b   d5,($9F3,a1)
                    cmpi.b   #$2F,d5
                    bhi.w    lbC001C2A
                    move.b   d5,($9F4,a1)
                    sne      d2
                    neg.b    d2
                    move.b   d2,($9FA,a1)
                    move.b   ($14,a2),d2
lbC001AFC:          tst.b    d2
                    beq.w    lbC001536
                    bra.w    lbC0016A8

lbC001B06:          move.b   d5,(13,a2)
                    move.b   ($14,a2),d2
                    beq.w    lbC001536
                    bra.w    lbC0016A8

lbC001B16:          clr.w    ($60,a2)
                    move.w   #1,($66,a2)
                    moveq    #15,d2
                    and.l    d5,d2
                    movea.l  ($30,sp),a0
                    move.b   (a0,d2.l),d2
                    andi.w   #$FF,d2
                    move.w   d2,($62,a2)
                    move.b   d5,d2
                    lsr.b    #4,d2
                    andi.l   #$FF,d2
                    movea.l  ($34,sp),a3
                    move.b   (a3,d2.l),d2
                    andi.w   #$FF,d2
                    move.w   d2,($64,a2)
                    move.b   ($14,a2),d2
                    bra.w    lbC001530

lbC001B56:          andi.w   #$FF,d5
                    neg.w    d5
                    move.w   d5,($12,a2)
                    move.b   ($14,a2),d2
                    beq.w    lbC001536
                    bra.w    lbC0016A8

lbC001B6C:          tst.b    ($9F3,a1)
                    beq.w    lbC0013B4
                    move.b   d2,(15,a2)
                    movea.l  d1,a2
                    addq.l   #1,d0
                    moveq    #3,d1
                    cmp.l    d0,d1
                    bge.w    lbC00126A
                    bra.w    lbC001542

lbC001B88:          clr.b    d0
                    move.b   d0,($9F0,a1)
                    bra.w    lbC00198C

lbC001B92:          moveq    #3,d2
                    bra.w    lbC001442

lbC001B98:          move.b   d4,d3
                    move.b   d7,d2
                    move.b   d6,d4
                    clr.b    d6
                    clr.w    ($12,a2)
                    move.b   #$40,(6,a2)
                    clr.w    ($10,a2)
                    st       ($15,a2)
                    clr.b    (9,a2)
                    clr.w    (10,a2)
                    clr.w    (12,a2)
                    move.w   #$40,($1E,a2)
                    move.w   #$40,($18,a2)
                    move.w   #$FF,($1C,a2)
                    clr.w    ($20,a2)
                    move.w   #$FFFF,($22,a2)
                    clr.b    ($26,a2)
                    clr.w    ($28,a2)
                    clr.w    ($2C,a2)
                    clr.w    ($2E,a2)
                    clr.w    ($30,a2)
                    move.w   #$10,($2A,a2)
                    clr.b    ($68,a2)
                    clr.b    ($6A,a2)
                    move.b   #1,($69,a2)
                    moveq    #0,d7
                    move.b   d4,d7
                    addi.l   #$1FFFFFFF,d7
                    lsl.l    #3,d7
                    movea.l  ($9F6,a1),a0
                    add.l    ($98,a0),d7
                    move.l   d7,($38,a2)
                    clr.w    d7
                    move.b   d4,d7
                    move.w   d7,($1A,a2)
                    move.b   d4,(12,a2)
                    bra.w    lbC00184C

lbC001C2A:          move.b   d5,d2
                    btst     #0,($9F0,a1)
                    beq.b    lbC001C6A
                    andi.b   #15,d2
                    move.b   d2,($9F4,a1)
                    tst.b    d5
                    sne      d2
                    neg.b    d2
                    move.b   d2,($9FA,a1)
                    move.b   ($14,a2),d2
                    bra.w    lbC001AFC

lbC001C4E:          move.b   d5,d2
                    andi.b   #15,d2
                    add.b    d2,d2
                    move.b   d2,($14,a2)
                    lsr.b    #4,d5
                    move.b   d5,($16,a2)
                    tst.b    d2
                    beq.w    lbC001536
                    bra.w    lbC0016A8

lbC001C6A:          lsr.b    #4,d2
                    move.b   d2,($9F4,a1)
                    tst.b    d5
                    sne      d2
                    neg.b    d2
                    move.b   d2,($9FA,a1)
                    move.b   ($14,a2),d2
                    bra.w    lbC001AFC

lbC001C82:          lsr.b    #4,d5
                    move.b   d5,(11,a2)
                    bra.w    lbC001AD6

lbC001C8C:          move.l   ($4A,a0),d4
                    bra.w    lbC000C26

playerTick:         lea      (lbL000000,pc),a1
                    adda.l   (20,a1),a1
                    move.l   a0,-(sp)
                    jsr      (a1)
                    addq.l   #4,sp
                    rts

playerInit:         move.l   a3,-(sp)
                    move.l   a2,-(sp)
                    lea      (lbL000000,pc),a3
                    adda.l   (16,a3),a3
                    move.l   a2,-(sp)
                    move.l   a1,-(sp)
                    move.l   a0,-(sp)
                    jsr      (a3)
                    lea      (12,sp),sp
                    movea.l  (sp)+,a2
                    movea.l  (sp)+,a3
                    rts

songInit:           move.l   a3,-(sp)
                    move.l   a2,-(sp)
                    lea      (lbL000000,pc),a3
                    adda.l   (12,a3),a3
                    move.l   a2,-(sp)
                    move.l   a1,-(sp)
                    move.l   a0,-(sp)
                    jsr      (a3)
                    lea      (12,sp),sp
                    movea.l  (sp)+,a2
                    movea.l  (sp)+,a3
                    rts

lbC001CE0:          movem.l  d2-d7/a2/a3,-(sp)
                    move.l   ($24,sp),d0
                    move.l   ($28,sp),d5
                    movea.l  ($2C,sp),a1
                    move.l   a1,d4
                    subq.l   #1,d4
                    cmpa.w   #0,a1
                    beq.w    lbC001DA8
                    move.b   d5,d7
                    move.l   d0,d1
                    neg.l    d1
                    moveq    #3,d2
                    and.l    d2,d1
                    moveq    #5,d6
                    movea.l  d0,a2
                    cmp.l    d4,d6
                    bcc.b    lbC001D78
                    tst.l    d1
                    beq.b    lbC001D36
                    move.b   d5,(a2)+
                    subq.l   #1,d4
                    moveq    #1,d2
                    cmp.l    d1,d2
                    beq.b    lbC001D36
                    movea.l  d0,a2
                    addq.l   #2,a2
                    movea.l  d0,a0
                    move.b   d5,(1,a0)
                    subq.l   #1,d4
                    moveq    #3,d2
                    cmp.l    d1,d2
                    bne.b    lbC001D36
                    addq.l   #1,a2
                    move.b   d5,(2,a0)
                    subq.l   #1,d4
lbC001D36:          move.l   a1,d3
                    sub.l    d1,d3
                    moveq    #0,d6
                    move.b   d5,d6
                    move.l   d6,d2
                    swap     d2
                    clr.w    d2
                    movea.l  d2,a0
                    move.l   d6,d2
                    lsl.w    #8,d2
                    swap     d2
                    clr.w    d2
                    lsl.l    #8,d6
                    movea.l  d6,a3
                    move.l   a0,d6
                    or.l     d6,d2
                    move.l   a3,d6
                    or.l     d6,d2
                    move.b   d7,d2
                    movea.l  d0,a0
                    adda.l   d1,a0
                    moveq    #-4,d1
                    and.l    d3,d1
                    add.l    a0,d1
lbC001D66:          move.l   d2,(a0)+
                    cmpa.l   d1,a0
                    bne.b    lbC001D66
                    moveq    #-4,d1
                    and.l    d3,d1
                    adda.l   d1,a2
                    sub.l    d1,d4
                    cmp.l    d3,d1
                    beq.b    lbC001DA8
lbC001D78:          move.b   d5,(a2)
                    tst.l    d4
                    beq.b    lbC001DA8
                    move.b   d5,(1,a2)
                    moveq    #1,d1
                    cmp.l    d4,d1
                    beq.b    lbC001DA8
                    move.b   d5,(2,a2)
                    moveq    #2,d2
                    cmp.l    d4,d2
                    beq.b    lbC001DA8
                    move.b   d5,(3,a2)
                    moveq    #3,d6
                    cmp.l    d4,d6
                    beq.b    lbC001DA8
                    move.b   d5,(4,a2)
                    subq.l   #4,d4
                    beq.b    lbC001DA8
                    move.b   d5,(5,a2)
lbC001DA8:          movem.l  (sp)+,d2-d7/a2/a3
                    rts

lbC001DAE:          lea      (-$78,sp),sp
                    movem.l  d2-d7/a2/a3/a5/a6,-(sp)
                    movea.l  ($A4,sp),a5
                    pea      ($1C6E).w
                    clr.l    -(sp)
                    move.l   a5,-(sp)
                    lea      (lbC001CE0,pc),a0
                    move.l   a0,($78,sp)
                    jsr      (a0)
                    move.w   (lbW004002,pc),d2
                    lea      (12,sp),sp
                    beq.w    lbC0027F6
lbC001DD8:          movea.l  ($AC,sp),a1
                    move.w   (2,a1),($32,sp)
                    move.w   ($32,sp),d0
                    add.w    d0,d0
                    add.w    ($32,sp),d0
                    andi.l   #$FFFF,d0
                    move.l   (4,a1),d1
                    lea      ($A0,a1),a0
                    lea      ($49C,a1),a1
lbC001DFE:          move.l   d1,(a0)+
                    add.l    d0,d1
                    cmpa.l   a1,a0
                    bne.b    lbC001DFE
                    clr.b    ($9FA,a5)
                    move.l   ($AC,sp),($9F6,a5)
                    move.w   #$FF,($9F0,a5)
                    move.w   #$FF06,($9F2,a5)
                    clr.b    ($9F4,a5)
                    clr.b    ($1C6C,a5)
                    movea.l  ($AC,sp),a3
                    move.l   ($9C,a3),d0
                    move.b   #$40,(6,a5)
                    clr.w    ($10,a5)
                    clr.w    ($12,a5)
                    move.w   #$FF,($14,a5)
                    clr.b    ($16,a5)
                    clr.w    (8,a5)
                    clr.w    (10,a5)
                    clr.w    (12,a5)
                    clr.l    (a5)
                    clr.l    ($5A,a5)
                    moveq    #3,d1
                    move.l   d1,($40,a5)
                    move.l   d0,($3C,a5)
                    move.b   #$40,($282,a5)
                    clr.w    ($28C,a5)
                    clr.w    ($28E,a5)
                    move.w   #$FF,($290,a5)
                    clr.b    ($292,a5)
                    clr.w    ($284,a5)
                    clr.w    ($286,a5)
                    clr.w    ($288,a5)
                    clr.l    ($27C,a5)
                    clr.l    ($2D6,a5)
                    move.l   d1,($2BC,a5)
                    move.l   d0,($2B8,a5)
                    move.b   #$40,($4FE,a5)
                    clr.w    ($508,a5)
                    clr.w    ($50A,a5)
                    move.w   #$FF,($50C,a5)
                    clr.b    ($50E,a5)
                    clr.w    ($500,a5)
                    clr.w    ($502,a5)
                    clr.w    ($504,a5)
                    clr.l    ($4F8,a5)
                    clr.l    ($552,a5)
                    move.l   d1,($538,a5)
                    move.l   d0,($534,a5)
                    clr.b    ($788,a5)
                    clr.b    ($78A,a5)
                    clr.w    ($786,a5)
                    move.b   #$40,($77A,a5)
                    clr.w    ($784,a5)
                    clr.b    ($77F,a5)
                    clr.w    ($77C,a5)
                    clr.b    ($781,a5)
                    clr.b    ($77E,a5)
                    st       ($789,a5)
                    clr.b    ($780,a5)
                    clr.l    ($774,a5)
                    clr.l    ($7CE,a5)
                    move.l   d1,($7B4,a5)
                    move.l   d0,($7B0,a5)
                    lea      (lbW003BD4,pc),a6
                    lea      ($BE0,a5),a2
                    moveq    #0,d5
                    lea      (lbC003B4A,pc),a0
                    move.l   a0,($60,sp)
                    lea      (lbC003AEE,pc),a1
                    move.l   a1,($38,sp)
                    move.l   a5,($3C,sp)
lbC001F24:          moveq    #0,d0
                    move.w   (a6)+,d0
                    move.l   d0,-(sp)
                    move.l   #$400000,-(sp)
                    movea.l  ($68,sp),a3
                    jsr      (a3)
                    addq.l   #8,sp
                    move.l   d0,d6
                    move.b   d0,(a2)
                    move.l   d0,-(sp)
                    move.l   #$FF00,-(sp)
                    movea.l  ($40,sp),a5
                    jsr      (a5)
                    addq.l   #8,sp
                    move.l   d6,d1
                    lsr.l    #1,d1
                    movea.l  d1,a5
                    move.l   d6,d4
                    lsr.l    #2,d4
                    neg.w    d4
                    suba.l   a3,a3
                    clr.w    d7
                    suba.l   a1,a1
                    moveq    #0,d3
                    move.l   d5,d1
                    add.l    d5,d1
                    add.l    d5,d1
                    lsl.l    #7,d1
                    add.l    d5,d1
                    add.l    ($3C,sp),d1
                    move.w   d0,($34,sp)
lbC001F72:          moveq    #0,d2
                    move.w   a1,d2
                    asr.l    #8,d2
                    movea.l  d1,a0
                    adda.l   d3,a0
                    moveq    #$7F,d0
                    sub.b    d2,d0
                    move.b   d0,($A60,a0)
                    add.b    d2,d2
                    movea.w  d4,a0
                    tst.w    d4
                    blt.w    lbC0021F2
                    movea.w  a0,a0
                    adda.l   d1,a0
                    cmpa.l   a3,a5
                    bcc.w    lbC0021FE
lbC001F98:          moveq    #$7F,d0
                    sub.b    d2,d0
                    move.b   d0,($B60,a0)
                    moveq    #-$80,d2
lbC001FA2:          movea.l  d1,a0
                    adda.l   d3,a0
                    move.b   d2,($AE0,a0)
                    adda.w   ($34,sp),a1
                    addq.w   #1,d7
                    moveq    #0,d3
                    move.w   d7,d3
                    movea.l  d3,a3
                    addq.w   #1,d4
                    cmp.l    d3,d6
                    bhi.b    lbC001F72
lbC001FBC:          addq.l   #1,d5
                    lea      ($181,a2),a2
                    moveq    #12,d1
                    cmp.l    d5,d1
                    bne.w    lbC001F24
                    movea.l  ($3C,sp),a5
                    tst.l    ($A8,sp)
                    beq.b    lbC00204A
                    move.l   ($A8,sp),($A5C,a5)
                    movea.l  ($A8,sp),a0
                    clr.b    (a0)
                    movea.l  ($A5C,a5),a0
                    clr.b    (1,a0)
                    movea.l  ($AC,sp),a1
                    move.b   (a1),d0
                    beq.b    lbC00204A
                    move.l   ($A5C,a5),d2
                    lea      ($9FC,a5),a2
                    movea.w  #$14,a0
                    adda.l   ($9C,a1),a0
                    andi.l   #$FF,d0
                    add.l    d0,d0
                    add.l    d0,d0
                    move.l   a5,d1
                    add.l    d0,d1
                    addi.l   #$9FC,d1
                    movea.w  #2,a1
lbC002018:          lea      (a1,d2.l),a3
                    move.l   a3,(a2)+
                    moveq    #0,d0
                    move.b   (5,a0),d0
                    addq.l   #1,d0
                    lsl.l    #7,d0
                    btst     #2,(a0)
                    beq.w    lbC002230
                    move.l   d0,d3
                    lsr.l    #1,d3
                    move.l   d0,d4
                    lsr.l    #2,d4
                    add.l    d4,d3
                    add.l    d0,d3
                    lsr.l    #3,d0
                    add.l    d3,d0
                    adda.l   d0,a1
                    lea      ($2A,a0),a0
                    cmp.l    a2,d1
                    bne.b    lbC002018
lbC00204A:          move.l   ($DFF004),d0
                    move.l   d0,($88,sp)
                    move.l   ($88,sp),d0
                    lsr.l    #8,d0
                    andi.l   #$1FF,d0
                    move.l   d0,($88,sp)
                    move.l   ($88,sp),d0
                    cmpi.l   #$C8,d0
                    bne.b    lbC00204A
lbC002070:          move.l   ($DFF004),d0
                    move.l   d0,($84,sp)
                    move.l   ($84,sp),d0
                    lsr.l    #8,d0
                    andi.l   #$1FF,d0
                    move.l   d0,($84,sp)
                    move.l   ($84,sp),d0
                    cmpi.l   #$C7,d0
                    bne.b    lbC002070
                    move.w   #$780,($DFF09A)
                    move.w   #$780,($DFF09C)
                    move.w   #$780,($DFF09C)
                    movea.l  #$BFE001,a0
                    move.b   (a0),d0
                    ori.b    #2,d0
                    move.b   d0,(a0)
                    move.w   #15,($DFF096)
lbC0020C4:          move.l   ($DFF004),d0
                    move.l   d0,($98,sp)
                    move.l   ($98,sp),d0
                    lsr.l    #8,d0
                    andi.l   #$1FF,d0
                    move.l   d0,($98,sp)
                    move.l   ($98,sp),d0
                    cmpi.l   #$C8,d0
                    bne.b    lbC0020C4
lbC0020EA:          move.l   ($DFF004),d0
                    move.l   d0,($94,sp)
                    move.l   ($94,sp),d0
                    lsr.l    #8,d0
                    andi.l   #$1FF,d0
                    move.l   d0,($94,sp)
                    move.l   ($94,sp),d0
                    cmpi.l   #$C7,d0
                    bne.b    lbC0020EA
                    moveq    #0,d0
                    move.l   d0,($DFF0A0)
                    move.w   #2,($DFF0A4)
                    move.w   #0,($DFF0A8)
                    move.w   #0,($DFF0A6)
                    move.l   d0,($DFF0B0)
                    move.w   #2,($DFF0B4)
                    move.w   #0,($DFF0B8)
                    move.w   #0,($DFF0B6)
                    move.l   d0,($DFF0C0)
                    move.w   #2,($DFF0C4)
                    move.w   #0,($DFF0C8)
                    move.w   #0,($DFF0C6)
                    move.l   d0,($DFF0D0)
                    move.w   #2,($DFF0D4)
                    move.w   #0,($DFF0D8)
                    move.w   #0,($DFF0D6)
                    move.w   #$820F,($DFF096)
lbC002192:          move.l   ($DFF004),d0
                    move.l   d0,($90,sp)
                    move.l   ($90,sp),d0
                    lsr.l    #8,d0
                    andi.l   #$1FF,d0
                    move.l   d0,($90,sp)
                    move.l   ($90,sp),d0
                    cmpi.l   #$C8,d0
                    bne.b    lbC002192
lbC0021B8:          move.l   ($DFF004),d0
                    move.l   d0,($8C,sp)
                    move.l   ($8C,sp),d0
                    lsr.l    #8,d0
                    andi.l   #$1FF,d0
                    move.l   d0,($8C,sp)
                    move.l   ($8C,sp),d0
                    cmpi.l   #$C7,d0
                    bne.b    lbC0021B8
                    movea.l  ($AC,sp),a0
                    tst.b    (a0)
                    bne.w    lbC002268
                    movem.l  (sp)+,d2-d7/a2/a3/a5/a6
                    lea      ($78,sp),sp
                    rts

lbC0021F2:          adda.w   d6,a0
                    movea.w  a0,a0
                    adda.l   d1,a0
                    cmpa.l   a3,a5
                    bcs.w    lbC001F98
lbC0021FE:          addi.b   #$80,d2
                    move.b   d2,($B60,a0)
                    moveq    #$7F,d2
                    cmpa.l   a3,a5
                    bne.w    lbC001FA2
                    moveq    #-$80,d2
                    movea.l  d1,a0
                    adda.l   d3,a0
                    move.b   d2,($AE0,a0)
                    adda.w   ($34,sp),a1
                    addq.w   #1,d7
                    moveq    #0,d3
                    move.w   d7,d3
                    movea.l  d3,a3
                    addq.w   #1,d4
                    cmp.l    d3,d6
                    bhi.w    lbC001F72
                    bra.w    lbC001FBC

lbC002230:          adda.l   d0,a1
                    lea      ($2A,a0),a0
                    cmp.l    a2,d1
                    bne.w    lbC002018
                    move.l   ($DFF004),d0
                    move.l   d0,($88,sp)
                    move.l   ($88,sp),d0
                    lsr.l    #8,d0
                    andi.l   #$1FF,d0
                    move.l   d0,($88,sp)
                    move.l   ($88,sp),d0
                    cmpi.l   #$C8,d0
                    bne.w    lbC00204A
                    bra.w    lbC002070

lbC002268:          lea      ($A60,a5),a1
                    move.l   a1,($78,sp)
                    clr.l    ($64,sp)
                    lea      ($96C,a0),a0
                    move.l   a0,($80,sp)
                    lea      ($9C,sp),a3
                    move.l   a3,($7C,sp)
                    move.l   a5,($3C,sp)
lbC002288:          movea.l  ($80,sp),a5
                    move.l   ($64,sp),d1
                    move.b   (a5,d1.l),($6B,sp)
                    movea.l  ($3C,sp),a1
                    movea.l  ($9F6,a1),a0
                    clr.w    d0
                    move.b   ($6B,sp),d0
                    mulu.w   #$2A,d0
                    movea.l  ($9C,a0),a6
                    adda.l   d0,a6
                    moveq    #0,d0
                    move.b   ($6B,sp),d0
                    addi.l   #$27F,d0
                    add.l    d0,d0
                    add.l    d0,d0
                    move.l   (a1,d0.l),($50,sp)
                    moveq    #0,d0
                    move.b   ($19,a6),d0
                    addq.l   #1,d0
                    move.w   #$80,d1
                    mulu.w   d0,d1
                    move.l   d1,($54,sp)
                    move.l   d1,-(sp)
                    clr.l    -(sp)
                    move.l   ($58,sp),-(sp)
                    movea.l  ($78,sp),a3
                    jsr      (a3)
                    move.b   ($17,a6),($58,sp)
                    move.b   ($58,sp),($A8,sp)
                    move.b   (14,a6),d0
                    add.b    ($58,sp),d0
                    move.b   d0,($A9,sp)
                    move.b   (15,a6),d1
                    add.b    ($58,sp),d1
                    move.b   d1,($AA,sp)
                    move.b   ($10,a6),d2
                    add.b    ($58,sp),d2
                    move.b   d2,($AB,sp)
                    move.b   (14,a6),d0
                    or.b     (15,a6),d0
                    or.b     ($10,a6),d0
                    lea      (12,sp),sp
                    seq      d0
                    neg.b    d0
                    move.b   ($29,a6),d1
                    lsr.b    #3,d1
                    andi.b   #3,d1
                    move.b   d1,($6A,sp)
                    suba.l   a5,a5
                    clr.l    ($58,sp)
                    andi.l   #$FF,d0
                    move.l   d0,($70,sp)
                    move.l   ($50,sp),d3
                    add.l    ($54,sp),d3
                    move.l   d3,($44,sp)
                    moveq    #0,d0
                    move.b   d1,d0
                    moveq    #9,d4
                    sub.l    d0,d4
                    move.l   d4,($74,sp)
                    clr.l    ($40,sp)
                    lea      (lbC003ACC,pc),a0
                    move.l   a0,($38,sp)
                    movea.l  a5,a3
lbC00236C:          lea      ($9C,sp),a0
                    movea.l  ($40,sp),a1
                    move.b   (a0,a1.l),d0
                    cmpa.w   #0,a1
                    beq.b    lbC002386
                    cmp.b    ($4C,sp),d0
                    beq.w    lbC0025C0
lbC002386:          ext.w    d0
                    movea.w  d0,a2
                    moveq    #11,d1
                    cmp.l    a2,d1
                    bge.w    lbC00294A
                    lea      (-12,a2),a0
                    moveq    #11,d0
                    cmp.l    a0,d0
                    bge.w    lbC0030AE
                    lea      (-$18,a2),a0
                    cmp.l    a0,d0
                    bge.w    lbC0030BA
                    lea      (-$24,a2),a0
                    cmp.l    a0,d0
                    bge.w    lbC0030F4
                    lea      (-$30,a2),a0
                    cmp.l    a0,d0
                    bge.w    lbC003106
                    lea      (-$3C,a2),a0
                    cmp.l    a0,d0
                    bge.w    lbC00310C
                    lea      (-$48,a2),a0
                    cmp.l    a0,d0
                    bge.w    lbC00311E
                    lea      (-$54,a2),a0
                    cmp.l    a0,d0
                    bge.w    lbC003124
                    lea      (-$60,a2),a0
                    cmp.l    a0,d0
                    bge.w    lbC0032DA
                    lea      (-$6C,a2),a0
                    cmp.l    a0,d0
                    bge.w    lbC0032EE
                    lea      (-$78,a2),a0
                    moveq    #10,d1
lbC0023F4:          move.l   a0,d0
                    add.l    a0,d0
                    add.l    a0,d0
                    lsl.l    #7,d0
                    adda.l   d0,a0
                    adda.l   ($78,sp),a0
                    move.b   ($14,a6),d2
                    move.b   d2,d0
                    andi.b   #3,d0
                    bne.w    lbC0029EC
lbC002410:          movea.l  a0,a3
lbC002412:          move.w   d1,d0
                    ext.l    d0
                    tst.w    d1
                    ble.w    lbC002A02
lbC00241C:          move.l   #$8000,d6
                    lsl.l    d0,d6
lbC002424:          move.b   ($15,a6),($5C,sp)
                    move.b   ($11,a6),($5E,sp)
                    moveq    #0,d7
                    move.b   ($180,a0),d7
                    move.b   ($21,a6),d3
                    andi.b   #$10,d2
                    move.b   d2,($34,sp)
                    bne.w    lbC002A36
lbC002446:          tst.b    d3
                    ble.w    lbC00306E
                    move.b   d3,d2
                    ext.w    d2
                    muls.w   d2,d2
lbC002452:          moveq    #10,d3
                    lsl.l    d3,d2
                    move.b   ($18,a6),($69,sp)
                    moveq    #15,d4
                    lsl.l    d4,d7
                    moveq    #15,d5
                    sub.l    d0,d5
                    move.l   d5,d0
                    lsl.l    #3,d0
                    movea.l  d0,a5
                    moveq    #0,d5
                    move.b   ($13,a6),d5
                    moveq    #11,d0
                    lsl.l    d0,d5
                    moveq    #0,d3
                    move.b   ($5C,sp),d3
                    move.l   d3,($48,sp)
                    moveq    #0,d4
                    move.b   ($16,a6),d4
                    move.l   d3,d0
                    moveq    #14,d3
                    lsl.l    d3,d0
                    move.l   a5,-(sp)
                    move.l   d0,-(sp)
                    move.l   d1,($32,sp)
                    movea.l  ($40,sp),a0
                    jsr      (a0)
                    addq.l   #8,sp
                    move.l   d0,d3
                    asr.l    #8,d3
                    moveq    #14,d0
                    lsl.l    d0,d4
                    move.l   a5,-(sp)
                    move.l   d4,-(sp)
                    movea.l  ($40,sp),a0
                    jsr      (a0)
                    addq.l   #8,sp
                    asr.l    #8,d0
                    movea.l  d0,a5
                    move.l   ($2A,sp),d1
                    cmp.l    d3,d0
                    bge.w    lbC002A54
                    neg.l    d5
                    movea.l  d0,a0
                    movea.l  d3,a5
                    moveq    #0,d0
                    move.b   ($5E,sp),d0
                    move.l   d6,-(sp)
                    move.l   d0,-(sp)
                    move.l   d1,($32,sp)
                    move.l   a0,($36,sp)
                    movea.l  ($40,sp),a1
                    jsr      (a1)
                    addq.l   #8,sp
                    movea.l  ($70,sp),a1
                    move.l   ($40,sp),d4
                    pea      (a1,d4.l)
                    move.l   d0,-(sp)
                    movea.l  ($40,sp),a1
                    jsr      (a1)
                    addq.l   #8,sp
                    move.l   d0,d4
                    move.l   d6,-(sp)
                    move.l   ($4C,sp),-(sp)
                    movea.l  ($40,sp),a1
                    jsr      (a1)
                    addq.l   #8,sp
                    add.l    d4,d0
                    move.l   ($2A,sp),d1
                    movea.l  ($2E,sp),a0
                    cmp.l    d7,d0
                    ble.b    lbC002516
lbC002510:          sub.l    d7,d0
                    cmp.l    d7,d0
                    bgt.b    lbC002510
lbC002516:          cmpa.w   #0,a3
                    beq.w    lbC002B3E
                    move.l   d6,d1
                    tst.l    ($58,sp)
                    beq.b    lbC00252E
                    move.l   ($74,sp),d4
                    asr.l    d4,d1
                    add.l    d6,d1
lbC00252E:          tst.l    ($54,sp)
                    beq.w    lbC0025C0
                    clr.w    d4
                    move.b   ($69,sp),d4
                    move.w   d4,($48,sp)
                    movea.l  ($50,sp),a1
                    suba.l   a2,a2
                    tst.b    ($34,sp)
                    bne.w    lbC002ABA
                    move.l   d6,($34,sp)
lbC002552:          move.l   d0,d4
                    sub.l    d3,d4
                    bmi.w    lbC002A4C
                    moveq    #15,d6
                    asr.l    d6,d4
                    move.b   (a3,d4.l),d4
                    ext.w    d4
lbC002564:          move.w   ($48,sp),d6
                    muls.w   d4,d6
                    asr.l    #7,d6
                    move.b   (a1),d4
                    ext.w    d4
                    add.w    d6,d4
                    cmpi.w   #$7F,d4
                    ble.b    lbC00257A
                    moveq    #$7F,d4
lbC00257A:          addq.l   #1,a1
                    cmpi.w   #$FF80,d4
                    bge.b    lbC002584
                    moveq    #-$80,d4
lbC002584:          move.b   d4,(-1,a1)
                    add.l    d1,d0
                    cmp.l    d7,d0
                    blt.b    lbC0025A2
                    sub.l    d7,d0
                    add.l    d5,d3
                    cmp.l    a5,d3
                    blt.b    lbC00259A
                    neg.l    d5
                    move.l   a5,d3
lbC00259A:          cmp.l    a0,d3
                    bgt.b    lbC0025A2
                    neg.l    d5
                    move.l   a0,d3
lbC0025A2:          tst.l    d2
                    beq.b    lbC0025BA
                    adda.l   d2,a2
                    move.l   a2,d1
                    moveq    #10,d4
                    asr.l    d4,d1
                    add.l    ($34,sp),d1
                    cmp.l    d7,d1
                    bcs.b    lbC0025BA
                    moveq    #0,d2
                    moveq    #0,d1
lbC0025BA:          cmpa.l   ($44,sp),a1
                    bne.b    lbC002552
lbC0025C0:          addq.l   #1,($40,sp)
                    moveq    #4,d0
                    cmp.l    ($40,sp),d0
                    bne.w    lbC00236C
                    movea.l  a3,a5
                    tst.b    ($6A,sp)
                    beq.b    lbC0025E6
                    cmpa.w   #0,a3
                    beq.b    lbC0025E6
                    moveq    #1,d1
                    cmp.l    ($58,sp),d1
                    bne.w    lbC0027DE
lbC0025E6:          move.b   ($1F,a6),d7
                    beq.w    lbC002D50
                    move.b   ($25,a6),d0
                    ext.w    d0
                    ext.l    d0
                    lsl.l    #7,d0
                    move.l   d0,($38,sp)
                    moveq    #0,d0
                    move.b   ($22,a6),d0
                    lsl.l    #8,d0
                    moveq    #0,d1
                    move.b   ($23,a6),d1
                    lsl.l    #8,d1
                    move.l   d1,($44,sp)
                    moveq    #0,d1
                    move.b   ($24,a6),d1
                    lsl.l    #8,d1
                    move.l   d1,($34,sp)
                    tst.l    ($54,sp)
                    beq.w    lbC002D50
                    move.l   ($44,sp),d1
                    asr.l    #8,d1
                    not.b    d1
                    move.b   d1,($58,sp)
                    andi.w   #$FF,d1
                    move.w   d1,($5E,sp)
                    move.l   ($34,sp),d1
                    asr.l    #8,d1
                    not.b    d1
                    move.b   d1,($48,sp)
                    clr.w    d2
                    move.b   d1,d2
                    move.w   d2,($5C,sp)
                    movea.l  ($50,sp),a2
                    clr.w    d4
                    clr.w    d6
                    clr.w    d5
                    clr.w    d3
                    moveq    #$40,d1
                    sub.l    a2,d1
                    move.l   d1,($4C,sp)
                    movea.l  d0,a3
                    adda.l   ($38,sp),a3
                    tst.l    ($38,sp)
                    ble.w    lbC002796
lbC00266E:          cmp.l    ($34,sp),d0
                    bgt.w    lbC002D2A
                    cmpa.l   ($34,sp),a3
                    blt.w    lbC002936
                    move.l   ($44,sp),d2
                    cmp.l    ($34,sp),d2
                    beq.w    lbC0032E0
                    neg.l    ($38,sp)
                    move.w   ($5C,sp),d2
                    move.b   ($48,sp),d1
                    movea.l  ($34,sp),a3
lbC00269A:          move.b   ($20,a6),d0
                    movea.w  d0,a1
                    movea.l  a2,a5
                    cmpi.b   #2,d7
                    beq.w    lbC0027D0
lbC0026AA:          cmpi.b   #4,d7
                    beq.w    lbC0027D0
lbC0026B2:          move.w   d2,d1
                    movea.w  d2,a0
                    move.w   a1,d0
                    tst.b    d0
                    beq.b    lbC0026F2
                    move.l   a0,d0
                    lsl.l    #8,d0
                    movea.l  d0,a0
                    move.w   a1,d0
                    andi.w   #$FF,d0
                    add.w    d0,d0
                    movea.w  #$B6,a1
                    suba.w   d0,a1
                    move.w   a1,d0
                    cmpi.w   #$36,d0
                    bge.b    lbC0026DA
                    moveq    #$36,d0
lbC0026DA:          movea.w  d0,a1
                    move.l   a1,-(sp)
                    move.l   a0,-(sp)
                    move.l   d1,($32,sp)
                    movea.l  ($68,sp),a0
                    jsr      (a0)
                    addq.l   #8,sp
                    movea.l  d0,a0
                    move.l   ($2A,sp),d1
lbC0026F2:          move.w   d1,d0
                    add.w    a0,d0
                    cmpi.b   #1,d7
                    beq.w    lbC002C6E
                    movea.l  a2,a0
                    lea      ($40,a2),a1
                    move.w   d0,($70,sp)
lbC002708:          move.w   d3,d1
                    sub.w    d5,d1
                    move.w   ($70,sp),d0
                    muls.w   d0,d1
                    move.b   (a0)+,d0
                    ext.w    d0
                    movea.w  d0,a5
                    asr.l    #8,d1
                    sub.w    d3,d1
                    add.w    d0,d1
                    move.w   d2,d0
                    muls.w   d1,d0
                    move.l   d0,d1
                    asr.l    #8,d1
                    add.w    d1,d3
                    move.w   d3,d1
                    sub.w    d5,d1
                    move.w   d2,d0
                    muls.w   d1,d0
                    move.l   d0,d1
                    asr.l    #8,d1
                    add.w    d1,d5
                    move.w   d5,d1
                    sub.w    d6,d1
                    move.w   d2,d0
                    muls.w   d1,d0
                    move.l   d0,d1
                    asr.l    #8,d1
                    add.w    d1,d6
                    move.w   d6,d1
                    sub.w    d4,d1
                    move.w   d2,d0
                    muls.w   d1,d0
                    move.l   d0,d1
                    asr.l    #8,d1
                    add.w    d1,d4
                    cmpi.b   #2,d7
                    beq.w    lbC002944
                    cmpi.b   #3,d7
                    beq.w    lbC00290C
                    cmpi.b   #4,d7
                    beq.w    lbC0028F2
                    clr.b    d1
lbC00276C:          move.b   d1,(-1,a0)
                    cmpa.l   a0,a1
                    bne.b    lbC002708
lbC002774:          adda.l   ($4C,sp),a2
                    cmpa.l   ($54,sp),a2
                    bcc.w    lbC002D50
                    move.b   ($1F,a6),d7
                    movea.l  a1,a2
                    move.l   a3,d0
                    movea.l  d0,a3
                    adda.l   ($38,sp),a3
                    tst.l    ($38,sp)
                    bgt.w    lbC00266E
lbC002796:          cmp.l    ($44,sp),d0
                    blt.w    lbC00308A
                    cmpa.l   ($44,sp),a3
                    bgt.w    lbC002936
                    move.l   ($44,sp),d1
                    movea.l  d1,a3
                    cmp.l    ($34,sp),d1
                    beq.w    lbC0034F2
                    neg.l    ($38,sp)
                    move.w   ($5E,sp),d2
                    move.b   ($58,sp),d1
                    move.b   ($20,a6),d0
                    movea.w  d0,a1
                    movea.l  a2,a5
                    cmpi.b   #2,d7
                    bne.w    lbC0026AA
lbC0027D0:          andi.w   #$FF,d1
                    move.w   #$FF,d2
                    sub.w    d1,d2
                    bra.w    lbC0026B2

lbC0027DE:          moveq    #1,d2
                    move.l   d2,($58,sp)
                    clr.l    ($40,sp)
                    lea      (lbC003ACC,pc),a0
                    move.l   a0,($38,sp)
                    movea.l  a5,a3
                    bra.w    lbC00236C

lbC0027F6:          lea      (lbW004002,pc),a0
                    lea      (lbW004482,pc),a1
                    moveq    #0,d3
                    move.w   (lbW004000,pc),d3
lbC002804:          move.l   d3,d0
                    swap     d0
                    clr.w    d0
                    moveq    #0,d3
                    move.w   ($1E,a0),d3
                    move.l   d3,d1
                    swap     d1
                    clr.w    d1
                    sub.l    d0,d1
                    asr.l    #4,d1
                    add.l    d1,d0
                    move.l   d0,d4
                    swap     d4
                    ext.l    d4
                    move.w   d4,(a0)
                    add.l    d1,d0
                    move.l   d0,d4
                    swap     d4
                    ext.l    d4
                    move.w   d4,(2,a0)
                    add.l    d1,d0
                    move.l   d0,d4
                    swap     d4
                    ext.l    d4
                    move.w   d4,(4,a0)
                    add.l    d1,d0
                    move.l   d0,d4
                    swap     d4
                    ext.l    d4
                    move.w   d4,(6,a0)
                    add.l    d1,d0
                    move.l   d0,d4
                    swap     d4
                    ext.l    d4
                    move.w   d4,(8,a0)
                    add.l    d1,d0
                    move.l   d0,d4
                    swap     d4
                    ext.l    d4
                    move.w   d4,(10,a0)
                    add.l    d1,d0
                    move.l   d0,d4
                    swap     d4
                    ext.l    d4
                    move.w   d4,(12,a0)
                    add.l    d1,d0
                    move.l   d0,d4
                    swap     d4
                    ext.l    d4
                    move.w   d4,(14,a0)
                    add.l    d1,d0
                    move.l   d0,d4
                    swap     d4
                    ext.l    d4
                    move.w   d4,($10,a0)
                    add.l    d1,d0
                    move.l   d0,d4
                    swap     d4
                    ext.l    d4
                    move.w   d4,($12,a0)
                    add.l    d1,d0
                    move.l   d0,d4
                    swap     d4
                    ext.l    d4
                    move.w   d4,($14,a0)
                    add.l    d1,d0
                    move.l   d0,d4
                    swap     d4
                    ext.l    d4
                    move.w   d4,($16,a0)
                    add.l    d1,d0
                    move.l   d0,d4
                    swap     d4
                    ext.l    d4
                    move.w   d4,($18,a0)
                    add.l    d1,d0
                    move.l   d0,d4
                    swap     d4
                    ext.l    d4
                    move.w   d4,($1A,a0)
                    add.l    d1,d0
                    swap     d0
                    ext.l    d0
                    move.w   d0,($1C,a0)
                    lea      ($20,a0),a0
                    cmpa.l   a1,a0
                    bne.w    lbC002804
                    lea      (lbW004484,pc),a0
                    lea      (lbW004682,pc),a1
lbC0028DC:          move.w   d2,(a0)+
                    addq.w   #3,d2
                    cmpa.l   a1,a0
                    beq.w    lbC001DD8
                    move.w   d2,(a0)+
                    addq.w   #3,d2
                    cmpa.l   a1,a0
                    bne.b    lbC0028DC
                    bra.w    lbC001DD8

lbC0028F2:          move.w   d3,d1
                    sub.w    d4,d1
lbC0028F6:          cmpi.w   #$FF80,d1
                    bge.b    lbC00291E
lbC0028FC:          moveq    #-$80,d1
                    move.b   d1,(-1,a0)
                    cmpa.l   a0,a1
                    bne.w    lbC002708
                    bra.w    lbC002774

lbC00290C:          movea.w  d4,a5
                    suba.w   d6,a5
                    suba.w   d5,a5
                    suba.w   d3,a5
                    move.l   a5,d1
                    asr.l    #1,d1
                    cmpi.w   #$FF80,d1
                    blt.b    lbC0028FC
lbC00291E:          cmpi.w   #$7F,d1
                    ble.w    lbC00276C
                    moveq    #$7F,d1
                    move.b   d1,(-1,a0)
                    cmpa.l   a0,a1
                    bne.w    lbC002708
                    bra.w    lbC002774

lbC002936:          move.l   a3,d1
                    asr.l    #8,d1
                    not.b    d1
                    clr.w    d2
                    move.b   d1,d2
                    bra.w    lbC00269A

lbC002944:          move.w   d4,d1
                    sub.w    a5,d1
                    bra.b    lbC0028F6

lbC00294A:          cmpa.w   #0,a2
                    bge.w    lbC0037FE
                    lea      (12,a2),a0
                    cmpa.w   #0,a0
                    bge.w    lbC0030A8
                    lea      ($18,a2),a0
                    cmpa.w   #0,a0
                    bge.w    lbC0030B4
                    lea      ($24,a2),a0
                    cmpa.w   #0,a0
                    bge.w    lbC0030FA
                    lea      ($30,a2),a0
                    cmpa.w   #0,a0
                    bge.w    lbC003100
                    lea      ($3C,a2),a0
                    cmpa.w   #0,a0
                    bge.w    lbC003112
                    lea      ($48,a2),a0
                    cmpa.w   #0,a0
                    bge.w    lbC003118
                    lea      ($54,a2),a0
                    cmpa.w   #0,a0
                    bge.w    lbC00312A
                    lea      ($60,a2),a0
                    cmpa.w   #0,a0
                    bge.w    lbC0032D4
                    lea      ($6C,a2),a0
                    cmpa.w   #0,a0
                    bge.w    lbC0032F4
                    lea      ($78,a2),a0
                    cmpa.w   #0,a0
                    bge.w    lbC0034EC
                    lea      ($84,a2),a0
                    moveq    #-11,d1
                    move.l   a0,d0
                    add.l    a0,d0
                    add.l    a0,d0
                    lsl.l    #7,d0
                    adda.l   d0,a0
                    adda.l   ($78,sp),a0
                    move.b   ($14,a6),d2
                    move.b   d2,d0
                    andi.b   #3,d0
                    beq.w    lbC002410
lbC0029EC:          cmpi.b   #1,d0
                    bne.w    lbC002AAA
                    lea      ($100,a0),a3
                    move.w   d1,d0
                    ext.l    d0
                    tst.w    d1
                    bgt.w    lbC00241C
lbC002A02:          tst.w    d1
                    beq.w    lbC003806
                    move.l   d0,d3
                    neg.l    d3
                    move.l   #$8000,d6
                    asr.l    d3,d6
                    move.b   ($15,a6),($5C,sp)
                    move.b   ($11,a6),($5E,sp)
                    moveq    #0,d7
                    move.b   ($180,a0),d7
                    move.b   ($21,a6),d3
                    andi.b   #$10,d2
                    move.b   d2,($34,sp)
                    beq.w    lbC002446
lbC002A36:          move.b   d3,d2
                    ext.w    d2
                    tst.b    d3
                    ble.w    lbC003078
                    move.b   #1,($34,sp)
                    muls.w   d2,d2
                    bra.w    lbC002452

lbC002A4C:          move.b   (a3),d4
                    ext.w    d4
                    bra.w    lbC002564

lbC002A54:          movea.l  d3,a0
                    moveq    #0,d0
                    move.b   ($5E,sp),d0
                    move.l   d6,-(sp)
                    move.l   d0,-(sp)
                    move.l   d1,($32,sp)
                    move.l   a0,($36,sp)
                    movea.l  ($40,sp),a1
                    jsr      (a1)
                    addq.l   #8,sp
                    movea.l  ($70,sp),a1
                    move.l   ($40,sp),d4
                    pea      (a1,d4.l)
                    move.l   d0,-(sp)
                    movea.l  ($40,sp),a1
                    jsr      (a1)
                    addq.l   #8,sp
                    move.l   d0,d4
                    move.l   d6,-(sp)
                    move.l   ($4C,sp),-(sp)
                    movea.l  ($40,sp),a1
                    jsr      (a1)
                    addq.l   #8,sp
                    add.l    d4,d0
                    move.l   ($2A,sp),d1
                    movea.l  ($2E,sp),a0
                    cmp.l    d7,d0
                    bgt.w    lbC002510
                    bra.w    lbC002516

lbC002AAA:          cmpi.b   #2,d0
                    bne.w    lbC002412
                    lea      ($80,a0),a3
                    bra.w    lbC002412

lbC002ABA:          move.l   d6,($34,sp)
                    move.l   d0,d4
                    sub.l    d3,d4
                    bmi.b    lbC002B38
lbC002AC4:          moveq    #15,d6
                    asr.l    d6,d4
                    move.b   (a3,d4.l),d4
                    ext.w    d4
lbC002ACE:          move.w   ($48,sp),d6
                    muls.w   d4,d6
                    move.b   (a1),d4
                    ext.w    d4
                    asr.l    #7,d6
                    add.w    d6,d4
                    cmpi.w   #$7F,d4
                    ble.b    lbC002AE4
                    moveq    #$7F,d4
lbC002AE4:          addq.l   #1,a1
                    cmpi.w   #$FF80,d4
                    bge.b    lbC002AEE
                    moveq    #-$80,d4
lbC002AEE:          move.b   d4,(-1,a1)
                    add.l    d1,d0
                    cmp.l    d7,d0
                    blt.b    lbC002B0C
                    sub.l    d7,d0
                    add.l    d5,d3
                    cmpa.l   d3,a5
                    bgt.b    lbC002B04
                    neg.l    d5
                    move.l   a5,d3
lbC002B04:          cmp.l    a0,d3
                    bgt.b    lbC002B0C
                    neg.l    d5
                    move.l   a0,d3
lbC002B0C:          tst.l    d2
                    beq.b    lbC002B2A
                    adda.l   d2,a2
                    move.l   a2,d1
                    moveq    #10,d4
                    asr.l    d4,d1
                    add.l    ($34,sp),d1
                    move.l   d2,d4
                    asr.l    #7,d4
                    sub.l    d4,d2
                    cmp.l    d7,d1
                    bcs.b    lbC002B2A
                    moveq    #0,d2
                    moveq    #0,d1
lbC002B2A:          cmpa.l   ($44,sp),a1
                    beq.w    lbC0025C0
                    move.l   d0,d4
                    sub.l    d3,d4
                    bpl.b    lbC002AC4
lbC002B38:          move.b   (a3),d4
                    ext.w    d4
                    bra.b    lbC002ACE

lbC002B3E:          move.l   #$8000,d5
                    tst.w    d1
                    blt.w    lbC002C12
lbC002B4A:          tst.l    ($54,sp)
                    beq.w    lbC0025C0
                    clr.w    d0
                    move.b   ($5C,sp),d0
                    clr.w    d1
                    move.b   ($5E,sp),d1
                    add.w    d1,d0
                    addq.w   #1,d0
                    movea.l  d5,a1
                    movea.l  ($50,sp),a5
                    clr.b    d1
                    moveq    #0,d4
                    movea.l  #$8000,a0
                    clr.w    d3
                    move.b   ($69,sp),d3
                    cmpa.w   #$7FFF,a0
                    bgt.b    lbC002BBA
lbC002B7E:          move.b   d1,(a5)+
                    adda.l   a1,a0
                    tst.l    d2
                    beq.b    lbC002BAC
                    add.l    d2,d4
                    move.l   d4,d6
                    moveq    #10,d7
                    asr.l    d7,d6
                    movea.l  d6,a1
                    adda.l   d5,a1
                    tst.b    ($34,sp)
                    beq.b    lbC002B9E
                    move.l   d2,d6
                    asr.l    #7,d6
                    sub.l    d6,d2
lbC002B9E:          cmpa.w   #$1FF,a1
                    bgt.b    lbC002BAC
                    moveq    #0,d2
                    suba.l   a0,a0
                    movea.w  #$200,a1
lbC002BAC:          cmpa.l   ($44,sp),a5
                    beq.w    lbC0025C0
                    cmpa.w   #$7FFF,a0
                    ble.b    lbC002B7E
lbC002BBA:          move.w   d0,d1
                    moveq    #13,d6
                    lsl.w    d6,d1
                    eor.w    d1,d0
                    move.w   d0,d1
                    moveq    #9,d7
                    lsr.w    d7,d1
                    eor.w    d1,d0
                    move.w   d0,d1
                    lsl.w    #7,d1
                    eor.w    d1,d0
                    cmpa.l   #$8000,a0
                    beq.b    lbC002BF0
                    move.l   a0,d6
                    addi.l   #$FFFF8000,d6
                    move.l   a0,d1
                    addi.l   #$FFFF7FFF,d1
                    andi.w   #$8000,d1
                    movea.l  d6,a0
                    suba.l   d1,a0
lbC002BF0:          move.b   d0,d1
                    ext.w    d1
                    move.w   d3,d6
                    muls.w   d1,d6
                    move.l   d6,d1
                    asr.l    #7,d1
                    cmpi.w   #$7F,d1
                    ble.b    lbC002C04
                    moveq    #$7F,d1
lbC002C04:          cmpi.w   #$FF80,d1
                    bge.b    lbC002C0C
                    moveq    #-$80,d1
lbC002C0C:          add.b    (a5),d1
                    bra.w    lbC002B7E

lbC002C12:          move.l   a2,d3
                    neg.l    d3
                    pea      (12).w
                    move.l   d3,-(sp)
                    movea.l  ($68,sp),a0
                    jsr      (a0)
                    addq.l   #8,sp
                    cmpi.w   #$FFFF,d0
                    beq.w    lbC0037AA
lbC002C2C:          asr.l    #1,d5
                    dbra     d0,lbC002C2C
                    pea      (12).w
                    move.l   d5,-(sp)
                    movea.l  ($68,sp),a1
                    jsr      (a1)
                    addq.l   #8,sp
                    moveq    #0,d4
                    move.w   d0,d4
                    pea      (12).w
                    move.l   d3,-(sp)
                    lea      (lbC003B74,pc),a0
                    jsr      (a0)
                    addq.l   #8,sp
                    andi.l   #$FFFF,d0
                    move.l   d4,-(sp)
                    moveq    #12,d1
                    sub.l    d0,d1
                    move.l   d1,-(sp)
                    movea.l  ($40,sp),a0
                    jsr      (a0)
                    addq.l   #8,sp
                    add.l    d0,d5
                    bra.w    lbC002B4A

lbC002C6E:          lea      ($40,a2),a1
                    move.w   d3,d7
                    sub.w    d5,d7
                    muls.w   d0,d7
                    move.b   (a5)+,d1
                    ext.w    d1
                    asr.l    #8,d7
                    add.w    d7,d1
                    sub.w    d3,d1
                    move.w   d2,d7
                    muls.w   d1,d7
                    move.l   d7,d1
                    asr.l    #8,d1
                    add.w    d1,d3
                    move.w   d3,d1
                    sub.w    d5,d1
                    move.w   d2,d7
                    muls.w   d1,d7
                    move.l   d7,d1
                    asr.l    #8,d1
                    add.w    d1,d5
                    move.w   d5,d1
                    sub.w    d6,d1
                    move.w   d2,d7
                    muls.w   d1,d7
                    move.l   d7,d1
                    asr.l    #8,d1
                    add.w    d1,d6
                    move.w   d6,d1
                    sub.w    d4,d1
                    move.w   d2,d7
                    muls.w   d1,d7
                    move.l   d7,d1
                    asr.l    #8,d1
                    add.w    d1,d4
                    move.w   d4,d1
                    cmpi.w   #$FF80,d4
                    bge.b    lbC002D16
lbC002CBE:          moveq    #-$80,d1
lbC002CC0:          move.b   d1,(-1,a5)
                    cmpa.l   a5,a1
                    beq.w    lbC002774
lbC002CCA:          move.w   d3,d7
                    sub.w    d5,d7
                    muls.w   d0,d7
                    move.b   (a5)+,d1
                    ext.w    d1
                    asr.l    #8,d7
                    add.w    d7,d1
                    sub.w    d3,d1
                    move.w   d2,d7
                    muls.w   d1,d7
                    move.l   d7,d1
                    asr.l    #8,d1
                    add.w    d1,d3
                    move.w   d3,d1
                    sub.w    d5,d1
                    move.w   d2,d7
                    muls.w   d1,d7
                    move.l   d7,d1
                    asr.l    #8,d1
                    add.w    d1,d5
                    move.w   d5,d1
                    sub.w    d6,d1
                    move.w   d2,d7
                    muls.w   d1,d7
                    move.l   d7,d1
                    asr.l    #8,d1
                    add.w    d1,d6
                    move.w   d6,d1
                    sub.w    d4,d1
                    move.w   d2,d7
                    muls.w   d1,d7
                    move.l   d7,d1
                    asr.l    #8,d1
                    add.w    d1,d4
                    move.w   d4,d1
                    cmpi.w   #$FF80,d4
                    blt.b    lbC002CBE
lbC002D16:          cmpi.w   #$7F,d4
                    ble.b    lbC002CC0
                    moveq    #$7F,d1
                    move.b   d1,(-1,a5)
                    cmpa.l   a5,a1
                    bne.b    lbC002CCA
                    bra.w    lbC002774

lbC002D2A:          cmpi.l   #$FF00,d0
                    bgt.w    lbC002936
                    cmpa.l   #$FEFF,a3
                    ble.w    lbC002936
                    neg.l    ($38,sp)
                    clr.w    d2
                    clr.b    d1
                    movea.l  #$FF00,a3
                    bra.w    lbC00269A

lbC002D50:          move.b   ($29,a6),d1
                    andi.b   #$20,d1
                    move.b   d1,($44,sp)
                    bne.b    lbC002D66
                    tst.b    ($26,a6)
                    bne.w    lbC00329A
lbC002D66:          move.b   ($1B,a6),d0
                    bne.w    lbC0030C0
                    cmpi.b   #$FF,($1E,a6)
                    beq.w    lbC002F28
                    move.b   ($14,a6),d2
                    andi.b   #$20,d2
                    move.b   ($14,a6),d0
                    andi.b   #8,d0
                    move.b   d0,($38,sp)
                    move.w   ($56,sp),d4
                    moveq    #2,d0
                    swap     d0
                    move.l   #$1000000,d3
lbC002D9A:          tst.b    d2
                    beq.b    lbC002DA0
                    lsl.l    #4,d0
lbC002DA0:          tst.w    d4
                    beq.w    lbC0037DA
                    subq.w   #1,d4
                    add.l    d0,d3
                    cmpi.l   #$FFFFFF,d3
                    bgt.w    lbC0037E6
                    movea.l  ($50,sp),a0
                    tst.b    ($38,sp)
                    bne.w    lbC002EFC
                    movea.l  a0,a1
                    move.b   (a1)+,d5
                    ext.w    d5
                    move.l   d3,d1
                    swap     d1
                    ext.l    d1
                    muls.w   d5,d1
                    asr.l    #8,d1
                    move.b   d1,(a0)
                    tst.w    d4
                    beq.b    lbC002DFC
lbC002DD6:          subq.w   #1,d4
                    add.l    d0,d3
                    cmpi.l   #$FFFFFF,d3
                    bgt.w    lbC0034A0
                    movea.l  a1,a0
                    movea.l  a0,a1
                    move.b   (a1)+,d5
                    ext.w    d5
                    move.l   d3,d1
                    swap     d1
                    ext.l    d1
                    muls.w   d5,d1
                    asr.l    #8,d1
                    move.b   d1,(a0)
                    tst.w    d4
                    bne.b    lbC002DD6
lbC002DFC:          move.l   d3,d0
                    asr.l    #8,d0
lbC002E00:          move.b   ($1D,a6),d3
                    beq.w    lbC002F28
                    clr.w    d1
lbC002E0A:          clr.w    d4
                    move.b   d3,d4
                    move.w   d4,d7
                    mulu.w   d4,d7
                    lsr.l    #2,d7
                    add.w    d4,d7
                    tst.b    d2
                    bne.w    lbC00345C
                    andi.l   #$FF,d3
                    moveq    #12,d2
                    lsl.l    d2,d3
                    move.l   d3,d2
                    clr.w    d2
                    swap     d2
                    movea.w  d2,a3
                    lea      (lbW003C1C,pc),a0
                    move.l   d2,d4
                    add.l    d2,d4
                    move.w   (a0,d4.l),d4
                    andi.l   #$FFFF,d4
                    movea.l  d4,a5
                    addq.l   #1,d2
                    add.l    d2,d2
                    move.w   (a0,d2.l),d2
                    andi.l   #$FFFF,d2
                    movea.l  d2,a2
lbC002E52:          tst.w    d1
                    beq.w    lbC002F28
                    andi.l   #$FFFF,d7
                    clr.w    d4
                    lea      (lbW003C1C,pc),a0
                    move.l   a0,($4C,sp)
                    movea.l  d7,a0
                    move.l   a2,d7
                    movea.l  a0,a2
lbC002E6E:          subq.w   #1,d1
                    add.l    a2,d3
                    move.l   d3,d2
                    clr.w    d2
                    swap     d2
                    cmpi.l   #$8E,d2
                    bhi.b    lbC002E98
                    cmp.w    a3,d2
                    bhi.w    lbC003406
                    movea.w  a5,a0
                    move.w   d7,d4
                    move.w   d4,d2
                    sub.w    a0,d2
                    move.w   d3,d4
                    lsr.w    #8,d4
                    muls.w   d2,d4
                    asr.l    #8,d4
                    add.w    a0,d4
lbC002E98:          moveq    #0,d2
                    move.w   d4,d2
                    sub.l    d2,d0
                    move.b   ($1E,a6),d5
                    moveq    #0,d2
                    move.b   d5,d2
                    lsl.l    #8,d2
                    movea.l  a1,a0
                    move.b   (a0)+,d6
                    ext.w    d6
                    cmp.l    d0,d2
                    bgt.w    lbC00346C
                    move.l   d0,d2
                    asr.l    #8,d2
                    muls.w   d6,d2
                    tst.b    ($38,sp)
                    beq.w    lbC003400
                    asr.l    #6,d2
                    cmpi.w   #$7F,d2
                    ble.w    lbC0033F2
                    moveq    #$7F,d2
lbC002ECE:          move.b   d2,(-1,a0)
                    tst.w    d1
                    beq.b    lbC002F28
                    movea.l  a0,a1
                    bra.b    lbC002E6E

lbC002EDA:          cmpi.w   #$FF80,d1
                    bge.b    lbC002EE2
                    moveq    #-$80,d1
lbC002EE2:          move.b   d1,(-1,a1)
                    tst.w    d4
                    beq.w    lbC002DFC
                    subq.w   #1,d4
                    add.l    d0,d3
                    cmpi.l   #$FFFFFF,d3
                    bgt.w    lbC0032FA
                    movea.l  a1,a0
lbC002EFC:          movea.l  a0,a1
                    move.b   (a1)+,d5
                    ext.w    d5
                    move.l   d3,d1
                    swap     d1
                    ext.l    d1
                    muls.w   d5,d1
                    asr.l    #6,d1
                    cmpi.w   #$7F,d1
                    ble.b    lbC002EDA
                    moveq    #$7F,d1
                    bra.b    lbC002EE2

lbC002F16:          cmpi.w   #$FF80,d0
                    bge.b    lbC002F1E
                    moveq    #-$80,d0
lbC002F1E:          move.b   d0,(-1,a0)
                    cmpa.l   a0,a1
                    bne.w    lbC0033D0
lbC002F28:          tst.b    ($44,sp)
                    beq.b    lbC002F36
                    tst.b    ($26,a6)
                    bne.w    lbC00327E
lbC002F36:          move.b   ($1A,a6),d0
                    beq.w    lbC002FF0
                    subq.b   #1,d0
                    cmp.b    ($6B,sp),d0
                    beq.w    lbC002FF0
                    movea.l  ($3C,sp),a1
                    movea.l  ($9F6,a1),a0
                    clr.w    d1
                    move.b   d0,d1
                    mulu.w   #$2A,d1
                    movea.l  ($9C,a0),a0
                    adda.l   d1,a0
                    andi.l   #$FF,d0
                    addi.l   #$27F,d0
                    add.l    d0,d0
                    add.l    d0,d0
                    movea.l  (a1,d0.l),a2
                    moveq    #0,d3
                    move.b   ($19,a0),d3
                    addq.l   #1,d3
                    lsl.l    #7,d3
                    moveq    #0,d4
                    move.b   ($19,a6),d4
                    addq.l   #1,d4
                    lsl.l    #7,d4
                    move.l   d3,d2
                    cmp.l    d3,d4
                    bcs.w    lbC0032B6
                    btst     #2,($14,a0)
                    beq.w    lbC0032C2
lbC002F98:          btst     #2,($14,a6)
                    beq.w    lbC003648
                    movea.l  ($40,sp),a3
                    move.l   ($50,sp),d7
                    moveq    #0,d6
lbC002FAC:          tst.l    d2
                    beq.b    lbC002FE0
                    movea.l  d7,a0
                    movea.l  a2,a1
                    clr.w    d1
lbC002FB6:          move.b   (a0),d0
                    ext.w    d0
                    move.b   (a1)+,d5
                    ext.w    d5
                    add.w    d5,d0
                    cmpi.w   #$7F,d0
                    ble.b    lbC002FC8
                    moveq    #$7F,d0
lbC002FC8:          addq.l   #1,a0
                    cmpi.w   #$FF80,d0
                    bge.b    lbC002FD2
                    moveq    #-$80,d0
lbC002FD2:          move.b   d0,(-1,a0)
                    addq.w   #1,d1
                    moveq    #0,d0
                    move.w   d1,d0
                    cmp.l    d0,d2
                    bhi.b    lbC002FB6
lbC002FE0:          lsr.l    #1,d2
                    adda.l   d3,a2
                    add.l    d4,d7
                    lsr.l    #1,d3
                    lsr.l    #1,d4
                    addq.l   #1,d6
                    cmpa.l   d6,a3
                    bne.b    lbC002FAC
lbC002FF0:          btst     #2,($14,a6)
                    beq.b    lbC003044
                    moveq    #0,d0
                    move.b   ($19,a6),d0
                    addq.l   #1,d0
                    move.w   #$80,d1
                    mulu.w   d0,d1
                    movea.l  ($50,sp),a0
                    adda.l   d1,a0
                    lsr.l    #1,d1
                    moveq    #3,d2
                    move.l   ($50,sp),d3
lbC003014:          tst.w    d1
                    beq.b    lbC003036
                    move.w   d1,d0
                    subq.w   #1,d0
                    andi.l   #$FFFF,d0
                    lea      (1,a0,d0.l),a2
                    movea.l  d3,a1
lbC003028:          move.b   (a1),(a0)+
                    addq.l   #2,a1
                    cmpa.l   a0,a2
                    bne.b    lbC003028
                    addq.l   #1,d0
                    add.l    d0,d0
                    add.l    d0,d3
lbC003036:          moveq    #0,d0
                    move.w   d1,d0
                    movea.l  d3,a0
                    adda.l   d0,a0
                    lsr.w    #1,d1
                    subq.w   #1,d2
                    bne.b    lbC003014
lbC003044:          movea.l  ($AC,sp),a1
                    moveq    #0,d0
                    move.b   (a1),d0
                    move.l   d0,d1
                    subq.l   #1,d1
                    cmp.l    ($64,sp),d1
                    beq.w    lbC003130
                    addq.l   #1,($64,sp)
                    cmp.l    ($64,sp),d0
                    bgt.w    lbC002288
lbC003064:          movem.l  (sp)+,d2-d7/a2/a3/a5/a6
                    lea      ($78,sp),sp
                    rts

lbC00306E:          ext.w    d3
                    move.w   d3,d2
                    ext.l    d2
                    bra.w    lbC002452

lbC003078:          moveq    #2,d3
                    lsl.l    d0,d3
                    muls.w   d2,d3
                    move.l   d3,d2
                    move.b   #1,($34,sp)
                    bra.w    lbC002452

lbC00308A:          tst.l    d0
                    blt.w    lbC002936
                    cmpa.w   #0,a3
                    bgt.w    lbC002936
                    neg.l    ($38,sp)
                    move.w   #$FF,d2
                    st       d1
                    suba.l   a3,a3
                    bra.w    lbC00269A

lbC0030A8:          moveq    #-1,d1
                    bra.w    lbC0023F4

lbC0030AE:          moveq    #1,d1
                    bra.w    lbC0023F4

lbC0030B4:          moveq    #-2,d1
                    bra.w    lbC0023F4

lbC0030BA:          moveq    #2,d1
                    bra.w    lbC0023F4

lbC0030C0:          move.b   ($14,a6),d2
                    andi.b   #$20,d2
                    move.b   ($14,a6),d1
                    andi.b   #8,d1
                    move.b   d1,($38,sp)
                    move.w   ($56,sp),d4
                    andi.l   #$FF,d0
                    move.l   d0,-(sp)
                    move.l   #$20000,-(sp)
                    movea.l  ($68,sp),a0
                    jsr      (a0)
                    addq.l   #8,sp
                    moveq    #0,d3
                    bra.w    lbC002D9A

lbC0030F4:          moveq    #3,d1
                    bra.w    lbC0023F4

lbC0030FA:          moveq    #-3,d1
                    bra.w    lbC0023F4

lbC003100:          moveq    #-4,d1
                    bra.w    lbC0023F4

lbC003106:          moveq    #4,d1
                    bra.w    lbC0023F4

lbC00310C:          moveq    #5,d1
                    bra.w    lbC0023F4

lbC003112:          moveq    #-5,d1
                    bra.w    lbC0023F4

lbC003118:          moveq    #-6,d1
                    bra.w    lbC0023F4

lbC00311E:          moveq    #6,d1
                    bra.w    lbC0023F4

lbC003124:          moveq    #7,d1
                    bra.w    lbC0023F4

lbC00312A:          moveq    #-7,d1
                    bra.w    lbC0023F4

lbC003130:          movea.l  ($3C,sp),a3
                    move.b   #1,($9FA,a3)
                    move.b   ($9F3,a3),d0
                    cmpi.b   #$2F,d0
                    bhi.w    lbC0034FE
                    move.b   d0,($9F4,a3)
                    move.l   ($A5C,a3),d0
                    move.l   d0,($6C,a3)
                    move.w   #2,($70,a3)
                    clr.b    ($76,a3)
                    move.w   #$7B,($74,a3)
                    move.b   #$40,(6,a3)
                    clr.b    (9,a3)
                    clr.w    (10,a3)
                    clr.w    (12,a3)
                    clr.l    (a3)
                    clr.l    ($5A,a3)
                    moveq    #3,d1
                    move.l   d1,($40,a3)
                    clr.b    (15,a3)
                    clr.w    ($10,a3)
                    clr.w    ($12,a3)
                    move.w   #$FF,($14,a3)
                    move.l   d0,($2E8,a3)
                    move.w   #2,($2EC,a3)
                    clr.b    ($2F2,a3)
                    move.w   #$7B,($2F0,a3)
                    move.b   #$40,($282,a3)
                    clr.b    ($285,a3)
                    clr.w    ($286,a3)
                    clr.w    ($288,a3)
                    clr.l    ($27C,a3)
                    clr.l    ($2D6,a3)
                    move.l   d1,($2BC,a3)
                    clr.b    ($28B,a3)
                    clr.w    ($28C,a3)
                    clr.w    ($28E,a3)
                    move.w   #$FF,($290,a3)
                    move.l   d0,($564,a3)
                    move.w   #2,($568,a3)
                    clr.b    ($56E,a3)
                    move.w   #$7B,($56C,a3)
                    move.b   #$40,($4FE,a3)
                    clr.b    ($501,a3)
                    clr.w    ($502,a3)
                    clr.w    ($504,a3)
                    clr.l    ($4F8,a3)
                    clr.l    ($552,a3)
                    move.l   d1,($538,a3)
                    clr.b    ($507,a3)
                    clr.w    ($508,a3)
                    clr.w    ($50A,a3)
                    move.w   #$FF,($50C,a3)
                    move.l   d0,($7E0,a3)
                    move.w   #2,($7E4,a3)
                    clr.b    ($7EA,a3)
                    move.w   #$7B,($7E8,a3)
                    clr.w    ($786,a3)
                    move.b   #$40,($77A,a3)
                    clr.w    ($784,a3)
                    clr.b    ($77F,a3)
                    clr.b    ($77D,a3)
                    clr.b    ($781,a3)
                    clr.b    ($77E,a3)
                    clr.b    ($780,a3)
                    clr.l    ($774,a3)
                    clr.l    ($7CE,a3)
                    move.l   d1,($7B4,a3)
                    move.w   #$FF,($788,a3)
                    clr.b    ($783,a3)
                    movea.l  ($AC,sp),a0
                    moveq    #0,d0
                    move.b   (a0),d0
lbC00326E:          addq.l   #1,($64,sp)
                    cmp.l    ($64,sp),d0
                    ble.w    lbC003064
                    bra.w    lbC002288

lbC00327E:          move.w   ($56,sp),-(sp)
                    clr.w    -(sp)
                    move.l   ($54,sp),-(sp)
                    pea      ($26,a6)
                    lea      (lbC000040,pc),a0
                    jsr      (a0)
                    lea      (12,sp),sp
                    bra.w    lbC002F36

lbC00329A:          move.w   ($56,sp),-(sp)
                    clr.w    -(sp)
                    move.l   ($54,sp),-(sp)
                    pea      ($26,a6)
                    lea      (lbC000040,pc),a0
                    jsr      (a0)
                    lea      (12,sp),sp
                    bra.w    lbC002D66

lbC0032B6:          move.l   d4,d2
                    btst     #2,($14,a0)
                    bne.w    lbC002F98
lbC0032C2:          movea.w  #1,a3
                    move.l   a3,($40,sp)
                    move.l   ($50,sp),d7
                    moveq    #0,d6
                    bra.w    lbC002FAC

lbC0032D4:          moveq    #-8,d1
                    bra.w    lbC0023F4

lbC0032DA:          moveq    #8,d1
                    bra.w    lbC0023F4

lbC0032E0:          movea.l  d2,a3
                    move.w   ($5C,sp),d2
                    move.b   ($48,sp),d1
                    bra.w    lbC00269A

lbC0032EE:          moveq    #9,d1
                    bra.w    lbC0023F4

lbC0032F4:          moveq    #-9,d1
                    bra.w    lbC0023F4

lbC0032FA:          addq.l   #2,a0
                    move.b   (a1),d1
                    ext.w    d1
lbC003300:          move.w   #$FF,d0
                    muls.w   d1,d0
                    asr.l    #6,d0
                    cmpi.w   #$7F,d0
                    ble.w    lbC003492
                    moveq    #$7F,d0
lbC003312:          move.b   d0,(a1)
                    moveq    #0,d0
                    move.b   ($1C,a6),d0
                    lsl.l    #4,d0
                    tst.w    d4
                    beq.w    lbC0034E2
                    lea      (2,a1,d0.l),a1
                    move.w   #$FF,d3
lbC00332A:          move.w   d4,d1
                    subq.w   #1,d1
                    movea.l  a0,a2
                    move.b   (a2)+,d0
                    ext.w    d0
                    move.w   d3,d6
                    muls.w   d0,d6
                    move.l   d6,d0
                    asr.l    #6,d0
                    cmpi.w   #$7F,d0
                    ble.b    lbC00335C
                    moveq    #$7F,d0
lbC003344:          move.b   d0,(-1,a2)
                    cmpa.l   a1,a2
                    beq.b    lbC00336C
lbC00334C:          move.w   d1,d4
                    movea.l  a2,a0
                    bne.b    lbC00332A
                    movea.l  a2,a1
                    moveq    #0,d0
                    not.w    d0
                    bra.w    lbC002E00

lbC00335C:          cmpi.w   #$FF80,d0
                    bge.b    lbC003344
                    moveq    #-$80,d0
                    move.b   d0,(-1,a2)
                    cmpa.l   a1,a2
                    bne.b    lbC00334C
lbC00336C:          move.b   ($1D,a6),d3
                    moveq    #0,d0
                    not.w    d0
                    tst.b    d3
                    bne.w    lbC002E0A
                    tst.w    d1
                    beq.w    lbC002F28
                    move.w   d4,d1
                    subq.w   #2,d1
                    move.b   ($1E,a6),d0
                    moveq    #0,d2
                    move.b   d0,d2
                    lsl.l    #8,d2
                    addq.l   #2,a0
                    andi.w   #$FF,d0
                    move.b   (a1),d3
                    ext.w    d3
                    muls.w   d3,d0
                    tst.b    ($38,sp)
                    beq.w    lbC003638
                    asr.l    #6,d0
                    cmpi.w   #$7F,d0
                    bgt.w    lbC003792
                    cmpi.w   #$FF80,d0
                    blt.w    lbC00378A
                    move.b   d0,(a1)
lbC0033B6:          tst.w    d1
                    beq.w    lbC002F28
                    asr.l    #8,d2
                    subq.w   #1,d1
                    andi.l   #$FFFF,d1
                    lea      (1,a0,d1.l),a1
                    tst.b    ($38,sp)
                    beq.b    lbC00342E
lbC0033D0:          move.b   (a0)+,d0
                    ext.w    d0
                    move.w   d2,d3
                    muls.w   d0,d3
                    move.l   d3,d0
                    asr.l    #6,d0
                    cmpi.w   #$7F,d0
                    ble.w    lbC002F16
                    moveq    #$7F,d0
                    move.b   d0,(-1,a0)
                    cmpa.l   a0,a1
                    bne.b    lbC0033D0
                    bra.w    lbC002F28

lbC0033F2:          cmpi.w   #$FF80,d2
                    bge.w    lbC002ECE
                    moveq    #-$80,d2
                    bra.w    lbC002ECE

lbC003400:          asr.l    #8,d2
                    bra.w    lbC002ECE

lbC003406:          movea.l  d2,a0
                    adda.l   d2,a0
                    movea.l  ($4C,sp),a3
                    move.w   (a0,a3.l),d4
                    movea.w  d7,a0
                    movea.l  d7,a5
                    moveq    #0,d7
                    move.w   d4,d7
                    movea.w  d2,a3
                    move.w   d4,d2
                    sub.w    a0,d2
                    move.w   d3,d4
                    lsr.w    #8,d4
                    muls.w   d2,d4
                    asr.l    #8,d4
                    add.w    a0,d4
                    bra.w    lbC002E98

lbC00342E:          move.b   (a0)+,d0
                    ext.w    d0
                    move.w   d2,d1
                    muls.w   d0,d1
                    move.l   d1,d0
                    asr.l    #8,d0
                    move.b   d0,(-1,a0)
                    cmpa.l   a1,a0
                    beq.w    lbC002F28
                    move.b   (a0)+,d0
                    ext.w    d0
                    move.w   d2,d1
                    muls.w   d0,d1
                    move.l   d1,d0
                    asr.l    #8,d0
                    move.b   d0,(-1,a0)
                    cmpa.l   a1,a0
                    bne.b    lbC00342E
                    bra.w    lbC002F28

lbC00345C:          movea.w  #$200,a2
                    movea.w  #$400,a5
                    suba.l   a3,a3
                    moveq    #0,d3
                    bra.w    lbC002E52

lbC00346C:          andi.w   #$FF,d5
                    muls.w   d6,d5
                    tst.b    ($38,sp)
                    beq.w    lbC003640
                    asr.l    #6,d5
                    cmpi.w   #$7F,d5
                    bgt.w    lbC0037A2
                    cmpi.w   #$FF80,d5
                    blt.w    lbC00379A
                    move.b   d5,(a1)
                    bra.w    lbC0033B6

lbC003492:          cmpi.w   #$FF80,d0
                    bge.w    lbC003312
                    moveq    #-$80,d0
                    bra.w    lbC003312

lbC0034A0:          addq.l   #2,a0
                    move.b   (a1),d1
                    ext.w    d1
lbC0034A6:          move.w   #$FF,d3
                    move.w   d3,d0
                    muls.w   d1,d0
                    asr.l    #8,d0
                    move.b   d0,(a1)
                    moveq    #0,d0
                    move.b   ($1C,a6),d0
                    lsl.l    #4,d0
                    tst.w    d4
                    beq.b    lbC0034E2
                    lea      (2,a1,d0.l),a1
lbC0034C2:          move.w   d4,d1
                    subq.w   #1,d1
                    movea.l  a0,a2
                    move.b   (a2)+,d0
                    ext.w    d0
                    move.w   d3,d5
                    muls.w   d0,d5
                    move.l   d5,d0
                    asr.l    #8,d0
                    move.b   d0,(a0)
                    cmpa.l   a1,a2
                    beq.w    lbC00336C
                    move.w   d1,d4
                    movea.l  a2,a0
                    bne.b    lbC0034C2
lbC0034E2:          movea.l  a0,a1
                    moveq    #0,d0
                    not.w    d0
                    bra.w    lbC002E00

lbC0034EC:          moveq    #-10,d1
                    bra.w    lbC0023F4

lbC0034F2:          move.w   ($5E,sp),d2
                    move.b   ($58,sp),d1
                    bra.w    lbC00269A

lbC0034FE:          btst     #0,($9F0,a3)
                    beq.w    lbC00365C
                    andi.b   #15,d0
                    move.b   d0,($9F4,a3)
                    move.l   ($A5C,a3),d0
                    move.l   d0,($6C,a3)
                    move.w   #2,($70,a3)
                    clr.b    ($76,a3)
                    move.w   #$7B,($74,a3)
                    move.b   #$40,(6,a3)
                    clr.b    (9,a3)
                    clr.w    (10,a3)
                    clr.w    (12,a3)
                    clr.l    (a3)
                    clr.l    ($5A,a3)
                    moveq    #3,d1
                    move.l   d1,($40,a3)
                    clr.b    (15,a3)
                    clr.w    ($10,a3)
                    clr.w    ($12,a3)
                    move.w   #$FF,($14,a3)
                    move.l   d0,($2E8,a3)
                    move.w   #2,($2EC,a3)
                    clr.b    ($2F2,a3)
                    move.w   #$7B,($2F0,a3)
                    move.b   #$40,($282,a3)
                    clr.b    ($285,a3)
                    clr.w    ($286,a3)
                    clr.w    ($288,a3)
                    clr.l    ($27C,a3)
                    clr.l    ($2D6,a3)
                    move.l   d1,($2BC,a3)
                    clr.b    ($28B,a3)
                    clr.w    ($28C,a3)
                    clr.w    ($28E,a3)
                    move.w   #$FF,($290,a3)
                    move.l   d0,($564,a3)
                    move.w   #2,($568,a3)
                    clr.b    ($56E,a3)
                    move.w   #$7B,($56C,a3)
                    move.b   #$40,($4FE,a3)
                    clr.b    ($501,a3)
                    clr.w    ($502,a3)
                    clr.w    ($504,a3)
                    clr.l    ($4F8,a3)
                    clr.l    ($552,a3)
                    move.l   d1,($538,a3)
                    clr.b    ($507,a3)
                    clr.w    ($508,a3)
                    clr.w    ($50A,a3)
                    move.w   #$FF,($50C,a3)
                    move.l   d0,($7E0,a3)
                    move.w   #2,($7E4,a3)
                    clr.b    ($7EA,a3)
                    move.w   #$7B,($7E8,a3)
                    clr.w    ($786,a3)
                    move.b   #$40,($77A,a3)
                    clr.w    ($784,a3)
                    clr.b    ($77F,a3)
                    clr.b    ($77D,a3)
                    clr.b    ($781,a3)
                    clr.b    ($77E,a3)
                    clr.b    ($780,a3)
                    clr.l    ($774,a3)
                    clr.l    ($7CE,a3)
                    move.l   d1,($7B4,a3)
                    move.w   #$FF,($788,a3)
                    clr.b    ($783,a3)
                    movea.l  ($AC,sp),a0
                    moveq    #0,d0
                    move.b   (a0),d0
                    bra.w    lbC00326E

lbC003638:          asr.l    #8,d0
                    move.b   d0,(a1)
                    bra.w    lbC0033B6

lbC003640:          asr.l    #8,d5
                    move.b   d5,(a1)
                    bra.w    lbC0033B6

lbC003648:          movea.w  #1,a0
                    move.l   a0,($40,sp)
                    movea.l  a0,a3
                    move.l   ($50,sp),d7
                    moveq    #0,d6
                    bra.w    lbC002FAC

lbC00365C:          lsr.b    #4,d0
                    move.b   d0,($9F4,a3)
                    move.l   ($A5C,a3),d0
                    move.l   d0,($6C,a3)
                    move.w   #2,($70,a3)
                    clr.b    ($76,a3)
                    move.w   #$7B,($74,a3)
                    move.b   #$40,(6,a3)
                    clr.b    (9,a3)
                    clr.w    (10,a3)
                    clr.w    (12,a3)
                    clr.l    (a3)
                    clr.l    ($5A,a3)
                    moveq    #3,d1
                    move.l   d1,($40,a3)
                    clr.b    (15,a3)
                    clr.w    ($10,a3)
                    clr.w    ($12,a3)
                    move.w   #$FF,($14,a3)
                    move.l   d0,($2E8,a3)
                    move.w   #2,($2EC,a3)
                    clr.b    ($2F2,a3)
                    move.w   #$7B,($2F0,a3)
                    move.b   #$40,($282,a3)
                    clr.b    ($285,a3)
                    clr.w    ($286,a3)
                    clr.w    ($288,a3)
                    clr.l    ($27C,a3)
                    clr.l    ($2D6,a3)
                    move.l   d1,($2BC,a3)
                    clr.b    ($28B,a3)
                    clr.w    ($28C,a3)
                    clr.w    ($28E,a3)
                    move.w   #$FF,($290,a3)
                    move.l   d0,($564,a3)
                    move.w   #2,($568,a3)
                    clr.b    ($56E,a3)
                    move.w   #$7B,($56C,a3)
                    move.b   #$40,($4FE,a3)
                    clr.b    ($501,a3)
                    clr.w    ($502,a3)
                    clr.w    ($504,a3)
                    clr.l    ($4F8,a3)
                    clr.l    ($552,a3)
                    move.l   d1,($538,a3)
                    clr.b    ($507,a3)
                    clr.w    ($508,a3)
                    clr.w    ($50A,a3)
                    move.w   #$FF,($50C,a3)
                    move.l   d0,($7E0,a3)
                    move.w   #2,($7E4,a3)
                    clr.b    ($7EA,a3)
                    move.w   #$7B,($7E8,a3)
                    clr.w    ($786,a3)
                    move.b   #$40,($77A,a3)
                    clr.w    ($784,a3)
                    clr.b    ($77F,a3)
                    clr.b    ($77D,a3)
                    clr.b    ($781,a3)
                    clr.b    ($77E,a3)
                    clr.b    ($780,a3)
                    clr.l    ($774,a3)
                    clr.l    ($7CE,a3)
                    move.l   d1,($7B4,a3)
                    move.w   #$FF,($788,a3)
                    clr.b    ($783,a3)
                    movea.l  ($AC,sp),a0
                    moveq    #0,d0
                    move.b   (a0),d0
                    bra.w    lbC00326E

lbC00378A:          moveq    #-$80,d0
                    move.b   d0,(a1)
                    bra.w    lbC0033B6

lbC003792:          moveq    #$7F,d0
                    move.b   d0,(a1)
                    bra.w    lbC0033B6

lbC00379A:          moveq    #-$80,d5
                    move.b   d5,(a1)
                    bra.w    lbC0033B6

lbC0037A2:          moveq    #$7F,d5
                    move.b   d5,(a1)
                    bra.w    lbC0033B6

lbC0037AA:          move.l   #$AAA,d4
                    pea      (12).w
                    move.l   d3,-(sp)
                    lea      (lbC003B74,pc),a0
                    jsr      (a0)
                    addq.l   #8,sp
                    andi.l   #$FFFF,d0
                    move.l   d4,-(sp)
                    moveq    #12,d1
                    sub.l    d0,d1
                    move.l   d1,-(sp)
                    movea.l  ($40,sp),a0
                    jsr      (a0)
                    addq.l   #8,sp
                    add.l    d0,d5
                    bra.w    lbC002B4A

lbC0037DA:          move.l   d3,d0
                    asr.l    #8,d0
                    movea.l  ($50,sp),a1
                    bra.w    lbC002E00

lbC0037E6:          movea.l  ($50,sp),a0
                    move.b   (a0)+,d1
                    ext.w    d1
                    movea.l  ($50,sp),a1
                    tst.b    ($38,sp)
                    beq.w    lbC0034A6
                    bra.w    lbC003300

lbC0037FE:          movea.l  a2,a0
                    clr.w    d1
                    bra.w    lbC0023F4

lbC003806:          move.l   #$8000,d6
                    bra.w    lbC002424

lbC003810:          movem.l  d2-d4/a2,-(sp)
                    move.l   ($14,sp),d0
                    movea.l  ($18,sp),a1
                    move.l   ($1C,sp),d1
                    move.l   d1,d3
                    subq.l   #1,d3
                    tst.l    d1
                    beq.b    lbC00388A
                    movea.l  d0,a0
                    addq.l   #4,a0
                    cmpa.l   a1,a0
                    sls      d2
                    neg.b    d2
                    lea      (4,a1),a0
                    cmpa.l   d0,a0
                    sls      d4
                    neg.b    d4
                    or.b     d4,d2
                    moveq    #8,d4
                    cmp.l    d3,d4
                    scs      d4
                    neg.b    d4
                    and.b    d4,d2
                    beq.b    lbC003890
                    move.l   a1,d2
                    or.l     d0,d2
                    moveq    #3,d4
                    and.l    d4,d2
                    bne.b    lbC003890
                    movea.l  a1,a0
                    movea.l  d0,a2
                    moveq    #-4,d2
                    and.l    d1,d2
                    add.l    a1,d2
lbC00385E:          move.l   (a0)+,(a2)+
                    cmp.l    a0,d2
                    bne.b    lbC00385E
                    moveq    #-4,d2
                    and.l    d1,d2
                    movea.l  d0,a0
                    adda.l   d2,a0
                    adda.l   d2,a1
                    sub.l    d2,d3
                    cmp.l    d1,d2
                    beq.b    lbC00388A
                    move.b   (a1),(a0)
                    tst.l    d3
                    beq.b    lbC00388A
                    move.b   (1,a1),(1,a0)
                    subq.l   #1,d3
                    beq.b    lbC00388A
                    move.b   (2,a1),(2,a0)
lbC00388A:          movem.l  (sp)+,d2-d4/a2
                    rts

lbC003890:          movea.l  d0,a0
                    add.l    a1,d1
lbC003894:          move.b   (a1)+,(a0)+
                    cmp.l    a1,d1
                    beq.b    lbC00388A
                    move.b   (a1)+,(a0)+
                    cmp.l    a1,d1
                    bne.b    lbC003894
                    bra.b    lbC00388A

lbC0038A2:          movem.l  d2-d5/a2/a3,-(sp)
                    movea.l  ($20,sp),a2
                    movea.l  ($24,sp),a1
                    cmpi.b   #$50,(a1)
                    bne.b    lbC0038BC
                    cmpi.b   #$52,(1,a1)
                    beq.b    lbC0038C4
lbC0038BC:          moveq    #0,d0
lbC0038BE:          movem.l  (sp)+,d2-d5/a2/a3
                    rts

lbC0038C4:          cmpi.b   #$54,(2,a1)
                    bne.b    lbC0038BC
                    move.b   (3,a1),d2
                    cmpi.b   #$1B,d2
                    bhi.b    lbC0038BC
                    move.b   ($3F,a1),d0
                    move.b   d0,(1,a2)
                    move.b   ($41,a1),d1
                    move.b   d1,(a2)
                    andi.w   #$FF,d0
                    move.w   d0,(2,a2)
                    moveq    #0,d3
                    move.b   (4,a1),d3
                    lsl.w    #8,d3
                    swap     d3
                    clr.w    d3
                    moveq    #0,d0
                    move.b   (5,a1),d0
                    swap     d0
                    clr.w    d0
                    or.l     d0,d3
                    moveq    #0,d0
                    move.b   (6,a1),d0
                    lsl.l    #8,d0
                    or.l     d3,d0
                    or.b     (7,a1),d0
                    moveq    #0,d3
                    move.b   ($3C,a1),d3
                    moveq    #0,d4
                    move.b   ($3E,a1),d4
                    move.l   d4,($8C,a2)
                    add.l    a1,d0
                    move.l   d0,($94,a2)
                    clr.l    ($88,a2)
                    move.l   d3,($90,a2)
                    move.b   (8,a1),d3
                    lsl.w    #8,d3
                    swap     d3
                    clr.w    d3
                    moveq    #0,d0
                    move.b   (9,a1),d0
                    swap     d0
                    clr.w    d0
                    or.l     d0,d3
                    moveq    #0,d0
                    move.b   (10,a1),d0
                    lsl.l    #8,d0
                    or.l     d3,d0
                    or.b     (11,a1),d0
                    add.l    a1,d0
                    move.l   d0,(4,a2)
                    moveq    #0,d3
                    move.b   (12,a1),d3
                    lsl.w    #8,d3
                    swap     d3
                    clr.w    d3
                    moveq    #0,d0
                    move.b   (13,a1),d0
                    swap     d0
                    clr.w    d0
                    or.l     d0,d3
                    moveq    #0,d0
                    move.b   (14,a1),d0
                    lsl.l    #8,d0
                    or.l     d3,d0
                    or.b     (15,a1),d0
                    lea      (a1,d0.l),a0
                    moveq    #$20,d0
lbC003986:          lea      ($17,a0),a3
lbC00398A:          tst.b    (a0)+
                    beq.b    lbC003992
                    cmpa.l   a0,a3
                    bne.b    lbC00398A
lbC003992:          subq.l   #1,d0
                    bne.b    lbC003986
                    move.l   a0,($98,a2)
                    move.b   ($40,a1),d0
                    moveq    #0,d5
                    move.b   d0,d5
                    move.l   d5,d4
                    lsl.l    #3,d4
                    add.l    a0,d4
                    tst.b    d0
                    beq.b    lbC0039CC
                    lea      (8,a2),a3
                    addq.l   #7,a0
                    add.l    d5,d5
                    add.l    d5,d5
                    add.l    a3,d5
lbC0039B8:          move.l   d4,(a3)+
                    moveq    #0,d3
                    move.b   (a0),d3
                    move.l   d3,d0
                    add.l    d3,d0
                    add.l    d3,d0
                    add.l    d0,d4
                    addq.l   #8,a0
                    cmp.l    a3,d5
                    bne.b    lbC0039B8
lbC0039CC:          moveq    #0,d3
                    move.b   ($10,a1),d3
                    lsl.w    #8,d3
                    swap     d3
                    clr.w    d3
                    moveq    #0,d0
                    move.b   ($11,a1),d0
                    swap     d0
                    clr.w    d0
                    or.l     d0,d3
                    moveq    #0,d0
                    move.b   ($12,a1),d0
                    lsl.l    #8,d0
                    or.l     d3,d0
                    or.b     ($13,a1),d0
                    lea      (a1,d0.l),a0
                    moveq    #$18,d0
lbC0039F8:          lea      ($17,a0),a3
                    move.l   a0,d3
                    tst.b    (a0)+
                    beq.b    lbC003A0C
lbC003A02:          cmpa.l   a0,a3
                    beq.b    lbC003A0C
                    move.l   a0,d3
                    tst.b    (a0)+
                    bne.b    lbC003A02
lbC003A0C:          subq.l   #1,d0
                    bne.b    lbC0039F8
                    move.l   a0,d0
                    btst     #0,d0
                    bne.w    lbC003AA8
lbC003A1A:          move.l   a0,($9C,a2)
                    cmpi.b   #$19,d2
                    bhi.w    lbC003AB0
                    moveq    #0,d0
                    lea      ($96C,a2),a0
lbC003A2C:          move.b   d0,(a0,d0.l)
                    addq.l   #1,d0
                    moveq    #$18,d2
                    cmp.l    d0,d2
                    bne.b    lbC003A2C
lbC003A38:          tst.b    d1
                    beq.b    lbC003AA0
                    movea.w  #$14,a0
                    adda.l   ($9C,a2),a0
                    andi.w   #$FF,d1
                    mulu.w   #$2A,d1
                    lea      (a0,d1.l),a2
                    moveq    #2,d0
lbC003A52:          moveq    #0,d1
                    move.b   (5,a0),d1
                    addq.l   #1,d1
                    lsl.l    #7,d1
                    btst     #2,(a0)
                    beq.b    lbC003A90
lbC003A62:          move.l   d1,d2
                    lsr.l    #2,d2
                    move.l   d1,d3
                    lsr.l    #1,d3
                    movea.l  d2,a1
                    adda.l   d3,a1
                    adda.l   d1,a1
                    lsr.l    #3,d1
                    add.l    a1,d1
                    add.l    d1,d0
                    lea      ($2A,a0),a0
                    cmpa.l   a2,a0
                    beq.w    lbC0038BE
                    moveq    #0,d1
                    move.b   (5,a0),d1
                    addq.l   #1,d1
                    lsl.l    #7,d1
                    btst     #2,(a0)
                    bne.b    lbC003A62
lbC003A90:          add.l    d1,d0
                    lea      ($2A,a0),a0
                    cmpa.l   a2,a0
                    bne.b    lbC003A52
                    movem.l  (sp)+,d2-d5/a2/a3
                    rts

lbC003AA0:          moveq    #2,d0
                    movem.l  (sp)+,d2-d5/a2/a3
                    rts

lbC003AA8:          movea.l  d3,a0
                    addq.l   #2,a0
                    bra.w    lbC003A1A

lbC003AB0:          pea      ($18).w
                    pea      ($42,a1)
                    pea      ($96C,a2)
                    lea      (lbC003810,pc),a0
                    jsr      (a0)
                    move.b   (a2),d1
                    lea      (12,sp),sp
                    bra.w    lbC003A38

lbC003ACC:          move.w   (4,sp),d0
                    mulu.w   (10,sp),d0
                    move.w   (6,sp),d1
                    mulu.w   (8,sp),d1
                    add.w    d1,d0
                    swap     d0
                    clr.w    d0
                    move.w   (6,sp),d1
                    mulu.w   (10,sp),d1
                    add.l    d1,d0
                    rts

lbC003AEE:          move.l   d2,-(sp)
                    move.l   (12,sp),d1
                    move.l   (8,sp),d0
                    cmpi.l   #$10000,d1
                    bcc.b    lbC003B16
                    move.l   d0,d2
                    clr.w    d2
                    swap     d2
                    divu.w   d1,d2
                    move.w   d2,d0
                    swap     d0
                    move.w   (10,sp),d2
                    divu.w   d1,d2
                    move.w   d2,d0
                    bra.b    lbC003B46

lbC003B16:          move.l   d1,d2
lbC003B18:          lsr.l    #1,d1
                    lsr.l    #1,d0
                    cmpi.l   #$10000,d1
                    bcc.b    lbC003B18
                    divu.w   d1,d0
                    andi.l   #$FFFF,d0
                    move.l   d2,d1
                    mulu.w   d0,d1
                    swap     d2
                    mulu.w   d0,d2
                    swap     d2
                    tst.w    d2
                    bne.b    lbC003B44
                    add.l    d2,d1
                    bcs.b    lbC003B44
                    cmp.l    (8,sp),d1
                    bls.b    lbC003B46
lbC003B44:          subq.l   #1,d0
lbC003B46:          move.l   (sp)+,d2
                    rts

lbC003B4A:          move.l   d2,-(sp)
                    moveq    #1,d2
                    move.l   (12,sp),d1
                    bpl.b    lbC003B58
                    neg.l    d1
                    neg.b    d2
lbC003B58:          move.l   (8,sp),d0
                    bpl.b    lbC003B62
                    neg.l    d0
                    neg.b    d2
lbC003B62:          move.l   d1,-(sp)
                    move.l   d0,-(sp)
                    bsr.b    lbC003AEE
                    addq.l   #8,sp
                    tst.b    d2
                    bpl.b    lbC003B70
                    neg.l    d0
lbC003B70:          move.l   (sp)+,d2
                    rts

lbC003B74:          move.l   (8,sp),d1
                    move.l   (4,sp),d0
                    move.l   d1,-(sp)
                    move.l   d0,-(sp)
                    bsr.b    lbC003B4A
                    addq.l   #8,sp
                    move.l   (8,sp),d1
                    move.l   d1,-(sp)
                    move.l   d0,-(sp)
                    bsr.w    lbC003ACC
                    addq.l   #8,sp
                    move.l   (4,sp),d1
                    sub.l    d0,d1
                    move.l   d1,d0
                    rts

                    move.l   (8,sp),d1
                    move.l   (4,sp),d0
                    move.l   d1,-(sp)
                    move.l   d0,-(sp)
                    bsr.w    lbC003AEE
                    addq.l   #8,sp
                    move.l   (8,sp),d1
                    move.l   d1,-(sp)
                    move.l   d0,-(sp)
                    bsr.w    lbC003ACC
                    addq.l   #8,sp
                    move.l   (4,sp),d1
                    sub.l    d0,d1
                    move.l   d1,d0
                    rts

                    move.l   a6,-(sp)
                    movea.l  (4).w,a6
                    jsr      (-516,a6)
                    movea.l  (sp)+,a6
                    rts

lbW003BD4:          dc.w     $8000,$871D,$8F2F,$97B7,$9FC4,$A9DE,$B505,$BF49
                    dc.w     $CB31,$D645,$E215,$F1A0
lbB003BEC:          dc.b     2,3,4,5,6,7,8,9,10,11,12,13,14,$14,$28,$50
lbB003BFC:          dc.b     0,8,9,10,11,12,13,14,$12,$14,$1C,$28,$32,$46,$A0
                    dc.b     $FF
lbB003C0C:          dc.b     0,4,8,10,12,14,$10,$12,$14,$18,$20,$28,$38,$60
                    dc.b     $96,$FF
lbW003C1C:          dc.w     $400,$200,$180,$140,$100,$C0,$A0,$80,$78,$74,$6E
                    dc.w     $69,$64,$5A,$46,$40,$38,$30,$28,$20,$1F,$1E,$1D
                    dc.w     $1C,$1B,$1A,$19,$18,$17,$16,$15,$14,$13,$12,$11
                    dc.w     $10,15,14,13,13,12,12,11,11,10,10,9,9,8,8,8,8,7,7
                    dc.w     7,7,6,6,6,6,5,5,5,5,4,4,4,4,4,4,4,4,4,4,3,4,4,3,4
                    dc.w     4,3,4,3,4,3,4,3,4,3,3,3,3,3,3,3,3,3,2,3,3,3,2,3,3
                    dc.w     2,3,3,2,3,3,2,3,2,3,2,3,2,3,2,3,2,2,2,2,2,2,2,2,1
                    dc.w     2,1,2,1,2,1,2,1,1,2,1,1,1,2,1
lbB003D3C:          dc.b     0,1,3,6,7,9,10,11,12,13,14,$10,$13,$23,$37,$8F
lbW003D4C:          dc.w     $400,$200,$80,$64,$50,$40,$30,$20,$10,14,12,10,8
                    dc.w     4,2,1
lbB003D6C:          dc.b     12,12,12,12,12,12,12,12,12,12,12,12,$18,$18,$18
                    dc.b     $18,$18,$18,$18,$18,$18,$18,$18,$18,$24,$24,$24
                    dc.b     $24,$24,$24,$24,$24,$24,$24,$24,$24,$24,$24,$24
                    dc.b     $24,$24,$24,$24,$24,$24,$24,$24,$24,$24,$24,$24
                    dc.b     $24,$24,$24,$24,$24,$24,$24,$24,$24,$24,$24,$24
                    dc.b     $24,$24,$24,$24,$24,$24,$24,$24,$24,$24,$24,$24
                    dc.b     $24,$24,$24,$24,$24,$24,$24,$24,$24,$24,$24,$24
                    dc.b     $24,$24,$24,$24,$24,$24,$24,$24,$24,$24,$24,$24
                    dc.b     $24,$24,0,0,0,0,0,0,0
lbB003DD8:          dc.b     1,1,1,1,1,1,1,1,1,1,1,1,2,2,2,2,2,2,2,2,2,2,2,2,3
                    dc.b     3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3
                    dc.b     3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3
                    dc.b     3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,0,0,0,0
                    dc.b     0,0,0,0,0,0,0,0
lbB003E44:          dc.b     $FC,$FB,$FF,1,2,3,4,0
lbW003E4C:          dc.w     0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,15,14,13,12
                    dc.w     11,10,9,8,7,6,5,4,3,2,1,0
lbW003E8C:          dc.w     $4D,$125,$21B,$437,$539,$755,$96D,$BD7,0,0,0,0,0
                    dc.w     0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
                    dc.w     0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
                    dc.w     0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
                    dc.w     0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
                    dc.w     0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
                    dc.w     0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
                    dc.w     0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
lbW004000:          dc.w     $350
lbW004002:          dc.w     0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,$320,0,0,0,0,0,0,0
                    dc.w     0,0,0,0,0,0,0,0,$2F2,0,0,0,0,0,0,0,0,0,0,0,0,0,0
                    dc.w     0,$2C8,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,$2A0,0,0,0,0
                    dc.w     0,0,0,0,0,0,0,0,0,0,0,$279,0,0,0,0,0,0,0,0,0,0,0
                    dc.w     0,0,0,0,$256,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,$236,0
                    dc.w     0,0,0,0,0,0,0,0,0,0,0,0,0,0,$216,0,0,0,0,0,0,0,0
                    dc.w     0,0,0,0,0,0,0,$1F8,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
                    dc.w     $1DC,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,$1C0,0,0,0,0,0
                    dc.w     0,0,0,0,0,0,0,0,0,0,$1A8,0,0,0,0,0,0,0,0,0,0,0,0
                    dc.w     0,0,0,$190,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,$179,0,0
                    dc.w     0,0,0,0,0,0,0,0,0,0,0,0,0,$164,0,0,0,0,0,0,0,0,0
                    dc.w     0,0,0,0,0,0,$151,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
                    dc.w     $13E,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,$12C,0,0,0,0,0
                    dc.w     0,0,0,0,0,0,0,0,0,0,$11B,0,0,0,0,0,0,0,0,0,0,0,0
                    dc.w     0,0,0,$10B,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,$FC,0,0
                    dc.w     0,0,0,0,0,0,0,0,0,0,0,0,0,$EE,0,0,0,0,0,0,0,0,0,0
                    dc.w     0,0,0,0,0,$E0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,$D4,0
                    dc.w     0,0,0,0,0,0,0,0,0,0,0,0,0,0,$C8,0,0,0,0,0,0,0,0,0
                    dc.w     0,0,0,0,0,0,$BD,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,$B2
                    dc.w     0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,$A8,0,0,0,0,0,0,0,0
                    dc.w     0,0,0,0,0,0,0,$9F,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
                    dc.w     $96,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,$8D,0,0,0,0,0,0
                    dc.w     0,0,0,0,0,0,0,0,0,$86,0,0,0,0,0,0,0,0,0,0,0,0,0,0
                    dc.w     0,$7E,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,$78,0,0,0,0,0
                    dc.w     0,0,0,0,0,0,0,0,0,0,$71,0,0,0,0,0,0,0,0,0,0,0,0,0
                    dc.w     0,0,$71
lbW004482:          dc.w     0
lbW004484:          dcb.w    $3F,0
                    dcb.w    $3F,0
                    dcb.w    $3F,0
                    dcb.w    $3F,0
                    dcb.w    3,0
lbW004682:          dc.w     0

                    end
