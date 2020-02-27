#!/bin/sh

language_home="$1/languages/f90"
project_name="$2"
do_init=$3

cp $language_home/Makefile ./bin/Makefile
cp $language_home/build_number.mak ./bin/metadata/build_number.mak

rm -r ./include
mkdir ./data
mkdir ./bin/modules

project_name_upper=$(echo $project_name | tr '[:lower:]' '[:upper:]')
project_name_upper=$(echo $project_name_upper | sed 's/[^[:alpha:]]/\_/g')

if [ $do_init = 1 ]; then
	cp $language_home/init.f90 ./src/$project_name.f90

	sed -i "s/PROJECT_NAME/$project_name/g" ./src/$project_name.f90

fi
