%zeropage basicsafe
%import prog16
%import textio
%import verafx

main{
    sub start(){
        sys.set_irqd() ; currently cx16's Interrupt Handlers don't work with 16-bit mode, so we have to disable them
        prog16.go_16()
        
        uword[2] million
        million[0]=verafx.mult(1000,1000)
        million[1]=cx16.r0

        uword[2] number

        math16.add(number, million[0],million[1], 65000,0)

        txt.print_uwhex(million[1],true)
        txt.print_uwhex(million[0],false)
        txt.chrout('+')
        txt.print_uwhex(65000,true)
        txt.chrout('=')
        txt.print_uwhex(number[1],true)
        txt.print_uwhex(number[0],false)

        prog16.exit_16()
        sys.clear_irqd()
        sys.exit(0)
    }
}