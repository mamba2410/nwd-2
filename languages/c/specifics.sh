#!/bin/sh

language_home="$1/languages/c"
project_name="$2"
do_init=$3

cp $language_home/Makefile ./bin/Makefile
cp $language_home/build_number.mak ./bin/metadata/build_number.mak

if [ $do_init = 1 ]; then
	cp $language_home/init.c ./src/$project_name.c
	cp $language_home/init.h ./include/$project_name.h
fi
