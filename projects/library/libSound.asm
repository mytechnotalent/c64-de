//==============================================================================
//                         RetroGameDev Library C64 v1
//              (C)2017 by Derek Morris <https://retrogamedev.com>
//     Conversion to KickAss 5.x by Marcelo Lv Cabral <http://lvcabral.com>
//==============================================================================
// Includes

#importonce
#import "libMemory.asm"
#import "libMath.asm"

//===============================================================================
// Constants

.const TriangleStart   = 17
.const TriangleEnd     = 16
.const SawtoothStart   = 33
.const SawtoothEnd     = 32
.const PulseStart      = 65
.const PulseEnd        = 64
.const NoiseStart      = 129
.const NoiseEnd        = 128

.const Attack_2ms      = 0
.const Attack_8ms      = 16    // 1<<4
.const Attack_16ms     = 32    // 2<<4
.const Attack_24ms     = 48    // 3<<4
.const Attack_38ms     = 64    // 4<<4
.const Attack_56ms     = 80    // 5<<4
.const Attack_68ms     = 96    // 6<<4
.const Attack_80ms     = 112   // 7<<4
.const Attack_100ms    = 128   // 8<<4
.const Attack_250ms    = 144   // 9<<4
.const Attack_500ms    = 160   // 10<<4
.const Attack_800ms    = 176   // 11<<4
.const Attack_1s       = 192   // 12<<4
.const Attack_3s       = 208   // 13<<4
.const Attack_5s       = 224   // 14<<4
.const Attack_8s       = 240   // 15<<4

.const Decay_6ms       = 0
.const Decay_24ms      = 1
.const Decay_48ms      = 2
.const Decay_72ms      = 3
.const Decay_114ms     = 4
.const Decay_168ms     = 5
.const Decay_204ms     = 6
.const Decay_240ms     = 7
.const Decay_300ms     = 8
.const Decay_750ms     = 9
.const Decay_1_5s      = 10
.const Decay_2_4s      = 11
.const Decay_3s        = 12
.const Decay_9s        = 13
.const Decay_15s       = 14
.const Decay_24s       = 15

.const Sustain_Vol0    = 0
.const Sustain_Vol1    = 16    // 1<<4
.const Sustain_Vol2    = 32    // 2<<4
.const Sustain_Vol3    = 48    // 3<<4
.const Sustain_Vol4    = 64    // 4<<4
.const Sustain_Vol5    = 80    // 5<<4
.const Sustain_Vol6    = 96    // 6<<4
.const Sustain_Vol7    = 112   // 7<<4
.const Sustain_Vol8    = 128   // 8<<4
.const Sustain_Vol9    = 144   // 9<<4
.const Sustain_Vol10   = 160   // 10<<4
.const Sustain_Vol11   = 176   // 11<<4
.const Sustain_Vol12   = 192   // 12<<4
.const Sustain_Vol13   = 208   // 13<<4
.const Sustain_Vol14   = 224   // 14<<4
.const Sustain_Vol15   = 240   // 15<<4

.const Release_6ms     = 0
.const Release_24ms    = 1
.const Release_48ms    = 2
.const Release_72ms    = 3
.const Release_114ms   = 4
.const Release_168ms   = 5
.const Release_204ms   = 6
.const Release_240ms   = 7
.const Release_300ms   = 8
.const Release_750ms   = 9
.const Release_1_5s    = 10
.const Release_2_4s    = 11
.const Release_3s      = 12
.const Release_9s      = 13
.const Release_15s     = 14
.const Release_24s     = 15

.const CmdWave                 = 0
.const CmdAttackDecay          = 1
.const CmdSustainRelease       = 2
.const CmdFrequencyHigh        = 3
.const CmdFrequencyLow         = 4
.const CmdPulseWidthHigh       = 5
.const CmdPulseWidthLow        = 6
.const CmdDelay                = 7
.const CmdEnd                  = 8

//===============================================================================
// Variables

soundVoiceActive:       .byte 0, 0, 0
soundVoiceCmdPtrHigh:   .byte 0, 0, 0
soundVoiceCmdPtrLow:    .byte 0, 0, 0
soundVoiceCmdIndex:     .byte 0, 0, 0
soundVoiceDelay:        .byte 0, 0, 0

//===============================================================================
// Pre-made sound effect comand buffers

soundFiring:    .byte CmdAttackDecay, Attack_2ms+Decay_6ms
                .byte CmdSustainRelease, Sustain_Vol10+Release_6ms
                .byte CmdWave, SawtoothStart
                .byte CmdFrequencyHigh, 18
                .byte CmdFrequencyLow, 209
                .byte CmdDelay, 5
                .byte CmdWave, SawtoothEnd

                .byte CmdAttackDecay, Attack_2ms+Decay_6ms
                .byte CmdSustainRelease, Sustain_Vol10+Release_6ms
                .byte CmdWave, SawtoothStart
                .byte CmdFrequencyHigh, 22
                .byte CmdFrequencyLow, 96
                .byte CmdDelay, 5
                .byte CmdWave, SawtoothEnd
                .byte CmdEnd
soundFiringHigh: .byte >soundFiring
soundFiringLow:  .byte <soundFiring

// --------------------------------------------------------

soundExplosion: .byte CmdWave, NoiseEnd
                .byte CmdAttackDecay, Attack_38ms+Decay_114ms
                .byte CmdSustainRelease, Sustain_Vol10+Release_300ms
                .byte CmdFrequencyHigh, 21
                .byte CmdFrequencyLow, 31
                .byte CmdWave, NoiseStart
                .byte CmdDelay, 20
                .byte CmdWave, NoiseEnd
                .byte CmdEnd
soundExplosionHigh: .byte >soundExplosion
soundExplosionLow:  .byte <soundExplosion

// --------------------------------------------------------

soundPickup:    .byte CmdAttackDecay, Attack_2ms+Decay_6ms
                .byte CmdSustainRelease, Sustain_Vol10+Release_6ms
                .byte CmdFrequencyHigh, 84
                .byte CmdFrequencyLow, 125
                .byte CmdWave, SawtoothStart
                .byte CmdDelay, 5
                .byte CmdWave, SawtoothEnd

                .byte CmdAttackDecay, Attack_2ms+Decay_6ms
                .byte CmdSustainRelease, Sustain_Vol10+Release_300ms
                .byte CmdFrequencyHigh, 100
                .byte CmdFrequencyLow, 121
                .byte CmdWave, SawtoothStart
                .byte CmdDelay, 5
                .byte CmdWave, SawtoothEnd
                .byte CmdEnd
soundPickupHigh: .byte >soundPickup
soundPickupLow:  .byte <soundPickup

// --------------------------------------------------------

soundEnding:    .byte CmdPulseWidthHigh, 8
                .byte CmdPulseWidthLow, 128
                .byte CmdFrequencyHigh, 56
                .byte CmdFrequencyLow, 99

                .byte CmdAttackDecay, Attack_2ms+Decay_6ms
                .byte CmdSustainRelease, Sustain_Vol10+Release_6ms
                .byte CmdWave, PulseStart
                .byte CmdDelay, 5
                .byte CmdWave, PulseEnd

                .byte CmdDelay, 1

                .byte CmdAttackDecay, Attack_2ms+Decay_6ms
                .byte CmdSustainRelease, Sustain_Vol10+Release_750ms
                .byte CmdWave, PulseStart
                .byte CmdDelay, 30
                .byte CmdWave, PulseEnd
                .byte CmdEnd
soundEndingHigh: .byte >soundEnding
soundEndingLow:  .byte <soundEnding

//===============================================================================
// Macros/Subroutines

libSoundInit: {
        // Clear all the SID registers
        ldx #0
        lda #0
loop1:  sta FRELO1,X
        inx
        cpx #$19
        bcc loop1

        ldx #0
        lda #0
loop2:  sta FRELO2,X
        inx
        cpx #$19
        bcc loop2

        ldx #0
        lda #0
loop3:  sta FRELO3,X
        inx
        cpx #$19
        bcc loop3

        // Volume & Filter Select
        lda #15
        sta SIGVOL

        rts
}
//===============================================================================

.macro LIBSOUND_PLAY_VAA(voice, ptrh, ptrl) {
                // /1 = Voice                   (Value)
                // /2 = Command Buffer Ptr High (Address)
                // /3 = Command Buffer Ptr Low  (Address)

        ldx #voice

        lda ptrh
        sta soundVoiceCmdPtrHigh,X

        lda ptrl
        sta soundVoiceCmdPtrLow,X

        lda #True
        sta soundVoiceActive,X

        lda #0
        sta soundVoiceCmdIndex,X

        }


//===============================================================================

libSoundUpdate:

        ldx #0
lSULoop:
        lda soundVoiceActive,X
        bne lSUActive
        jmp lSUDone
lSUActive:
        lda soundVoiceDelay,X
        beq lSUProcess
        dec soundVoiceDelay,X
        jmp lSUDone
lSUProcess:

        lda soundVoiceCmdPtrLow,X // load low address byte
        sta ZeroPageLow

        lda soundVoiceCmdPtrHigh,X // load high address byte
        sta ZeroPageHigh

        ldy soundVoiceCmdIndex,X // load x position into Y register
        lda (ZeroPageLow),Y     // load the command

        
lSUProcessLoop:
        // process the command
        LIBSOUND_PROCESSWAVE()
        LIBSOUND_PROCESSATTACKDECAY()
        LIBSOUND_PROCESSSUSTAINRELEASE()
        LIBSOUND_PROCESSFREQUENCYHIGH()
        LIBSOUND_PROCESSFREQUENCYLOW()
        LIBSOUND_PROCESSPULSEWIDTHHIGH()
        LIBSOUND_PROCESSPULSEWIDTHLOW()
        LIBSOUND_PROCESSDELAY()
        LIBSOUND_PROCESSEND()
        jmp lSUProcessLoop

lSUDone:
        inx
        cpx #3
        beq lSUFinished
        jmp lSULoop
lSUFinished:

        rts

//===============================================================================

.macro LIBSOUND_PROCESSWAVE() {

lSUWave:
        cmp #CmdWave
        bne skip
        inc soundVoiceCmdIndex,X // move to next byte
        ldy soundVoiceCmdIndex,X
        lda (ZeroPageLow),Y
 
        cpx #0
        bne reg2
        sta VCREG1
        jmp regdone
reg2:
        cpx #1
        bne reg3
        sta VCREG2
        jmp regdone
reg3:
        sta VCREG3
regdone:
        inc soundVoiceCmdIndex,X // move to next byte
        ldy soundVoiceCmdIndex,X
        lda (ZeroPageLow),Y
skip:
        }

//===============================================================================

.macro LIBSOUND_PROCESSATTACKDECAY() {
        
lSUAttackDecay:
        cmp #CmdAttackDecay
        bne skip
        inc soundVoiceCmdIndex,X // move to next byte
        ldy soundVoiceCmdIndex,X
        lda (ZeroPageLow),Y

        cpx #0
        bne reg2
        sta ATDCY1
        jmp regdone
reg2:
        cpx #1
        bne reg3
        sta ATDCY2
        jmp regdone
reg3:
        sta ATDCY3
regdone:
        inc soundVoiceCmdIndex,X // move to next byte
        ldy soundVoiceCmdIndex,X
        lda (ZeroPageLow),Y
skip:
        }

//===============================================================================

.macro LIBSOUND_PROCESSSUSTAINRELEASE() {
        
lSUSustainRelease:
        cmp #CmdSustainRelease
        bne skip
        inc soundVoiceCmdIndex,X // move to next byte
        ldy soundVoiceCmdIndex,X
        lda (ZeroPageLow),Y
        
        cpx #0
        bne reg2
        sta SUREL1
        jmp regdone
reg2:
        cpx #1
        bne reg3
        sta SUREL2
        jmp regdone
reg3:
        sta SUREL3
regdone:
        inc soundVoiceCmdIndex,X // move to next byte
        ldy soundVoiceCmdIndex,X
        lda (ZeroPageLow),Y
skip:
        }

//===============================================================================

.macro LIBSOUND_PROCESSFREQUENCYHIGH() {
        
lSUFrequencyHigh:
        cmp #CmdFrequencyHigh
        bne skip
        inc soundVoiceCmdIndex,X // move to next byte
        ldy soundVoiceCmdIndex,X
        lda (ZeroPageLow),Y

        cpx #0
        bne reg2
        sta FREHI1
        jmp regdone
reg2:
        cpx #1
        bne reg3
        sta FREHI2
        jmp regdone
reg3:
        sta FREHI3
regdone:
        inc soundVoiceCmdIndex,X // move to next byte
        ldy soundVoiceCmdIndex,X
        lda (ZeroPageLow),Y
skip:
        }

//===============================================================================

.macro LIBSOUND_PROCESSFREQUENCYLOW() {
        
lSUFrequencyLow:
        cmp #CmdFrequencyLow
        bne skip
        inc soundVoiceCmdIndex,X // move to next byte
        ldy soundVoiceCmdIndex,X
        lda (ZeroPageLow),Y
        
        cpx #0
        bne reg2
        sta FRELO1
        jmp regdone
reg2:
        cpx #1
        bne reg3
        sta FRELO2
        jmp regdone
reg3:
        sta FRELO3
regdone:
        inc soundVoiceCmdIndex,X // move to next byte
        ldy soundVoiceCmdIndex,X
        lda (ZeroPageLow),Y
skip:
        }

//===============================================================================

.macro LIBSOUND_PROCESSPULSEWIDTHHIGH() {
        
lSUPulseWidthHigh:
        cmp #CmdPulseWidthHigh
        bne skip
        inc soundVoiceCmdIndex,X // move to next byte
        ldy soundVoiceCmdIndex,X
        lda (ZeroPageLow),Y

        cpx #0
        bne reg2
        sta PWHI1
        jmp regdone
reg2:
        cpx #1
        bne reg3
        sta PWHI2
        jmp regdone
reg3:
        sta PWHI3
regdone:
        inc soundVoiceCmdIndex,X // move to next byte
        ldy soundVoiceCmdIndex,X
        lda (ZeroPageLow),Y
skip:
        }

//===============================================================================

.macro LIBSOUND_PROCESSPULSEWIDTHLOW() {
        
lSUPulseWidthLow:
        cmp #CmdPulseWidthLow
        bne skip
        inc soundVoiceCmdIndex,X // move to next byte
        ldy soundVoiceCmdIndex,X
        lda (ZeroPageLow),Y
        
        cpx #0
        bne reg2
        sta PWLO1
        jmp regdone
reg2:
        cpx #1
        bne reg3
        sta PWLO2
        jmp regdone
reg3:
        sta PWLO3
regdone:
        inc soundVoiceCmdIndex,X // move to next byte
        ldy soundVoiceCmdIndex,X
        lda (ZeroPageLow),Y
skip:
        }

//===============================================================================

.macro LIBSOUND_PROCESSDELAY() {

lSUDelay:
        cmp #CmdDelay
        bne skip
        inc soundVoiceCmdIndex,X // move to next byte
        ldy soundVoiceCmdIndex,X
        lda (ZeroPageLow),Y
        sta soundVoiceDelay,X
        inc soundVoiceCmdIndex,X // move to next byte
        ldy soundVoiceCmdIndex,X
        lda (ZeroPageLow),Y
        jmp lSUDone
skip:
        }

//===============================================================================

.macro LIBSOUND_PROCESSEND() {
     
lSUEnd:
        cmp #CmdEnd
        bne skip
        lda #False
        sta soundVoiceActive,X
        sta soundVoiceCmdIndex,X
        jmp lSUDone
skip:
        }



