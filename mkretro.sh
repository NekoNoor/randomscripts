#!/bin/bash
# Bash script for building multiple retroarch cores
build_core () {
    cd ./$1;
    make clean;
    make platform=$2;
    cp ./"$1"_libretro_$2.a ../RetroArch/libretro_$2.a;
    cd ../RetroArch/;
    make clean -f Makefile.$2;
    make -f Makefile.$2;
    cp ./retroarch_$2.nro ./out/libretro_"$1".nro;
    cd ../;
}

build_core snes9x2010 switch;
build_core vba_next switch;
build_core fceumm switch;
