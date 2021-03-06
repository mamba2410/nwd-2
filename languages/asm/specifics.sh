#!/bin/sh

language_home="$1/languages/asm"
common_home="$1/common"
project_name="$2"
do_init=$3

cp $common_home/Makefile ./Makefile
cp $common_home/build_number.mak ./build/build_number.mak

patch -sl -i $language_home/make.patch

project_name_upper=$(echo $project_name | tr '[:lower:]' '[:upper:]')
project_name_upper=$(echo $project_name_upper | sed 's/[^[:alpha:]]/\_/g')

if [ $do_init = 1 ]; then
	cp $language_home/init.S ./src/$project_name.S
	cp $language_home/init.h ./include/$project_name.h

	sed -i "s/PROJECT_NAME/$project_name/g" ./src/$project_name.S
	sed -i "s/PROJECT_NAME/$project_name_upper/g" ./include/$project_name.h

fi
