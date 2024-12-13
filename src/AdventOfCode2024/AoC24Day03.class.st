Class {
	#name : #AoC24Day03,
	#superclass : #Object,
	#category : 'AdventOfCode2024'
}

{ #category : #actions }
AoC24Day03 class >> part1 [

	^ AoC24 inputDay03 readStreamDo: [ :s | self part1: s ]
]

{ #category : #actions }
AoC24Day03 class >> part1: stream [

	| list |
	
	list := stream contents allRegexMatches: 'mul\(\d+,\d+\)'.
	^ (list collect: [ :each |
		| str nr1 nr2 |
		str := each readStream.
		nr1 := (str upTo: $(; upTo: $,) asInteger.
		nr2 := (str upTo: $)) asInteger.
		nr1 * nr2 ]) sum
]

{ #category : #actions }
AoC24Day03 class >> part2 [

	^ AoC24 inputDay03 readStreamDo: [ :s | self part2: s ]
]

{ #category : #actions }
AoC24Day03 class >> part2: stream [

	| list sum on |
	
	list := stream contents allRegexMatches: 'mul\(\d+,\d+\)|do\(\)|don''t\(\)'.
	sum := 0.
	on := true.
	
	list do: [ :each |
		each = 'do()'	
			ifTrue: [ on := true ].
		each = 'don''t()'
			ifTrue: [ on := false ].
		(on and: [ each beginsWith: 'mul(' ])
			ifTrue: [ 
				| str nr1 nr2 |
				str := each readStream.
				nr1 := (str upTo: $(; upTo: $,) asInteger.
				nr2 := (str upTo: $)) asInteger.
				sum := sum + (nr1 * nr2) ] ].
	^ sum
]
