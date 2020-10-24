#!/bin/bash
i=1
cat $1 | while read input
do 
    echo input: $input
    lli output.ll $input > output/t$i
    let i=$i+1
done
