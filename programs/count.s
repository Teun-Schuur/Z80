start:
	ld a, $ff	; a = 255
	ld hl, $1001	; b = 0x1001


decr:
	ld (hl), a	; print a
	dec a		; a -= 1
	cp $1		; if a == 1:
	jp nz, decr 	;	goto incr
	jp incr		; else:
			; 	goto decr
incr:	
	ld (hl), a	; print a
	inc a		; a += 1
	cp 254		;
	jp nz, incr	;if a == 254: 
	jp decr		;	goto start
			; else:
			; 	goto decr
	
