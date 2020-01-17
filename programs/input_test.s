IO_RA	=	%10000000
IO_RB	=	%01000000
IO_RC	=	%00100000
IO_RD	=	%00010000
IO_R	=	0

IO_WA	=	$0
IO_WB	=	$1

END_RAM	=	$ffe

ENABLE	=	%10000000
RSS	=	%01000000
RSE	=	%11000000

INIT:
	.org	0
	ld sp, END_RAM
	
	ld a, %00110000	; Function set; 8 bit buss; Display line number = 1
	call wInst
	
	ld a, %00001111
	call wInst

	ld a, %00000110	; Increment and shift cursor; don't shift display
	call wInst

	ld a, %00000001	; clear display
	call wInst

	ld a, %00000010	; return Home

	jr run

run:
	ld a, "H"
	call wData
	ld a, "e"
	call wData
	ld a, "l"
	call wData
	ld a, "l"
	call wData
	ld a, "o"
	call wData
	ld a, " "
	call wData
	ld a, "W"
	call wData
	ld a, "o"
	call wData
	ld a, "r"
	call wData
	ld a, "l"
	call wData
	ld a, "d"
	call wData
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	ld a, %00000001
	call wInst
	ld a, %00000010
	call wInst
	jr run


wData:
	; uses reg a as data
	out (IO_WA), a
	ld a, RSS
	out (IO_WB), a
	ld a, RSE
	out (IO_WB), a
	ld a, RSS
	out (IO_WB), a
	ret

wInst:
	; uses reg a as instrunction
	out (IO_WA), a	; set data
	ld a, 0
	out (IO_WB), a	; reset RS and E
	ld a, ENABLE
	out (IO_WB), a	; set E
	ld a, 0 
	out (IO_WB), a	; reset E
	ret

