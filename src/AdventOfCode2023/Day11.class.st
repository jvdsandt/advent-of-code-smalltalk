Class {
	#name : #Day11,
	#superclass : #Object,
	#category : #AdventOfCode2023
}

{ #category : #examples }
Day11 class >> calcDistances: delta [

 	| points maxx maxy emptyCols emptyRows colDeltas rowDeltas sum |

	points := OrderedCollection new.
	AOC2023 baseDirectory / 'day11_input.txt' readStreamDo: [ :stream |
		| y |
		y := 1.
		[ stream atEnd ] whileFalse: [ 
			| line |
			line := stream nextLine.
			line doWithIndex: [ :ch :x |
				ch = $# 
					ifTrue: [ points add: (x @ y) ] ].
			y := y + 1 ] ].
		
	maxx := points max: [ :each | each x ].
	maxy := points max: [ :each | each y ].
	
	emptyCols := OrderedCollection new
		addAll: (1 to: maxx);
		removeAll: (points collect: [ :p | p x ]) asSet; 
		yourself.
	emptyRows := OrderedCollection new
		addAll: (1 to: maxy);
		removeAll: (points collect: [ :p | p y ]) asSet; 
		yourself.	
		
	colDeltas := Array new: maxx withAll: 0.
	rowDeltas := Array new: maxy withAll: 0.
	
	emptyCols do: [ :eachNr |
		eachNr to: maxx do: [ :idx | colDeltas at: idx put: (colDeltas at: idx) + delta ] ].
	emptyRows do: [ :eachNr |
		eachNr to: maxy do: [ :idx | rowDeltas at: idx put: (rowDeltas at: idx) + delta ] ].

	points := points collect: [ :each |(each x + (colDeltas at: each x)) @ (each y + (rowDeltas at: each y)) ].
	
	sum := 0.
	points doWithIndex: [ :p1 :i1 |
		i1 + 1 to: points size do: [ :i2 |
			| dx dy |
			dx := (p1 x - (points at: i2) x) abs.
			dy := (p1 y - (points at: i2) y) abs.
			sum := sum + dx + dy ] ].
	
	^ sum
]

{ #category : #examples }
Day11 class >> part1 [
	"self part1"

	^ self calcDistances: 1
]

{ #category : #examples }
Day11 class >> part2 [
	"self part2"

 	^ self calcDistances: 999999
]
