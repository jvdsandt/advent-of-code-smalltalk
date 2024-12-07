Class {
	#name : 'AoC24Day07',
	#superclass : 'Object',
	#category : 'AdventOfCode2024',
	#package : 'AdventOfCode2024'
}

{ #category : 'examples' }
AoC24Day07 class >> isValid: expected result: result values: values using: operators [

	^ operators anySatisfy: [ :eachOp |
			| newValue |
			newValue := result perform: eachOp with: values first.
			values size > 1
				ifTrue: [ 
					newValue <= expected 
						ifTrue: [ self isValid: expected result: newValue values: values allButFirst using: operators ]
						ifFalse: [ false ] ]
				ifFalse: [ newValue = expected ] ]
]

{ #category : 'examples' }
AoC24Day07 class >> isValid: expected values: values using: operators [

	values size = 1
		ifTrue: [ ^ expected = values first ].

	^ self isValid: expected result: values first values: values allButFirst using: operators
]

{ #category : 'examples' }
AoC24Day07 class >> parseInput: stream [

	^ stream linesCollect: [ :each |
		| str key values |
		str := each readStream.
		key := (str upTo: $:) asInteger.
		values := str upToEnd asIntegers.
		key -> values ]
]

{ #category : 'examples' }
AoC24Day07 class >> part1 [

	^ AoC24 inputDay07 readStreamDo: [ :s | self part1: s ]
]

{ #category : 'examples' }
AoC24Day07 class >> part1: stream [

	| entries operators sum |
	
	entries := self parseInput: stream.
	operators := #( + * ).

	sum := 0.
	entries do: [ :each |
		(self isValid: each key values: each value using: operators)
			ifTrue: [ sum := sum + each key ] ].
	^ sum
]

{ #category : 'examples' }
AoC24Day07 class >> part2 [

	^ AoC24 inputDay07 readStreamDo: [ :s | self part2: s ]
]

{ #category : 'examples' }
AoC24Day07 class >> part2: stream [

	| entries operators sum |
	
	entries := self parseInput: stream.
	operators := #( + * || ).

	sum := 0.
	entries do: [ :each |
		(self isValid: each key values: each value using: operators)
			ifTrue: [ sum := sum + each key ] ].
	^ sum
]
