#!/bin/bash
#automated15puzzletesting.sh

echo "" > testresults.txt

MOVES=5
while [ $MOVES -le $1 ]
do
	ITERATIONS=0
	printf "\n%s" "--------------NEXT ITERATION: $MOVES moves------------------"
	echo "--------------NEXT ITERATION: $MOVES moves------------------" >> testresults.txt
	echo "" > iteration.txt
	while [ $ITERATIONS -lt 10 ]
	do
		./improved15script $MOVES 60 | ./outputtrim.sh >> iteration.txt
		let ITERATIONS=ITERATIONS+1
		printf "$ITERATIONS"
	done
	cat iteration.txt >> testresults.txt
	let MOVES=MOVES+1
done
