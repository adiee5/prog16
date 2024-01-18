# prog16{

This block contains basic utilities for managing 65c816 features.

## go_16()
Enables the "native" mode of 65c816. Preferably, you should call this function at the beginning of the program, or at the very least before any 16-bit instructions. This routine also has a built-in check, that will terminate the entire program if the device doesn't support 16-bit instructions.

## exit_16()
Goes back to restricted 6502 mode. Always place this function at the end of the `main.start()` before the program quits, so that an OS that expects to be run in Emulation mode won't get confused. 

## checkcpu() -> bool
Returns `true` if the host machine runs on 65c816. Otherwise, returns `false`.

Note: since Prog8 v10.0, There's a function called `cx16.cpu_is_65816()` built in the syslib that does the same thing and it's possible, that it's even faster than `prog16.checkcpu()`.

## go_16_quick()
Quicker version of `go_16()` routine, that switches to native mode immediately and doesn't do any kind of checks. Useful, when you frequently need to switch between emulation and native mode. If you switch to 16-bit mode for the first time in your program, you'd be better of using `go_16()` instead, because it'll prevent users from executing the program on 8-bit only machines.

# }