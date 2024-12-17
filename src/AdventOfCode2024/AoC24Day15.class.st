Class {
	#name : 'AoC24Day15',
	#superclass : 'Object',
	#category : 'AdventOfCode2024',
	#package : 'AdventOfCode2024'
}

{ #category : 'examples' }
AoC24Day15 class >> calcSum: matrix [

	| sum |
	
	sum := 0.
	matrix doWithCells: [ :v : p |
		(v = $O or: [ v = $[ ])
			ifTrue: [ 
				sum := sum + ((p y - 1) * 100) + (p x - 1) ] ].
	^ sum
]

{ #category : 'examples' }
AoC24Day15 class >> canMove: pos in: matrix dir: dir [

	| value |
	
	value := matrix at: pos + dir.
	value = $.
		ifTrue: [ ^ true ].
	value = $#
		ifTrue: [ ^ false ].

	(dir y ~= 0 and: [ value = $[ ])
		ifTrue: [
			(self canMove: pos + dir + (1 @ 0) in: matrix dir: dir)
				ifFalse: [ ^ false ] ].
	(dir y ~= 0 and: [ value = $] ])
		ifTrue: [
			(self canMove: pos + dir + (-1 @ 0) in: matrix dir: dir)
				ifFalse: [ ^ false ] ].
		
	^ self canMove: pos + dir in: matrix dir: dir
]

{ #category : 'examples' }
AoC24Day15 class >> expandMatrix: input [

	| ws |
	
	ws := WriteStream on: (String new: 10000).
	1 to: input maxY do: [ :y |
		1 to: input maxX do: [ :x |
			| v |
			v := input at: x @ y.
			ws nextPutAll: (v = $#
				ifTrue: [ '##']
				ifFalse: [ v = $O
					ifTrue: [ '[]' ]
					ifFalse: [ v = $@ ifTrue: [ '@.' ] ifFalse: [ '..' ] ] ]) ].
			ws cr ].
	^ AoCMatrix from: ws contents readStream
]

{ #category : 'examples' }
AoC24Day15 class >> move: pos in: matrix dir: dir [

	self move: pos in: matrix dir: dir alreadyMoved: Set new
]

{ #category : 'examples' }
AoC24Day15 class >> move: pos in: matrix dir: dir alreadyMoved: set [

	| value |

	(set includes: pos)
		ifTrue: [ ^ self ].	
	value := matrix at: pos + dir.
	value = $#
		ifTrue: [ self error: 'Invalid move!' ].
	
	value = $. 
		ifFalse: [ self move: pos + dir in: matrix dir: dir alreadyMoved: set ].
	(dir y ~= 0 and: [ value = $[ ])
		ifTrue: [ self move: pos + dir + (1 @ 0) in: matrix dir: dir alreadyMoved: set ].
	(dir y ~= 0 and: [ value = $] ])
		ifTrue: [ self move: pos + dir - (1 @ 0) in: matrix dir: dir alreadyMoved: set ].

	matrix at: pos + dir put: (matrix at: pos).
	matrix at: pos put: $..
	set add: pos
]

{ #category : 'parsing' }
AoC24Day15 class >> parse: stream [

	| firstPart matrixWs moves |
	
	firstPart := true.
	matrixWs := WriteStream on: (String new: 10000).
	moves := OrderedCollection new.
	[ stream atEnd ] whileFalse: [ 
		| line |
		line := stream nextLine.
		line trimBoth isEmpty
			ifTrue: [ firstPart := false ]
			ifFalse: [ 
				firstPart 
					ifTrue: [ matrixWs nextPutAll: line; cr ]
					ifFalse: [ moves addAll: line ] ] ].
	^ Array with: (AoCMatrix from: matrixWs contents readStream) with: moves
]

{ #category : 'examples' }
AoC24Day15 class >> part1 [

	^ AoC24 inputDay15 readStreamDo: [ :s | self part1: s ]
]

{ #category : 'examples' }
AoC24Day15 class >> part1: stream [

	| array matrix moves robotPos dirs |
	
	array := self parse: stream.
	matrix := array first.
	moves := array last.
	robotPos := matrix findPos: $@.
	dirs := Dictionary new
		at: $> put: (1 @ 0);
		at: $v put: (0 @ 1);
		at: $< put: (-1 @ 0);
		at: $^ put: (0 @ -1);
		yourself.
	moves := moves collect: [ :each | dirs at: each ].
	moves do: [ :each |
		(self canMove: robotPos  in: matrix dir: each)
			ifTrue: [ 
				self move: robotPos in: matrix dir: each.
				matrix at: robotPos put: $..
				robotPos := robotPos + each ] ]. 
	^ self calcSum: matrix
]

{ #category : 'examples' }
AoC24Day15 class >> part2 [

	^ AoC24 inputDay15 readStreamDo: [ :s | self part2: s ]
]

{ #category : 'examples' }
AoC24Day15 class >> part2: stream [

	| array matrix moves robotPos dirs |
	
	array := self parse: stream.
	matrix := self expandMatrix: array first.
	
	moves := array last.
	robotPos := matrix findPos: $@.
	dirs := Dictionary new
		at: $> put: (1 @ 0);
		at: $v put: (0 @ 1);
		at: $< put: (-1 @ 0);
		at: $^ put: (0 @ -1);
		yourself.
	moves := moves collect: [ :each | dirs at: each ].
	moves do: [ :each |
		(self canMove: robotPos in: matrix dir: each)
			ifTrue: [ 
				self move: robotPos in: matrix dir: each.
				matrix at: robotPos put: $..
				robotPos := robotPos + each ] ].
	^ self calcSum: matrix
]
