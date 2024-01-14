# Prog16
This Prog8 library adds a programmic interface for using 16 bit functionality of 65c816. Despite its name, it's main use is for 32bit integer arithmetics.

Keep in mind, that this library is very recent and undertested and things such as function names, function arguments etc. may be a subject of change.

## Downloading
Unless you want to send commits and help develop this library, you only really need to download the [`prog16.p8`](./prog16.p8) file, which you can do through github's UI 

![download button](./docs/.rsc/dlbutton.png)

## Usage 
Firstly, when you want to use prog16 in your project, you'll need to place `prog16.p8` file in the same folder as rest of your source files. Then, you'll need to write `%import prog16` at the top of your file next to other directives:

![import directive](./docs/.rsc/import%20directive.png)

Please look into [`docs`](./docs/) folder for a reference on how to use this library. You can also look at [some examples](./examples/)