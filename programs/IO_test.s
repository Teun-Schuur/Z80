IO_ONE		=	$0
IO_TWO		=	$1
IO_READ		=	$0	; does not mether
RAM_END		=	$FFE

start:
	.org 0
	;	ld sp, RAM_END

run:
	ld a, %00000001
	out (IO_ONE), a
	ld a, %00000010
	out (IO_ONE), a
	ld a, %00000100
	out (IO_ONE), a
	ld a, %00001000
	out (IO_ONE), a
	ld a, %00010000
	out (IO_ONE), a
	ld a, %00100000
	out (IO_ONE), a
	ld a, %01000000
	out (IO_ONE), a
	ld a, %10000000
	out (IO_ONE), a
	ld a, %00000000
	out (IO_ONE), a
	ld a, %00000001
	out (IO_TWO), a
	ld a, %00000010
	out (IO_TWO), a
	ld a, %00000100
	out (IO_TWO), a
	ld a, %00001000
	out (IO_TWO), a
	ld a, %00010000
	out (IO_TWO), a
	ld a, %00100000
	out (IO_TWO), a
	ld a, %01000000
	out (IO_TWO), a
	ld a, %10000000
	out (IO_TWO), a
	ld a, %00000000
	out (IO_TWO), a
	jr run
