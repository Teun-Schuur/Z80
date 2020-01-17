	ld hl, $1001
	ld a, 4
	ld b, 5

start:
	ld (hl), %10101010
	ld (hl), a
	ld (hl), b

	cp b
	ld (hl), $ff
	jr z, poepi
	ld (hl), %10000111
	cp b
	ld (hl), $ff
	jr c, lower
	ld (hl), %01000111
	cp b
	ld (hl), $ff
	jr nz, not_equl
	ld (hl), %00100111
	cp b
	ld (hl), $ff
	jr nc, greater
	ld (hl), %00010111

	jr none


poepi:
	ld (hl), %10000000
	ld (hl), a
	inc a
	ld (hl), a
	jp start

not_equl:
	ld (hl), %01000000
	ld (hl), a
	inc a
	ld (hl), a
	jp start

greater:	
	ld (hl), %00100000
	ld (hl), a
	inc a
	ld (hl), a
	jp start
	

lower:
	ld (hl), %00010000
	ld (hl), a
	inc a
	ld (hl), a
	jp start


none:
	ld (hl), %01010101
	ld (hl), a
	inc a
	ld (hl), a
	jp start
