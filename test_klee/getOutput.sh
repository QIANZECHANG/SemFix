#!/bin/bash
j=1
mkdir ktest_output
clang -I ../klee/include/ -emit-llvm -c -g program.c
gcc -I ../klee/include/ -L ../build/lib/ program.c -lkleeRuntest
cat input_test.txt | while read input
do    
    klee -solver-backend=z3 program.bc $input
    expected=`echo $input | awk -F " " '{print $NF}'`
    for file in `ls klee-last`
    do
	if [[ "${file##*.}" = "ktest" ]];
        then
            KTEST_FILE=klee-last/$file ./a.out $input
            if [[ `echo $?` = $expected ]];
            then
                ktest-tool klee-last/$file > ktest_output/test$j
            fi
        fi
    done
    let j=$j+1 
done

