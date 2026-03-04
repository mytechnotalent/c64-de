// ---------------------------------------------------------
// Sprite Demo - C64 Hardware Sprites
// Shows all 8 sprites bouncing around the screen with
// different colors. Demonstrates sprite registers, movement,
// and multicolor mode.
// ---------------------------------------------------------

BasicUpstart2(start)

// ---------------------------------------------------------
// Constants
// ---------------------------------------------------------
.const SCREEN                = $0400
.const BORDER                = $d020
.const BGND                  = $d021
.const RASTER                = $d012

// VIC-II sprite registers
.const VIC                   = $d000
.const SPR_X0                = VIC + 0           // Sprite 0 X position
.const SPR_Y0                = VIC + 1           // Sprite 0 Y position
.const SPR_X_MSB             = VIC + 16          // X position MSB for all sprites
.const SPR_ENABLE            = VIC + 21          // Sprite enable register
.const SPR_EXPAND_Y          = VIC + 23          // Y expansion
.const SPR_PRIORITY          = VIC + 27          // Sprite-BG priority
.const SPR_MULTICOLOR        = VIC + 28          // Multicolor mode
.const SPR_EXPAND_X          = VIC + 29          // X expansion
.const SPR_MULTI_COL0        = VIC + 37          // Shared multicolor 0
.const SPR_MULTI_COL1        = VIC + 38          // Shared multicolor 1
.const SPR_COLOR0            = VIC + 39          // Sprite 0 individual color

// Sprite data pointers (last 8 bytes of screen memory)
.const SPR_PTR0              = SCREEN + $3f8

// Colors
.const BLACK                 = 0
.const WHITE                 = 1
.const RED                   = 2
.const CYAN                  = 3
.const PURPLE                = 4
.const GREEN                 = 5
.const BLUE                  = 6
.const YELLOW                = 7
.const ORANGE                = 8
.const LIGHT_GREEN           = 13
.const LIGHT_BLUE            = 14

// Screen limits for sprite movement
.const X_MIN                 = 24
.const X_MAX                 = 200
.const Y_MIN                 = 50
.const Y_MAX                 = 229

.const NUM_SPRITES           = 8

// ---------------------------------------------------------
// Zero page variables
// ---------------------------------------------------------
.const zp_temp               = $02

// Sprite position arrays in low memory
// X positions: $10-$17, Y positions: $18-$1f
// X direction: $20-$27 (0=right, 1=left)
// Y direction: $28-$2f (0=down, 1=up)
// X speed: $30-$37, Y speed: $38-$3f
.const sprX                  = $10
.const sprY                  = $18
.const sprDirX               = $20
.const sprDirY               = $28
.const sprSpdX               = $30
.const sprSpdY               = $38

// ---------------------------------------------------------
// Main entry point
// ---------------------------------------------------------
start:
	jsr clearScreen
	jsr initSprites
	jsr setupSpriteGraphics

	lda #BLUE
	sta BORDER
	lda #LIGHT_BLUE
	sta BGND

mainLoop:
// Wait for raster at bottom of screen
	lda #$ff
!wait:
	cmp RASTER
	bne !wait-
!wait2:
	cmp RASTER
	beq !wait2-

	jsr moveSprites
	jsr updateSpriteRegs
	jmp mainLoop

// ---------------------------------------------------------
// Clear screen
// ---------------------------------------------------------
clearScreen:
	lda #$20
	ldx #0
!clr:
	sta SCREEN,x
	sta SCREEN + $100,x
	sta SCREEN + $200,x
	sta SCREEN + $2e8,x
	inx
	bne !clr-
	rts

// ---------------------------------------------------------
// Initialize sprite positions and velocities
// ---------------------------------------------------------
initSprites:
	ldx #0
!loop:
// Set initial X positions spread across screen
	txa
	asl
	asl
	asl
	asl                                          // x * 16
	clc
	adc #60                                      // offset from left
	sta sprX,x

// Set initial Y positions spread vertically
	txa
	asl
	asl
	asl
	asl
	clc
	adc #80
	sta sprY,x

// All moving right and down initially
	lda #0
	sta sprDirX,x
	sta sprDirY,x

// Different speeds per sprite
	txa
	and #$03
	clc
	adc #1                                       // speed 1-4
	sta sprSpdX,x

	txa
	lsr
	clc
	adc #1                                       // speed 1-4
	sta sprSpdY,x

	inx
	cpx #NUM_SPRITES
	bne !loop-
	rts

// ---------------------------------------------------------
// Set up sprite graphics and enable them
// ---------------------------------------------------------
setupSpriteGraphics:
// Point all sprites to our sprite data
// Sprite data at $2000 = block 128 ($2000/64)
	ldx #0
!ptrs:
	lda #(spriteData / 64)
	sta SPR_PTR0,x
	inx
	cpx #NUM_SPRITES
	bne !ptrs-

// Enable all 8 sprites
	lda #$ff
	sta SPR_ENABLE

// No expansion, no multicolor, no priority
	lda #$00
	sta SPR_EXPAND_X
	sta SPR_EXPAND_Y
	sta SPR_MULTICOLOR
	sta SPR_PRIORITY
	sta SPR_X_MSB

// Set sprite colors
	lda #WHITE
	sta SPR_COLOR0
	lda #RED
	sta SPR_COLOR0 + 1
	lda #CYAN
	sta SPR_COLOR0 + 2
	lda #GREEN
	sta SPR_COLOR0 + 3
	lda #YELLOW
	sta SPR_COLOR0 + 4
	lda #ORANGE
	sta SPR_COLOR0 + 5
	lda #PURPLE
	sta SPR_COLOR0 + 6
	lda #LIGHT_GREEN
	sta SPR_COLOR0 + 7
	rts

// ---------------------------------------------------------
// Move all sprites (bounce off screen edges)
// ---------------------------------------------------------
moveSprites:
	ldx #0
!loop:
	// --- Move X ---
	lda sprDirX,x
	bne !moveLeft+

// Moving right
	lda sprX,x
	clc
	adc sprSpdX,x
	sta sprX,x
	cmp #X_MAX
	bcc !xDone+
	lda #1                                       // reverse to left
	sta sprDirX,x
	jmp !xDone+

!moveLeft:
	lda sprX,x
	sec
	sbc sprSpdX,x
	sta sprX,x
	cmp #X_MIN
	bcs !xDone+
	lda #0                                       // reverse to right
	sta sprDirX,x
!xDone:

	// --- Move Y ---
	lda sprDirY,x
	bne !moveUp+

// Moving down
	lda sprY,x
	clc
	adc sprSpdY,x
	sta sprY,x
	cmp #Y_MAX
	bcc !yDone+
	lda #1                                       // reverse to up
	sta sprDirY,x
	jmp !yDone+

!moveUp:
	lda sprY,x
	sec
	sbc sprSpdY,x
	sta sprY,x
	cmp #Y_MIN
	bcs !yDone+
	lda #0                                       // reverse to down
	sta sprDirY,x
!yDone:

	inx
	cpx #NUM_SPRITES
	bne !loop-
	rts

// ---------------------------------------------------------
// Write sprite positions to VIC registers
// ---------------------------------------------------------
updateSpriteRegs:
	lda #0
	sta SPR_X_MSB                                // clear all MSBs

	ldx #0
!loop:
// Calculate VIC register offset (x*2 for X/Y pairs)
	txa
	asl
	tay

// Set X position
	lda sprX,x
	sta VIC,y

// Set Y position
	lda sprY,x
	iny
	sta VIC,y

	inx
	cpx #NUM_SPRITES
	bne !loop-
	rts

// ---------------------------------------------------------
// Sprite data - a simple ball shape
// Align to 64-byte boundary as required by VIC-II
// ---------------------------------------------------------
	.align 64
spriteData:
// Row 1-3: top curve
	.byte %00000000, %11111000, %00000000
	.byte %00000011, %11111110, %00000000
	.byte %00000111, %11111111, %00000000
// Row 4-6
	.byte %00001111, %11111111, %10000000
	.byte %00011111, %11111111, %11000000
	.byte %00011111, %11111111, %11000000
// Row 7-9
	.byte %00111111, %11111111, %11100000
	.byte %00111111, %11111111, %11100000
	.byte %00111111, %11111111, %11100000
// Row 10-12: middle
	.byte %00111111, %11111111, %11100000
	.byte %00111111, %11111111, %11100000
	.byte %00111111, %11111111, %11100000
// Row 13-15
	.byte %00011111, %11111111, %11000000
	.byte %00011111, %11111111, %11000000
	.byte %00001111, %11111111, %10000000
// Row 16-18
	.byte %00000111, %11111111, %00000000
	.byte %00000011, %11111110, %00000000
	.byte %00000000, %11111000, %00000000
// Row 19-21: empty
	.byte %00000000, %00000000, %00000000
	.byte %00000000, %00000000, %00000000
	.byte %00000000, %00000000, %00000000
// Pad to 64 bytes
	.byte 0
