#!/usr/bin/python
#15puzzlegenerator.py
#epheat
#usage: python 15puzzlegenerator.py [k]
#This script generates valid 15puzzles solvable in k moves

import sys
from random import randint

if len(sys.argv) != 2:
    print "usage: $ python 15script.py [k]"
    exit()

k = sys.argv[1]
print "%", ("%d moves away from solution" % int(k))

print "#const n=4."
print ("#const moves=%d." % int(k))

print "time(1..moves)."
print "index(1..n)."

#initialize the board
#I'm doing some weird stuff here so that 0 isn't actually used as an index.
n = 4
board = [[0 for x in range(n+1)] for y in range(n+1)]
number = 1
for y in range(4,0,-1):
    for x in range(1,5):
        board[x][y] = number
        number = (number+1)%16

olddirection = 3
xcoord = 4
ycoord = 1


i = 0
while i < int(k):
    
    #generate random move (u/r/d/l) under these conditions:
    #   1. A move cannot be the inverse of the previous move
    #   2. A move cannot take the tile out of bounds
    #   u=0, r=1, d=2, l=3

    direction = randint(0,3)
    
    #generate new directions when it is the opposite direction as last iteration
    while (direction != olddirection) and (direction%2 == olddirection%2):
        direction = randint(0,3)

    if direction == 0:
        #up
        #if this takes the blank tile out of bounds, decrement i and continue
        if ycoord+1 == 5:
            continue
        else:
            board[xcoord][ycoord] = board[xcoord][ycoord+1]
            board[xcoord][ycoord+1] = 0
            ycoord+=1
            print "% up"
    elif direction == 1:
        #right
        #if this takes the blank tile out of bounds, decrement i and continue
        if xcoord+1 == 5:
            continue
        else:
            board[xcoord][ycoord] = board[xcoord+1][ycoord]
            board[xcoord+1][ycoord] = 0
            xcoord+=1
            print "% right"
    elif direction == 2:
        #down
        #if this takes the blank tile out of bounds, decrement i and continue
        if ycoord-1 == 0:
            continue
        else:
            board[xcoord][ycoord] = board[xcoord][ycoord-1]
            board[xcoord][ycoord-1] = 0
            ycoord-=1
            print "% down"
    else:
        #left
        #if this takes the blank tile out of bounds, decrement i and continue
        if xcoord-1 == 0:
            continue
        else:
            board[xcoord][ycoord] = board[xcoord-1][ycoord]
            board[xcoord-1][ycoord] = 0
            xcoord-=1
            print "% left"

    olddirection = direction
    i+=1

for y in range(4,0,-1):
    for x in range(1,5):
        print("init(%d,%d,%d).\t" % (board[x][y],x,y)),
    print

# sources:
#   http://stackoverflow.com/questions/3996904/generate-random-integers-between-0-and-9
#   http://stackoverflow.com/questions/6667201/how-to-define-two-dimensional-array-in-python
#   
#
#
#
