# New Working Directory 2

This is a script designed to help create new projects.

Designed around C but intended to support C, C++ and Fortran 90 out of the box.
LaTeX is also included but that might be iffy.

Current default languages:
- C (`c`)
- C++ (`cpp`)
- Assembly (`asm`)
- C with assembly (`c+asm`)
- Fortran-90 (`f90`)
- Latex (`latex`) (Note: probably buggy)
- Arduino (almost the same as for the arduino ide) (`arduino`)
- Raw arduino (atmel chips with raw c) (`arduino-raw`)
- Rust (`rust`)

It should be highly customisable, and adding new languages should be as simple as adding a new directory in the `languages/` directory.
Editing the directory path and adding new licenses should also be very simple to do.

## Installation
Place the repo in `$XDG_DATA_HOME/nwd` and move/symlink the script `nwd` to wherever you like, preferably somewhere in your `$PATH` variable.
```
git clone https://github.com/mamba2410/nwd-2
mv nwd-2 $XDG_DATA_HOME/nwd
```
 If your `$XDG_DATA_HOME` is not set, the usual place for it is `~/.local/share/`

There are plans to be able to install this with xbps in the future.
I most likely won't add any other installation support past manually installing it and with xbps.

