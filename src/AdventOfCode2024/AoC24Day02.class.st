Class {
	#name : #AoC24Day02,
	#superclass : #Object,
	#category : 'AdventOfCode2024'
}

{ #category : #testing }
AoC24Day02 class >> isSafe: anArray [

	^ self isSafe: anArray maxErrors: 0
]

{ #category : #testing }
AoC24Day02 class >> isSafe: anArray maxErrors: limit [

	2 to: anArray size do: [ :idx |
		(#( 1 2 3 ) includes: (anArray at: idx - 1) - (anArray at: idx))
			ifFalse: [
				^ limit > 0
					  ifTrue: [
						  (self isSafe: (anArray copyWithoutIndex: idx - 1) maxErrors: limit - 1) or: [
							  self isSafe: (anArray copyWithoutIndex: idx) maxErrors: limit - 1 ] ]
					  ifFalse: [ false ] ] ].
	^ true
]

{ #category : #examples }
AoC24Day02 class >> part1 [

	^ self part1: AoC24 inputDay02
]

{ #category : #examples }
AoC24Day02 class >> part1: inputStream [

	| lines |
	lines := inputStream linesCollect: [ :each | each asIntegers ].
	^ (lines select: [ :each |
		   (self isSafe: each) or: [ self isSafe: each reversed ] ]) size
]

{ #category : #examples }
AoC24Day02 class >> part2 [

	^ self part2: AoC24 inputDay02
]

{ #category : #examples }
AoC24Day02 class >> part2: inputStream [

	| lines |
	lines := inputStream linesCollect: [ :each | each asIntegers ].
	^ (lines select: [ :each |
		   (self isSafe: each maxErrors: 1) or: [ self isSafe: each reversed maxErrors: 1 ] ]) size
]
