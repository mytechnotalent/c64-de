BasicUpstart2(main)

main:

loop:
	inc $d020
	jmp loop
