# MSX/MSX2/MSX2+ Project Template for Assembly Programming

This is a simple project template for creating a program on a [MSX][msxwiki] cartridge. 

Find more informations about MSX cartridges on the [MSX Wiki][cartwiki].

Here is the list of tools you need to use this repository:

* [make][make]
* [wla-dx][wladx]
* [Python][py]

## Usage

Simple use `git` to clone this repository:
```
git clone https://github.com/georgjz/msx-cart-project-template.git msxcart 
cd msxcart 
make 
```

This will create a ROM file called `demo.rom` in the `build/` directory. You can load this ROM into a MSX emulator. You can change the ROM file name by modifying line 6 of the Makefile.

The resulting ROM file will be a simple 16KB ROM. To change this, modify `src/include/MemoryMap.inc` to fit your needs. 

The Makefile will assemble all source files placed in the `src/` directory. Source files can be placed at arbitrary directory depth in `src/`.

It will also automatically add all files that end with `*.inc` to the assembler's include file list. For example, if you move `src/include/MemoryMap.inc` to `src/others/include/MemoryMap.inc`, it will still work (there is a small issue; see below).

After all source files are assembled by wla-z80, a simple Python script called `genmemmap.py` will generate a linker script `MemoryMap.cfg` for the linker wlalink to use.

## Example Code

The example code is very simple at the moment. I plan to add something a bit more complex in the future. The code in `src/Main.s` will simply call the `BEEP` (`$00c0`) function from the [MSX BIOS][msxbios]. 

## Known Issues 

The way the Makefile works, it will only detect changes to source files (ending with `*.s`), but not to include files (ending with `*.inc`).

So if you update only include files, you'll need to touch any of the source files (e.g., `touch src/Main.s`), that uses the said include file.

Alternatively, you can simply clean the project and rebuild it completely with `make clean && make`.

## Resources and Links 

Here's a list of useful links to resources about MSX programming:

* The [MSX Wiki][msxwiki] has tons of informations, down to the memory maps of individual MSX machines. 
* [Néstor Soriano aka Konamiman][konamiman] has several repositories relating to MSX and Z80 programming, including this [excellent MSX2 Technical Handbook][msxoverview] how the MSX works.
* A complete list of all the [functions in the MSX BIOS][msxbios].

[msxwiki]: https://www.msx.org/wiki/
[msxbios]: http://map.grauw.nl/resources/msxbios.php
[konamiman]: https://github.com/Konamiman
[msxoverview]: https://github.com/Konamiman/MSX2-Technical-Handbook
[make]: https://www.gnu.org/software/make/
[wladx]: http://www.villehelin.com/wla.html
[py]: https://www.python.org