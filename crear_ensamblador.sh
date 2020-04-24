#!/bin/bash
#Programa para automatizar el proceso de ensamblaje

ARCHIVO_ASM=$1

if [ ! -z "$ARCHIVO_ASM" ]; then
	nasm -f elf $ARCHIVO_ASM
	ARCHIVO_NOEXTENSION=$(echo "$ARCHIVO_ASM" | cut -f 1 -d '.')
	EXTENSION=".o"
	ARCHIVO_ENLACE="$ARCHIVO_NOEXTENSION$EXTENSION"
	ld -m elf_i386 -s -o $ARCHIVO_NOEXTENSION $ARCHIVO_ENLACE 
else
	echo "No se han ingresado parametros"
fi
