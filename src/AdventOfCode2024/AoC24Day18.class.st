Class {
	#name : 'AoC24Day18',
	#superclass : 'Object',
	#category : 'AdventOfCode2024',
	#package : 'AdventOfCode2024'
}

{ #category : 'examples' }
AoC24Day18 class >> createDijkstraGraph: matrix [

	| nodes edges |
	
	nodes := OrderedCollection new: 5000.
	edges := OrderedCollection new: 20000.
	matrix doWithCells: [ :value :point |
		value = $.
			ifTrue: [ 
				nodes add: point.
				(point x < matrix maxX and: [ (matrix at: point + (1 @ 0)) = $. ])
					ifTrue: [ 
						edges add: (Array with: point + (1 @ 0) with: point with: 1).
						edges add: (Array with: point with: point + (1 @ 0) with: 1) ].
				(point y < matrix maxY and: [ (matrix at: point + (0 @ 1)) = $. ])
					ifTrue: [ 
						edges add: (Array with: point + (0 @ 1) with: point with: 1).
						edges add: (Array with: point with: point + (0 @ 1) with: 1) ] ] ].
			
	^ AIDijkstra new
		nodes: nodes;
		edges: edges from: #first to: #second weight: #third
		yourself
]

{ #category : 'examples' }
AoC24Day18 class >> part1 [

	^ AoC24 inputDay18 readStreamDo: [ :s | self part1: s ]
]

{ #category : 'examples' }
AoC24Day18 class >> part1: stream [

	^ self part1: stream rows: 71 cols: 71 fallen: 1024
]

{ #category : 'examples' }
AoC24Day18 class >> part1: stream rows: ycnt cols: xcnt fallen: cnt [

	| matrix points dijkstra |
	
	matrix := AoCMatrix rows: ycnt cols: xcnt withAll: $..
	points := stream linesCollect: [ :line |
		| nrs |
		nrs := line splitOn: $,.
		nrs first asInteger @ nrs last asInteger ].
	1 to: cnt do: [ :idx |
		matrix at: (points at: idx) + (1@1) put: $# ].
	
	dijkstra := self createDijkstraGraph: matrix.
		
	dijkstra runFrom: 1 @ 1.
	^ (dijkstra findNode: xcnt @ ycnt) pathDistance

]

{ #category : 'examples' }
AoC24Day18 class >> part2 [

	^ AoC24 inputDay18 readStreamDo: [ :s | self part2: s ]
]

{ #category : 'examples' }
AoC24Day18 class >> part2: stream [

	^ self part2: stream rows: 71 cols: 71 fallen: 1024
]

{ #category : 'examples' }
AoC24Day18 class >> part2: stream rows: ycnt cols: xcnt fallen: cnt [

	| matrix points dijkstra path fallenCnt |
	
	matrix := AoCMatrix rows: ycnt cols: xcnt withAll: $..
	points := stream linesCollect: [ :line |
		| nrs |
		nrs := line splitOn: $,.
		nrs first asInteger @ nrs last asInteger ].
	1 to: cnt do: [ :idx |
		matrix at: (points at: idx) + (1@1) put: $# ].
	
	fallenCnt := cnt.
	[ 
		dijkstra := self createDijkstraGraph: matrix.
		path := dijkstra runFrom: (1 @ 1) to: (xcnt @ ycnt).
		path isEmptyOrNil ifTrue: [ ^ points at: fallenCnt ].
		[ 
			fallenCnt := fallenCnt + 1. 
			matrix at: (points at: fallenCnt) + (1@1) put: $#.
			path includes: (points at: fallenCnt) + (1@1) ] whileFalse.
		true ] whileTrue
]
