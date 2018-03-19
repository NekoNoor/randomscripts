#!/usr/bin/fish
# Fish script for building multiple retroarch cores
function build_core
    cd ./$argv[1];
    make clean;
    make platform=$argv[2];
    cp ./$argv[1]_libretro_$argv[2].a ../RetroArch/libretro_$argv[2].a;
    cd ../RetroArch/;
    make clean -f Makefile.$argv[2];
    make -f Makefile.$argv[2];
    cp ./retroarch_$argv[2].nro ./out/libretro_"$argv[1]".nro;
    cd ../;
end;

build_core snes9x2010 switch;
build_core vba_next switch;
build_core fceumm switch;
