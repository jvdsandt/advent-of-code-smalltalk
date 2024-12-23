Class {
	#name : 'AoC24Day20',
	#superclass : 'Object',
	#instVars : [
		'matrix',
		'startpos',
		'endpos',
		'nodes',
		'edges'
	],
	#category : 'AdventOfCode2023',
	#package : 'AdventOfCode2023'
}

{ #category : 'examples' }
AoC24Day20 class >> part1 [

	^ AoC24 inputDay20 readStreamDo: [ :s | self part1: s ]
]

{ #category : 'examples' }
AoC24Day20 class >> part1: stream [

	^ self part1: stream minSavings: 100
]

{ #category : 'examples' }
AoC24Day20 class >> part1: stream minSavings: min [

	| matrix |
	
	matrix := AoCMatrix from: stream.
	^ self new
		setMatrix: matrix;
		run: min maxCheats: 2
]

{ #category : 'examples' }
AoC24Day20 class >> part2 [

	^ AoC24 inputDay20 readStreamDo: [ :s | self part2: s ]
]

{ #category : 'examples' }
AoC24Day20 class >> part2: stream [

	| matrix |
	
	matrix := AoCMatrix from: stream.
	^ self new
		setMatrix: matrix;
		run: 100 maxCheats: 20
		
]

{ #category : 'initialization' }
AoC24Day20 >> initNodesAndEdges [

	nodes := OrderedCollection new: 5000.
	edges := OrderedCollection new: 20000.
	matrix doWithCells: [ :value :point |
		value ~= $#
			ifTrue: [ 
				nodes add: point.
				(point x < matrix maxX and: [ (matrix at: point + (1 @ 0)) ~= $# ])
					ifTrue: [ 
						edges add: (Array with: point + (1 @ 0) with: point with: 1).
						edges add: (Array with: point with: point + (1 @ 0) with: 1) ].
				(point y < matrix maxY and: [ (matrix at: point + (0 @ 1)) ~= $# ])
					ifTrue: [ 
						edges add: (Array with: point + (0 @ 1) with: point with: 1).
						edges add: (Array with: point with: point + (0 @ 1) with: 1) ] ] ].
			

]

{ #category : 'running' }
AoC24Day20 >> run: minSavings maxCheats: maxCheats [

	| path cnt |
	
	path := self shortestPath asArray.
	cnt := 0.
	
	1 to: path size do: [ :pi1 |
		pi1+1 to: path size do: [ :pi2 |
			| p1 p2 manDist pathDist timeSaved |
			p1 := path at: pi1.
			p2 := path at: pi2.
			manDist := (p2 x - p1 x) abs + (p2 y - p1 y) abs.
			manDist <= maxCheats
				ifTrue: [ 
					pathDist := pi2 - pi1.
					timeSaved := pathDist - manDist.
					timeSaved >= minSavings
						ifTrue: [ cnt := cnt + 1 ] ] ] ].
	^ cnt
]

{ #category : 'initialization' }
AoC24Day20 >> setMatrix: aMatrix [

	matrix := aMatrix.
	startpos := matrix findPos: $S.
	endpos := matrix findPos: $E.
	self initNodesAndEdges.	
]

{ #category : 'running' }
AoC24Day20 >> shortestPath [

	| dijkstra |
	
	dijkstra := AIDijkstra new
		nodes: nodes;
		edges: edges from: #first to: #second weight: #third;
		yourself.
		
	^ dijkstra runFrom: startpos to: endpos
]
