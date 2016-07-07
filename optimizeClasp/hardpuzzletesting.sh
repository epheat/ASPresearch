#!/bin/bash
# hardpuzzletesting.sh
# usage: ./hardpuzzletesting.sh [n] [k] [t] [config-file]
# n=number of trials
# k=number of moves from solution (35+ for hard puzzles)
# t=timeout (at least 60s for hard puzzles!)

if [ "$#" -lt 4 ] ;
then
	echo "Usage: $0 [n] [k] [t] [config]" >&2
	exit 1
fi

ITERATIONS=0
MOVES=$2
echo "" > hardpuzzletestingresults.txt
while [ $ITERATIONS -lt $1 ]
do
	./improved15script $MOVES $3 $4 | ./outputtrim.sh >> hardpuzzletestingresults.txt
	let ITERATIONS=ITERATIONS+1
	printf "$ITERATIONS"
done

python timetrim.py hardpuzzletestingresults.txt final.txt
