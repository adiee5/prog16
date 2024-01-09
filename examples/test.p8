%zeropage basicsafe
%import prog16
%import textio

main{
    sub start(){
        txt.print("default: ")
        txt.print_uw(1024+1024)
        sys.set_irqd() ; currently cx16's Interrupt Handlers don't work with 16-bit mode, so we have to disable them
        prog16.go_16()
        txt.print("\r16-bit: ")
        txt.print_uw(fast16.add(1024, 1024))
        prog16.exit_16()
        sys.clear_irqd()
        sys.exit(0)
    }
}