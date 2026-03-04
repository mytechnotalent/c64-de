// BASIC SYS stub so VICE autostart can launch the program
*=$0801
	.byte $0c, $08                               // Pointer to next BASIC line ($080C)
	.byte $0a, $00                               // Line number 10
	.byte $9e                                    // BASIC token for SYS
	.text "2061"                                 // SYS 2061 ($080D)
	.byte $00                                    // End of BASIC line
	.byte $00, $00                               // End of BASIC program

// Main program starts here
*=$080D
	lda #4                                       // decimal 4 (value) -> A
	ldx #5                                       // decimal 5 (value) -> X
	ldy #6                                       // decimal 6 (value) -> Y
