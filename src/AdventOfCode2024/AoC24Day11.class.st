Class {
	#name : 'AoC24Day11',
	#superclass : 'Object',
	#category : 'AdventOfCode2024',
	#package : 'AdventOfCode2024'
}

{ #category : 'examples' }
AoC24Day11 class >> countOne: nr after: blonkCount cache: cache [

	| nrStr key sum |
	
	blonkCount = 0
		ifTrue: [ ^ 1 ].
	
	key := (Array with: nr with: blonkCount).
	cache at: key ifPresent: [ :v | ^ v ].
	
	sum := nr = 0
		ifTrue: [ self countOne: 1 after: blonkCount-1 cache: cache]
		ifFalse: [ 
			nrStr := nr asString.
			(nrStr size \\ 2) = 0 ifTrue: [
				(self countOne: (nrStr copyFrom: 1 to: (nrStr size / 2)) asInteger after: blonkCount-1 cache: cache) +
				(self countOne: (nrStr copyFrom: (nrStr size / 2)+1 to: nrStr size) asInteger after: blonkCount-1 cache: cache) ]
			ifFalse: [
				self countOne: nr * 2024 after: blonkCount-1 cache: cache ] ].
	cache at: key put: sum.
	^ sum
]

{ #category : 'examples' }
AoC24Day11 class >> part1 [

	^ AoC24 inputDay11 readStreamDo: [ :s | self part1: s ]
]

{ #category : 'examples' }
AoC24Day11 class >> part1: stream [

	| numbers cache |
	
	numbers := stream contents asIntegers.
	cache := Dictionary new.
	
	^ numbers inject: 0 into: [ :sum :each  | 
			sum + (self countOne: each after: 25 cache: cache) ]
]

{ #category : 'examples' }
AoC24Day11 class >> part2 [

	^ AoC24 inputDay11 readStreamDo: [ :s | self part2: s ]
]

{ #category : 'examples' }
AoC24Day11 class >> part2: stream [

	| numbers cache |
	
	numbers := stream contents asIntegers.
	cache := Dictionary new.
	
	^ numbers inject: 0 into: [ :sum :each  | 
			sum + (self countOne: each after: 75 cache: cache) ]
]
