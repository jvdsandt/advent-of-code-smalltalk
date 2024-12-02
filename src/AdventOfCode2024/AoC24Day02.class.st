Class {
	#name : 'AoC24Day02',
	#superclass : 'TestCase',
	#category : 'AdventOfCode2024',
	#package : 'AdventOfCode2024'
}

{ #category : 'testing' }
AoC24Day02 class >> isSafeDec: anArray interval: anInterval [

	2 to: anArray size do: [ :idx |
		(anInterval includes: (anArray at: idx-1) - (anArray at: idx))
			ifFalse: [ ^ false ] ].
	^ true
]

{ #category : 'testing' }
AoC24Day02 class >> isSafeDec: anArray interval: anInterval maxErrors: limit [
	"self isSafeDec: #( 8 6 4 4 1 ) interval: #( 1 2 3 ) maxErrors: 1"


	2 to: anArray size do: [ :idx |
		(anInterval includes: (anArray at: idx-1) - (anArray at: idx))
			ifFalse: [ 
				^ limit > 0
					ifTrue: [ (self isSafeDec: (anArray copyWithoutIndex: idx-1) interval: anInterval maxErrors: limit-1) or: [ self isSafeDec: (anArray copyWithoutIndex: idx) interval: anInterval maxErrors: limit-1 ] ]
					ifFalse: [ false ] ] ].
	^ true
]

{ #category : 'testing' }
AoC24Day02 class >> isSafeInc: anArray interval: anInterval [

	2 to: anArray size do: [ :idx |
		(anInterval includes: (anArray at: idx) - (anArray at: idx-1))
			ifFalse: [ ^ false ] ].
	^ true
]

{ #category : 'testing' }
AoC24Day02 class >> isSafeInc: anArray interval: anInterval maxErrors: limit [
	"self isSafeInc: #( 1 2 7 8 9 ) interval: #( 1 2 3 ) maxErrors: 1"

	2 to: anArray size do: [ :idx |
		(anInterval includes: (anArray at: idx) - (anArray at: idx-1))
			ifFalse: [ 
				^ limit > 0
					ifTrue: [ (self isSafeInc: (anArray copyWithoutIndex: idx-1) interval: anInterval maxErrors: limit-1) or: [ self isSafeInc: (anArray copyWithoutIndex: idx) interval: anInterval maxErrors: limit-1 ] ]
					ifFalse: [ false ] ] ].
	^ true
]

{ #category : 'examples' }
AoC24Day02 class >> part1 [

	^ self part1: AOC2024 inputDay02
]

{ #category : 'examples' }
AoC24Day02 class >> part1: inputStream [
	" self part1: '7 6 4 2 1
1 2 7 8 9
9 7 6 2 1
1 3 2 4 5
8 6 4 4 1
1 3 6 7 9' readStream"


	| lines |
	lines := inputStream linesCollect: [ :each | each asIntegers ].
	^ (lines select: [ :each |
		 (self isSafeInc: each interval: #( 1 2 3 ) maxErrors: 0) or: [ 
			self isSafeDec: each interval: #( 1 2 3 ) maxErrors: 0 ] ]) size
]

{ #category : 'examples' }
AoC24Day02 class >> part2 [

	^ self part2: AOC2024 inputDay02
]

{ #category : 'examples' }
AoC24Day02 class >> part2: inputStream [
	" self part2: '7 6 4 2 1
1 2 7 8 9
9 7 6 2 1
1 3 2 4 5
8 6 4 4 1
1 3 6 7 9' readStream"


	| lines |
	lines := inputStream linesCollect: [ :each | each asIntegers ].
	^ (lines select: [ :each |
		 (self isSafeInc: each interval: #( 1 2 3 ) maxErrors: 1) or: [ 
			self isSafeDec: each interval: #( 1 2 3 ) maxErrors: 1 ] ]) size
]

{ #category : 'testing' }
AoC24Day02 >> isSafe: anArray interval: anInterval [ 
	^ self class isSafe: anArray interval: anInterval 
]

{ #category : 'examples' }
AoC24Day02 >> part1 [
	^ self class part1
]
