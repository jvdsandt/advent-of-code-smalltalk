Class {
	#name : #AoC24Day10,
	#superclass : #Object,
	#category : 'AdventOfCode2024'
}

{ #category : #examples }
AoC24Day10 class >> allPeaksFrom: point in: matrix [

	| val dirs set |
	
	val := matrix at: point.
	val = 9
		ifTrue: [ ^ Set with: point ].
	
	dirs := { -1 @ 0. 0 @ -1. 1 @ 0. 0 @ 1 }.
	set := Set new.
	dirs do: [ :eachDir |
		| newPoint |
		newPoint := point + eachDir.
		((matrix isInside: newPoint) and: [ (matrix at: newPoint) = (val+1) ])
			ifTrue: [ set addAll: (self allPeaksFrom: newPoint in: matrix) ] ].
	^ set
]

{ #category : #examples }
AoC24Day10 class >> countAllPathsFrom: point in: matrix [

	| val cnt dirs |
	
	val := matrix at: point.
	val = 9
		ifTrue: [ ^ 1 ].
		
	dirs := { -1 @ 0. 0 @ -1. 1 @ 0. 0 @ 1 }.
	cnt := 0.
	dirs do: [ :eachDir |
		| newPoint |
		newPoint := point + eachDir.
		((matrix isInside: newPoint) and: [ (matrix at: newPoint) = (val+1) ])
			ifTrue: [ cnt := cnt + (self countAllPathsFrom: newPoint in: matrix) ] ].
	^ cnt
]

{ #category : #examples }
AoC24Day10 class >> part1 [

	^ AoC24 inputDay10 readStreamDo: [ :s | self part1: s ]
]

{ #category : #examples }
AoC24Day10 class >> part1: stream [

	| matrix startList sum |
	
	matrix := AoCMatrix from: stream.
	matrix convertToInteger.
	startList := matrix findAllPos: 0.
	
	sum := 0.
	startList do: [ :each |
		sum := sum + (self allPeaksFrom: each in: matrix) size ].
	^ sum
]

{ #category : #examples }
AoC24Day10 class >> part2 [

	^ AoC24 inputDay10 readStreamDo: [ :s | self part2: s ]
]

{ #category : #examples }
AoC24Day10 class >> part2: stream [

	| matrix startList sum |
	
	matrix := AoCMatrix from: stream.
	matrix convertToInteger.
	startList := matrix findAllPos: 0.
	
	sum := 0.
	startList do: [ :each |
		sum := sum + (self countAllPathsFrom: each in: matrix) ].
	^ sum
]
