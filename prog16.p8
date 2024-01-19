%import textio

prog16{ ; general routines for handling 16-bit stuff
    sub go_16(){
        if not checkcpu(){
            txt.print("\ryour computer requires a 65c816 cpu in order to run this program!\rpress enter to quit:")
            void txt.waitkey()
            sys.clear_irqd()
            sys.exit(1)
        }
        go_16_quick()
    }
    asmsub checkcpu() ->bool @A{
        %asm {{
            php
            clv
            .byte $e2, $ea ; sep #$ea; should be interpreted as 2 NOPs by 65c02. 65c816 will set the Negative flag.
                                     ; According to pagetable.com, Non-WDC CPUs should also interpret it as NOPs or at the very least be unharmful
            bvc +
            lda #1
            plp
            rts
+           lda #0
            plp
            rts
        }}
    }
    inline asmsub exit_16(){
        %asm {{
            sec
            .byte $FB ; XCE
        }}
    }
    inline asmsub go_16_quick(){
        %asm {{
            clc
            .byte $FB ; XCE
        }}
    }
    %asm{{
extend_A    .macro
            .byte $c2, $20 ; rep #$20
            .endmacro

revert_A    .macro
            .byte $e2, $20 ; sep #$20
            .endmacro

exchange_B_A    .macro
            .byte $eb ; xba
            .endmacro
    }}
}

fast16{ ; 16 bit routines for uwords
    asmsub add(uword a @R0, uword b @R2 ) clobbers(A) -> uword @R4{
        %asm{{
            #p8b_prog16.extend_A
            lda cx16.r0
            clc
            adc cx16.r2
            sta cx16.r4
            #p8b_prog16.revert_A
            rts
        }}
    }

    asmsub minus(uword a @R0, uword b @R2 ) clobbers(A) -> uword @R4{
        %asm{{
            #p8b_prog16.extend_A
            lda cx16.r0
            sec
            sbc cx16.r2
            sta cx16.r4
            #p8b_prog16.revert_A
            rts
        }}
    }
}

math16{ ;int32 math here
    asmsub add(uword result @R4, uword al @R0, uword ah @R1, uword bl @R2, uword bh @R3 ) clobbers(A,Y){
        %asm{{
            #p8b_prog16.extend_A
            lda cx16.r0
            clc
            adc cx16.r2
            sta (cx16.r4)
            lda cx16.r1
            adc cx16.r3
            ldy #2
            sta (cx16.r4),y
            #p8b_prog16.revert_A
            rts
        }}
    }

    asmsub minus(uword result @R4, uword al @R0, uword ah @R1, uword bl @R2, uword bh @R3 ) clobbers(A,Y){
        %asm{{
            #p8b_prog16.extend_A
            lda cx16.r0
            sec
            sbc cx16.r2
            sta (cx16.r4)
            lda cx16.r1
            sbc cx16.r3
            ldy #2
            sta (cx16.r4),y
            #p8b_prog16.revert_A
            rts
        }}
    }
}