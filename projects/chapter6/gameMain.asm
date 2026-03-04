//==============================================================================
//                 RetroGameDev C64 Edition Volume 1 gameMain
//              (C)2017 by Derek Morris <https://retrogamedev.com>
//     Conversion to KickAss 5.x by Marcelo Lv Cabral <http://lvcabral.com>
//==============================================================================
// BASIC Loader

*= $0801 "Basic Loader" 
        BasicUpstart(gameMainInit)

        #import "../library/libMemory.asm"
        #import "../library/libMath.asm"
        #import "../library/libScreen.asm"

//===============================================================================
// Initialize
*= $2000 "Code"
gameMainInit:
        // Turn off interrupts to stop LIBSCREEN_WAIT failing every so 
        // often when the kernal interrupt syncs up with the scanline test
        sei

        // Disable run/stop + restore keys
        lda #$FC 
        sta $0328

        // Set border and background colors
        // The last 3 parameters are not used yet
        LIBSCREEN_SETCOLORS(BLUE, WHITE, BLACK, BLACK, BLACK)

        // Fill 1000 .bytes (40x25) of screen memory 
        LIBSCREEN_SET1000(SCREENRAM, 'a') // 'a' maps to char 1

        // Fill 1000 .bytes (40x25) of color memory
        LIBSCREEN_SET1000( COLORRAM, BLACK)

//===============================================================================
// Update

gMLoop:
        LIBSCREEN_WAIT_V(255)
        //inc EXTCOL // start code timer change border color
        // Game update code goes here
        //dec EXTCOL // end code timer reset border color
        jmp gMLoop





