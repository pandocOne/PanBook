#!/bin/bash

declare -A test

test=(
	[a]=A # a
	[b]=B # b
	[c]=`echo C` # c
)

#echo "all: ${test[@]}"
#echo "a: ${test[a]}"
#echo "c: ${test[c]}"

# 获取键
#echo ${!test[@]}

test[d-d]=D

function printArray() {
	arr=$1
	shift
	for key in $@;do
		val="value=\${$arr[$key]}"
		eval $val
		echo "$key:  $value"
	done
}

printArray test ${!test[@]}

e=a
test[a__1122]=A_B

unset test[a__1122]
echo ${!test[@]}