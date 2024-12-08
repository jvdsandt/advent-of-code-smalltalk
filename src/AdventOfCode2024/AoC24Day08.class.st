Class {
	#name : 'AoC24Day08',
	#superclass : 'Object',
	#category : 'AdventOfCode2024',
	#package : 'AdventOfCode2024'
}

{ #category : 'examples' }
AoC24Day08 class >> findNodesFor: ch in: matrix [

	| posList set |
	
	posList := matrix findAllPos: ch.
	set := Set new.	
	posList do: [ :p1 |
		posList do: [ :p2 |
			| delta |
			delta := p2 - p1.
			(matrix isInside: (p1 - delta))
				ifTrue: [ set add: (p1 - delta) ].
			(matrix isInside: (p2 + delta))
				ifTrue: [ set add: (p2 + delta) ] ] without: p1 ].
	^ set
]

{ #category : 'examples' }
AoC24Day08 class >> findNodesPart2For: ch in: matrix [

	| posList set |
	
	posList := matrix findAllPos: ch.
	set := Set withAll: posList.	
	posList do: [ :p1 |
		posList do: [ :p2 |
			| delta p |
			delta := p2 - p1.
			p := p1 - delta.
			[ matrix isInside: p ] whileTrue: [ set add: p. p := p - delta ].
			p := p2 + delta.
			[ matrix isInside: p ] whileTrue: [ set add: p. p := p + delta ] ] without: p1 ].
	^ set
]

{ #category : 'examples' }
AoC24Day08 class >> part1 [

	^ AoC24 inputDay08 readStreamDo: [ :s | self part1: s ]
]

{ #category : 'examples' }
AoC24Day08 class >> part1: stream [

	| matrix nodes chars |
	
	matrix := AoCMatrix from: stream.
	nodes := Set new.
	chars := matrix allValues copyWithout: $..

	chars do: [ :ch | nodes addAll: (self findNodesFor: ch in: matrix) ].
	^ nodes size
]

{ #category : 'examples' }
AoC24Day08 class >> part2 [

	^ AoC24 inputDay08 readStreamDo: [ :s | self part2: s ]
]

{ #category : 'examples' }
AoC24Day08 class >> part2: stream [

	| matrix nodes chars |
	
	matrix := AoCMatrix from: stream.
	nodes := Set new.
	chars := matrix allValues copyWithout: $..

	chars do: [ :ch | nodes addAll: (self findNodesPart2For: ch in: matrix) ].
	^ nodes size
]
