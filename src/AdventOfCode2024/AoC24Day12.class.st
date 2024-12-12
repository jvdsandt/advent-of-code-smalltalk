Class {
	#name : 'AoC24Day12',
	#superclass : 'Object',
	#category : 'AdventOfCode2024',
	#package : 'AdventOfCode2024'
}

{ #category : 'as yet unclassified' }
AoC24Day12 class >> countFences: plot [

	| dirs sum |
	
	dirs := { 1 @ 0. 0 @ 1. -1 @ 0. 0 @ -1 }.
	sum := 0.
	plot do: [ :each |
		dirs do: [ :dir |
			(plot includes: each + dir)
				ifFalse: [ sum := sum + 1 ] ] ].
	^ sum
]

{ #category : 'as yet unclassified' }
AoC24Day12 class >> countSides: plot [

	| dirs fences |
	
	dirs := { 1 @ 0. 0 @ 1. -1 @ 0. 0 @ -1 }.
	fences := Set new.
	plot do: [ :each |
		dirs do: [ :dir |
			(plot includes: each + dir)
				ifFalse: [ fences add: each + (dir/10) ] ] ].

	fences copy sorted do: [ :each |
		[ fences includes: (each + (0 @ 1)) ] whileTrue: [ fences remove: (each + (0 @ 1)) ].
		[ fences includes: (each + (1 @ 0)) ] whileTrue: [ fences remove: (each + (1 @ 0)) ] ].
	
	^ fences size
]

{ #category : 'examples' }
AoC24Day12 class >> part1 [

	^ AoC24 inputDay12 readStreamDo: [ :s | self part1: s ]
]

{ #category : 'examples' }
AoC24Day12 class >> part1: stream [

	| matrix visited sum |
	
	matrix := AoCMatrix from: stream.
	visited := Set new.
	sum := 0.
	
	matrix doWithCells: [ :v :p |
		(visited includes: p)
			ifFalse: [ 
				| plot |
				plot := matrix getPlotPoints: p.
				sum := sum + (plot size * (self countFences: plot)).
				visited addAll: plot ] ].
	^ sum
]

{ #category : 'examples' }
AoC24Day12 class >> part2 [

	^ AoC24 inputDay12 readStreamDo: [ :s | self part2: s ]
]

{ #category : 'examples' }
AoC24Day12 class >> part2: stream [

	| matrix visited sum |
	
	matrix := AoCMatrix from: stream.
	visited := Set new.
	sum := 0.
	
	matrix doWithCells: [ :v :p |
		(visited includes: p)
			ifFalse: [ 
				| plot |
				plot := matrix getPlotPoints: p.
				sum := sum + (plot size * (self countSides: plot)).
				visited addAll: plot ] ].
	^ sum
]
