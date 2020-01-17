IO_RA	=	%10000000
IO_RB	=	%01000000
IO_RC	=	%00100000
IO_RD	=	%00010000
IO_R	=	0

IO_WA	=	$0
IO_WB	=	$1

END_RAM	=	$fff
END_ROM = 	$7ff

ENABLE	=	%10000000
RSS	=	%01000000
RSE	=	%11000000

line1	=	$00
line2	=	$40
line3	=	$14
line4	=	$54



INIT:
	.org $c00
	ld sp, END_RAM
	ld a, %00110000	; Function set; 8 bit buss; Display line number = 1
	call wInst
	ld a, %00001101	; Display On/Off; cursor off; cursor postion on
	call wInst
	ld a, %00000110	; Increment and shift cursor; don't shift display
	call wInst
	call reset
	ret

reset:
	.org $c1e
	ld a, %00000001	; clear display
	call wInst
	ld a, %00000010	; return Home
	call wInst


wData:
	.org $c2d
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
	.org $c50
	; uses reg a as instrunction
	out (IO_WA), a	; set data
	ld a, 0
	out (IO_WB), a	; reset RS and E
	ld a, ENABLE
	out (IO_WB), a	; set E
	ld a, 0
	out (IO_WB), a	; reset E
	ret


setXY:
	.org $c69
	; l=x; h=y
	ld a, h
	cp line3
	jr c, l1
	cp line4
	jr c, l2
	cp line2
	jr z, l3
	jr l4
l1:	ld a, l
	add line1
	or %01000000
	call wInst
	ret
l2:	ld a, l
	add line2
	or %01000000
	call wInst
	ret
l3:	ld a, l
	add line3
	or %01000000
	call wInst
	ret
l4:	ld a, l
	add line4
	or %01000000
	call wInst
	ret

setY:
	.org $
