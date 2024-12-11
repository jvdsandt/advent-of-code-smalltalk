Class {
	#name : 'AoC24Day11',
	#superclass : 'Object',
	#category : 'AdventOfCode2024',
	#package : 'AdventOfCode2024'
}

{ #category : 'examples' }
AoC24Day11 class >> count: numbers after: blonkCount [

	| sum |
	
	blonkCount = 0
		ifTrue: [ ^ numbers size ].
	
	sum := 0.
	numbers do: [ :nr |
		| nrStr |
		sum := sum + (nr = 0
			ifTrue: [ (self count: (Array with: 1) after: blonkCount-1) ]
			ifFalse: [ 
				nrStr := nr asString.
				(nrStr size \\ 2) = 0 
					ifTrue: [
						self count: (Array
							with: (nrStr copyFrom: 1 to: (nrStr size / 2)) asInteger
							with: (nrStr copyFrom: (nrStr size / 2)+1 to: nrStr size) asInteger) after: blonkCount-1 ]
					ifFalse: [
						self count: (Array with: nr * 2024) after: blonkCount-1 ] ]) ].
	^ sum
]

{ #category : 'examples' }
AoC24Day11 class >> part1 [

	^ AoC24 inputDay11 readStreamDo: [ :s | self part1: s ]
]

{ #category : 'examples' }
AoC24Day11 class >> part1: stream [

	| numbers |
	
	numbers := stream contents asIntegers.
	
	^ self count: numbers after: 25
]

{ #category : 'examples' }
AoC24Day11 class >> part2 [

	^ AoC24 inputDay11 readStreamDo: [ :s | self part2: s ]
]

{ #category : 'examples' }
AoC24Day11 class >> part2: stream [

	| numbers |
	
	numbers := stream contents asIntegers.
	
	^ self count: numbers after: 75
]
