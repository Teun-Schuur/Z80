RAM	=	$FFE
IOA	=	$0
IOB	=	$1

init:
	.org 0
	ld sp, RAM
	ld a, %00000001
	ld b, 8

aLeft:
	out (IOA), a
	rlc a
	djnz aLeft
	ld a, 0
	out (IOA), a
	ld b, 8
	ld a, 1
	jr bLeft

bLeft:
	out (IOB), a
	rlc a
	djnz bLeft
	ld b, 8
	ld a, $80
	jr bRight
	
bRight:
	out (IOB), a
	rrc a
	djnz bRight
	ld a, 0
	out (IOB), a
	ld b, 8
	ld a, $80
	jr aRight	

aRight:
	out (IOA), a
	rrc a
	djnz aRight
	ld a, 0
	out (IOA), a
	ld b, 8
	ld a, 1
	jr aLeft
