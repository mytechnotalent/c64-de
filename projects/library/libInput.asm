//==============================================================================
//                         RetroGameDev Library C64 v1
//              (C)2017 by Derek Morris <https://retrogamedev.com>
//     Conversion to KickAss 5.x by Marcelo Lv Cabral <http://lvcabral.com>
//==============================================================================
// Includes

#importonce
#import "libMemory.asm"

//===============================================================================
// Constants

 // use joystick 2, change to CIAPRB for joystick 1
.const JoystickRegister        = CIAPRA

.const GameportUpMask          = %00000001
.const GameportDownMask        = %00000010
.const GameportLeftMask        = %00000100
.const GameportRightMask       = %00001000
.const GameportFireMask        = %00010000
.const FireDelayMax            = 30

//===============================================================================
// Variables

gameportLastFrame:      .byte 0
gameportThisFrame:      .byte 0
gameportDiff:           .byte 0
fireDelay:              .byte 0
fireBlip:               .byte 1 // reversed logic to match other input

//===============================================================================
// Macros/Subroutines

.macro LIBINPUT_GETHELD(mask) { // (buttonMask)

        lda gameportThisFrame
        and #mask
        } // test with bne on return

//===============================================================================

.macro LIBINPUT_GETFIREPRESSED() {
     
        lda #1
        sta fireBlip // clear Fire flag

        // is fire held?
        lda gameportThisFrame
        and #GameportFireMask
        bne notheld

held:
        // is this 1st frame?
        lda gameportDiff
        and #GameportFireMask
        
        beq notfirst
        lda #0
        sta fireBlip // Fire

        // reset delay
        lda #FireDelayMax
        sta fireDelay        
notfirst:

        // is the delay zero?
        lda fireDelay
        bne notheld
        lda #0
        sta fireBlip // Fire
        // reset delay
        lda #FireDelayMax
        sta fireDelay   
        
notheld:
        lda fireBlip
} // test with bne on return

//===============================================================================

libInputUpdate:

        lda JoystickRegister
        sta gameportThisFrame

        eor gameportLastFrame
        sta gameportDiff

        
        lda fireDelay
        beq lIUDelayZero
        dec fireDelay
lIUDelayZero:

        lda gameportThisFrame
        sta gameportLastFrame

        rts
