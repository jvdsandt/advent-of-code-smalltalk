Class {
	#name : 'AoC24Day07',
	#superclass : 'Object',
	#category : 'AdventOfCode2024',
	#package : 'AdventOfCode2024'
}

{ #category : 'examples' }
AoC24Day07 class >> isValidEntry: entry using: operators [

	| expected values results |
	
	expected := entry key.
	values := entry value.
	results := Set with: 0.
	
	values doWithIndex: [ :value :idx |
		| newResults lastValue |
		newResults := Set new.
		lastValue := idx = values size.
		operators do: [ :op |
			results do: [ :eachSum |
				| result |
				result := eachSum perform: op with: value.
				lastValue
					ifTrue: [
						result = expected
							ifTrue: [ ^ true ] ]
					ifFalse: [ 
						newResults add: result ] ] ].
		results := newResults ].

	^ false
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
		(self isValidEntry: each using: operators)
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
		(self isValidEntry: each using: operators)
			ifTrue: [ sum := sum + each key ] ].
	^ sum
]
