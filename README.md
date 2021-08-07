# MSX/MSX2/MSX2+ Project Template for Assembly Programming

**NOTE**: This repository is no longer actively maintained; it is here for people who prefer to work with [wla-dx][wladx]. I have created [a new template](https://github.com/georgjz/msx-cartridge-project-template) that uses [ASxxxx](https://shop-pdp.net/ashtml/asxxxx.php) instead. I think ASxxxx is the superior assembler/linker to wla-dx, so YMMV.

This is a simple project template for creating a program on a [MSX][msxwiki] cartridge.

Find more informations about MSX cartridges on the [MSX Wiki][cartwiki].

Here is the list of tools you need to use this repository:

* [CMake][cmake]
* [make][make]
* [wla-dx][wladx]
* [Glasgow Haskell Compiler][ghc]

## Usage

Simple use `git` to clone this repository:

```Bash
git clone https://github.com/georgjz/msx-cart-project-template.git msxcart
cd msxcart
cmake -S . -Bbuild
cmake --build build
```

This will create a ROM file called `msx-cartridge-template` in the `build/` directory. You can load this ROM into a MSX emulator. You can change the ROM file name by modifying line 6 of the Makefile.

The resulting ROM file will be a simple 16KB ROM. To change this, modify `src/include/MemoryMap.inc` to fit your needs.

Refer to `CMakeLists.txt` and `src/CMakeLists.txt` to see how to add additional sources and include directories.

After all source files are assembled by wla-z80, a simple Haskell script found in `tools/generatelinkfile.hs` will generate the necessary link file to link the final ROM.

## Example Code

The example code is very simple at the moment. I plan to add something a bit more complex in the future. The code in `src/Main.s` will simply call the `BEEP` (`$00c0`) function from the [MSX BIOS][msxbios].

You can test it with [OpenMSX][openmsx]:

```Bash
openmsx -cart build/msx-cartridge-template
```

After the loading screen, you should hear a short beep sound. After that, the machine will continue with it's normal start up routine.

## Contribution

I'm a total newbie when it comes to MSX development, so any kind of feedback, bug reports, pull requests, etc. is highly appreciated and encouraged!

## Resources and Links

Here's a list of useful links to resources about MSX programming:

* The [MSX Wiki][msxwiki] has tons of informations, down to the memory maps of individual MSX machines.
* [Néstor Soriano aka Konamiman][konamiman] has several repositories relating to MSX and Z80 programming, including this [excellent MSX2 Technical Handbook][msxoverview] how the MSX works.
* A complete list of all the [functions in the MSX BIOS][msxbios].

[msxwiki]: https://www.msx.org/wiki/
[cartwiki]: https://www.msx.org/wiki/Develop_a_program_in_cartridge_ROM
[msxbios]: http://map.grauw.nl/resources/msxbios.php
[konamiman]: https://github.com/Konamiman
[msxoverview]: https://github.com/Konamiman/MSX2-Technical-Handbook
[make]: https://www.gnu.org/software/make/
[cmake]: https://cmake.org
[wladx]: http://www.villehelin.com/wla.html
[ghc]: https://www.haskell.org/ghc/
[openmsx]: http://openmsx.org