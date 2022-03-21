#!/bin/bash

#set -x
BUILD_FOLDER=./build
FOLDER=./

mkdir "$BUILD_FOLDER" 


TEST_FOLDER=./Tests
JAVAFILE=$FOLDER/Main.java
CPPFILE=$FOLDER/main.cpp

if [ -f "$JAVAFILE" ] || [ -f "$CPPFILE" ]; then
    # echo "Compilando..."
    if [ -f "$CPPFILE" ]; then
        echo "Realizado en C++"
        if ! g++ $CPPFILE -o $BUILD_FOLDER/main.out --std=c++11; then
        echo -e "\e[31mERROR en compilacion\e[0m"
        continue
        fi
    else 
        echo "Realizado en JAVA"
        if ! javac $JAVAFILE -d $BUILD_FOLDER -sourcepath $FOLDER; then
        echo -e "\e[31mERROR en compilacion\e[0m"
        continue
        fi
    fi
    # echo "Compilado terminado"

    # borrando resultados anteriores
    find $TEST_FOLDER -name "*.own.txt" -type f -delete

    # echo "Empezando las pruebas"
    du $TEST_FOLDER/*.in.txt | sort -g |
    while read filesize filename; do
        Ts="$(date +%s)"
        Tmm="$(date +%s%3N)"
        if [ -f "$CPPFILE" ]; then
        $BUILD_FOLDER/main.out < $filename > ${filename/in/own}
        else 
        java Main < $filename > ${filename/in/own}
        fi
        Ts="$(($(date +%s)-Ts))"
        Tmm="$(($(date +%s%3N)-Tmm))"
        echo "$filename : $Ts segundos | $Tmm milisegundos"
        diff -Z -B ${filename/in/out} ${filename/in/own} > /dev/null
        if [ $? -eq 0 ]
        then
        echo -e "\e[32m${filename} - OK\e[0m"
        else
        echo -e "\e[31m${filename} - FAIL\e[0m"
        exit 1 # terminate and indicate error
        fi
    done
    # borra todo compilado de java
    find . -name "*.class" -type f -delete
fi