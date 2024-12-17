Class {
	#name : 'AoC24Day14',
	#superclass : 'Object',
	#category : 'AdventOfCode2024',
	#package : 'AdventOfCode2024'
}

{ #category : 'examples' }
AoC24Day14 class >> areOnALine: points [

	points size < 2
		ifTrue: [ ^ false ].
		
	2 to: points size-1 do: [ :idx |
		(points first to: points last 
			intersects: ((points at: idx) + (-0.1 @ 0)) to: ((points at: idx) + (0.1 @ 0)))
			ifFalse: [ ^ false ] ].
	^ true
]

{ #category : 'examples' }
AoC24Day14 class >> calcScore: points with: w height: h [

	| middle q1 q2 q3 q4 |
	
	middle := (w // 2) @ (h // 2).
	q1 := q2 := q3 := q4 := 0.
	points do: [ :each |
		(each x < middle x and: [ each y < middle y ])
			ifTrue: [ q1 := q1 + 1 ].
		(each x < middle x and: [ each y > middle y ])
			ifTrue: [ q2 := q2 + 1 ].
		(each x > middle x and: [ each y > middle y ])
			ifTrue: [ q3 := q3 + 1 ].
		(each x > middle x and: [ each y < middle y ])
			ifTrue: [ q4 := q4 + 1 ] ].
		
	^ q1 * q2 * q3 * q4
]

{ #category : 'examples' }
AoC24Day14 class >> isChristmasTree: points [

	| pointsPerRow minY maxY trianglePoints index baserow |
	
	minY := points min: #y.
	maxY := points max: #y.
	pointsPerRow := points groupedBy: #y.
	
	((pointsPerRow at: minY) asSet size = 1 and: [ (pointsPerRow at: minY) first x = 50 ])
		ifTrue: [ 
			self showPoints: points round: 0.
			self halt ].
	
	index := 0.
	trianglePoints := OrderedCollection new.
	[ 
		index := index + 1.
		pointsPerRow at: index 
			ifPresent: [ :row | 
				trianglePoints add: (Array with: row first with: row last).
				row size <= 2 ]
			ifAbsent: [ true ] ] whileTrue.
		
	( self areOnALine: (trianglePoints collect: [ :row | row first]))
		ifFalse: [ ^ false ].
	( self areOnALine: (trianglePoints collect: [ :row | row last]))
		ifFalse: [ ^ false ].
		
	baserow := pointsPerRow at: index.


	^ trianglePoints size > 10
]

{ #category : 'examples' }
AoC24Day14 class >> parse: stream [

	| list |
	
	list := OrderedCollection new.
	[ stream atEnd ] whileFalse: [ 
		| line p v |
		line := stream nextLine readStream.
		line upTo: $=.
		p := (line upTo: $,) asInteger @ (line upTo: Character space) asInteger.
		line upTo: $=.
		v := (line upTo: $,) asInteger @ line upToEnd asInteger.
		list add: (Array with: p with: v) ].
	^ list
]

{ #category : 'examples' }
AoC24Day14 class >> part1 [

	^ AoC24 inputDay14 readStreamDo: [ :s | self part1: s ]
]

{ #category : 'examples' }
AoC24Day14 class >> part1: stream [

	^ self part1: stream width: 101 height: 103
]

{ #category : 'examples' }
AoC24Day14 class >> part1: stream width: w height: h [

	| robots finalPos middle q1 q2 q3 q4 |
	
	robots := self parse: stream.
	
	finalPos := robots collect: [ :each |
		(each first + (100 * each last)) \\ (w @ h) ].
	
	middle := (w // 2) @ (h // 2).
	q1 := q2 := q3 := q4 := 0.
	finalPos do: [ :each |
		(each x < middle x and: [ each y < middle y ])
			ifTrue: [ q1 := q1 + 1 ].
		(each x < middle x and: [ each y > middle y ])
			ifTrue: [ q2 := q2 + 1 ].
		(each x > middle x and: [ each y > middle y ])
			ifTrue: [ q3 := q3 + 1 ].
		(each x > middle x and: [ each y < middle y ])
			ifTrue: [ q4 := q4 + 1 ] ].
		
	^ q1 * q2 * q3 * q4
]

{ #category : 'examples' }
AoC24Day14 class >> part2 [

	^ AoC24 inputDay14 readStreamDo: [ :s | self part2: s ]
]

{ #category : 'examples' }
AoC24Day14 class >> part2: stream [

	^ self part2: stream width: 101 height: 103
]

{ #category : 'examples' }
AoC24Day14 class >> part2: stream width: w height: h [

	| robots newpos cnt score newScore |
	
	robots := self parse: stream.
	
	cnt := 0.
	score := 10000000000000.
	newpos := robots collect: [ :each | each first ].
	[  
		"self showPoints: newpos round: cnt.
		self halt. "
	 	1 to: robots size do: [ :idx |
			newpos at: idx put: ((newpos at: idx) + (robots at: idx) last) \\ (w @ h) ].
		cnt := cnt + 1.
		newScore := self calcScore: newpos with: w height: h.
		(newScore < score) 
			ifTrue: [
				score := newScore.   
				self showPoints: newpos round: cnt ].
		cnt <= 100000 ] whileTrue.
		
	^ cnt
]

{ #category : 'as yet unclassified' }
AoC24Day14 class >> showPoints: points [

	| ws |
	
	ws := WriteStream on: (String new: 11000).
	0 to: 102 do: [ :y |
		0 to: 100 do: [ :x |
			| p cnt |
			p := x @ y.
			cnt := (points select: [ :e | e = p ]) size.
			ws nextPut: (cnt = 0 ifTrue: [ $ ] ifFalse: [ Character value: cnt + $0 asInteger ]) ].
		ws cr ].

]

{ #category : 'as yet unclassified' }
AoC24Day14 class >> showPoints: points round: r [

	| ws |
	
	ws := WriteStream on: (String new: 11000).
	ws cr; nextPutAll: 'Round: '; nextPutAll: r asString; cr.
	0 to: 102 do: [ :y |
		0 to: 100 do: [ :x |
			| p cnt |
			p := x @ y.
			cnt := (points select: [ :e | e = p ]) size.
			ws nextPut: (cnt = 0 ifTrue: [ $. ] ifFalse: [ Character value: cnt + $0 asInteger ]) ].
		ws cr ].
	
	Transcript crShow: ws contents.

]
