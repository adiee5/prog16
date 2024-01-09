# math16{

This block provides routines for doing operations on 32-bit integers. This is the star of the entire library. 

Since prog8 doesn't provide (and probably won't) a datatype for 32-bit integers, this API expects you to use `uword[2]` datatype. ***Don't use `@sliced` flag when declaring a variable!*** Both signed and unsigned use the same datatype here, and you just need to use a correct function depending on whenever you want to work with signed or unsigned numbers (most functions however are the same for both)

Within all of functions in this scope, there's a convention, according to which, the first argument of the function is a variable, that's going to hold the results. This was done, so that the results won't be statically bound to the function nor you get some kind of clunky syntax.

## add(uword[2] result, uword al, uword ah, uword bl, uword bh)
adds `a` and `b`

Example:

```
uword[2] million
million[0] = verafx.mult(1000,1000)
million[1] = cx16.r0

uword[2] number

math16.add(number, million[0],million[1], 65000,0) ;1000000 + 65000 = 1065000

```

## minus(uword[2] result, uword al, uword ah, uword bl, uword bh)
Subtracts `b` from `a` (`a-b`). Follows the same syntax as `add()`.

# }