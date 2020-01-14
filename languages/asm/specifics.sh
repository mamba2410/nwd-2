#!/bin/sh

language_home="$1/languages/asm"
project_name="$2"
do_init=$3

cp $language_home/Makefile ./bin/Makefile
cp $language_home/build_number.mak ./bin/metadata/build_number.mak

project_name_upper=$(echo $project_name | tr '[:lower:]' '[:upper:]')
project_name_upper=$(echo $project_name_upper | sed 's/[^[:alpha:]]/\_/g')

if [ $do_init = 1 ]; then
	cp $language_home/init.S ./src/$project_name.S
	cp $language_home/init.h ./include/$project_name.h

	sed -i "s/PROJECT_NAME/$project_name/g" ./src/$project_name.S
	sed -i "s/PROJECT_NAME/$project_name_upper/g" ./include/$project_name.h

fi
