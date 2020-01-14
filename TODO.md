# TODO

- Handle C language
	- Implement makefile (or just copy over from old one)
		- Auto compile/detect submodules? Flag inside the makefile?
		- Add a proper buildinfo file that has build number, version number, date etc
		- Different build number for each end binary?
		- Save build number inside binary somehow?
		- [Log files](https://stackoverflow.com/questions/54933242/how-do-i-make-a-makefile-to-log-both-command-and-its-output-to-a-file)
- Handle C++ language
	- Copy C with small modifications
- Handle Fortran-90 language
	- Copy C with modifications
	- Add new data directories
	- Remove include directory
- Handle asm
- Handle C with asm
- Get this to be installed with xpbs
