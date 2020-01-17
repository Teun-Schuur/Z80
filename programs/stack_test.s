IOA	=	$0
IOB	=	$1
RAM_END	=	$fff

	.org 0
	ld sp, RAM_END

start:
	ld c, IOA	;set IO poort to
	call blink
	call blink
	ld c, IOB
	call blink
	jr start
 

blink:
	; c as argument in witch poort
	push af
	ld a, $55
	out (c), a
	ld a, $aa
	out (c), a
	pop af
	ret
 
