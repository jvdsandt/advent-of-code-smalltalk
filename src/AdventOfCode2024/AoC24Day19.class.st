Class {
	#name : 'AoC24Day19',
	#superclass : 'Object',
	#category : 'AdventOfCode2024',
	#package : 'AdventOfCode2024'
}

{ #category : 'examples' }
AoC24Day19 class >> cleanupTowels: towels [

	^ towels reject: [ :each | self isValidDesign: each towels: (towels copyWithout: each) ]
	
	
]

{ #category : 'testing' }
AoC24Day19 class >> countValidDesign: design towels: towels [

	^ self countValidDesign: design towels: towels startingAt: 1
]

{ #category : 'testing' }
AoC24Day19 class >> countValidDesign: design towels: towels cache: cache [

	| matches count |
	
	cache at: design ifPresent: [ :cnt | ^ cnt ].
	
	matches := towels select: [ :t | design beginsWith: t ].
	matches isEmpty
		ifTrue: [ ^ 0 ].

	count := 0.
	matches first size = design size
		ifTrue: [ 
			count := count + 1.
			matches := matches allButFirst ].

	matches do: [ :m | 
		count := count + (self countValidDesign: (design allButFirst: m size) towels: towels cache: cache) ].
	
	cache at: design put: count.
	^ count
]

{ #category : 'testing' }
AoC24Day19 class >> isValidDesign: design towels: towels [

	| matches |
	
	matches := towels select: [ :t | design beginsWith: t ].
	matches isEmpty
		ifTrue: [ ^ false ].
	matches first size = design size
		ifTrue: [ ^ true ].

	^ matches anySatisfy: [ :m | self isValidDesign: (design allButFirst: m size) towels: towels ]
]

{ #category : 'examples' }
AoC24Day19 class >> part1 [

	^ AoC24 inputDay19 readStreamDo: [ :s | self part1: s ]
]

{ #category : 'examples' }
AoC24Day19 class >> part1: stream [

	| towels designs |
	
	towels := (stream nextLine splitOn: $,) asArray collect: [ :e | e trimBoth ].
	towels := towels sorted: [ :s1 :s2 | s1 > s2 ].
	towels := self cleanupTowels: towels.
	
	stream nextLine.
	designs := stream linesCollect: [ :each | each trimBoth ] .
	
	^ (designs select: [ :each | self isValidDesign: each towels: towels ]) size
]

{ #category : 'examples' }
AoC24Day19 class >> part2 [

	^ AoC24 inputDay19 readStreamDo: [ :s | self part2: s ]
]

{ #category : 'examples' }
AoC24Day19 class >> part2: stream [

	| towels designs cache |
	
	towels := (stream nextLine splitOn: $,) asArray collect: [ :e | e trimBoth ].
	towels := towels sorted: [ :s1 :s2 | s1 > s2 ].
	
	stream nextLine.
	designs := stream linesCollect: [ :each | each trimBoth ] .
	cache := Dictionary new.
		
	^ (designs collect: [ :each | self countValidDesign: each towels: towels cache: cache]) sum
]
