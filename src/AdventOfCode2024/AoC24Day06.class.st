Class {
	#name : 'AoC24Day06',
	#superclass : 'Object',
	#category : 'AdventOfCode2024',
	#package : 'AdventOfCode2024'
}

{ #category : 'actions' }
AoC24Day06 class >> doTravel: matrix [

	| visited startPos |
	
	visited := Set new.
	startPos := matrix findPos: $^.
	
	matrix travelFrom: startPos in: 0 @ -1 do: [ :value :p :dir |
		visited add: p.
		(matrix at: p + dir ifOutside: [ $X ]) = $#
			ifTrue: [ dir rightRotated ]
			ifFalse: [ dir ] ].
		
	^ visited
]

{ #category : 'actions' }
AoC24Day06 class >> isLoop: matrix start: startPos dir: startDir [

	| visited pos dir |
	
	visited := Set new.
	pos := startPos.
	dir := startDir.
	
	[ true ] whileTrue: [ 
		| nextPos |
		nextPos := pos + dir.
		(matrix isInside: nextPos)
			ifFalse: [ ^ false ].
		(matrix at: nextPos) = $#
			ifTrue: [ dir := dir rightRotated ]
			ifFalse: [ 
				(visited includes: (nextPos -> dir))
					ifTrue: [ ^ true ]
					ifFalse: [ 
						visited add: nextPos -> dir.
						pos := nextPos ] ] ].
	"dummy return"
	^ false
]

{ #category : 'examples' }
AoC24Day06 class >> part1 [

	^ AoC24 inputDay06 readStreamDo: [ :s | self part1: s ]
]

{ #category : 'actions' }
AoC24Day06 class >> part1: stream [

	| matrix visited |
	
	matrix := AoCMatrix from: stream.
	visited := self doTravel: matrix.
	^ visited size
]

{ #category : 'examples' }
AoC24Day06 class >> part2 [

	^ AoC24 inputDay06 readStreamDo: [ :s | self part2: s ]
]

{ #category : 'actions' }
AoC24Day06 class >> part2: stream [

	| matrix startPos startDir visited cnt |
	
	matrix := AoCMatrix from: stream.
	startPos := matrix findPos: $^.
	startDir := 0 @ -1.
	visited := self doTravel: matrix.
	visited remove: startPos.
	
	cnt := 0.
	visited do: [ :p |
		(matrix at: p) = $.
			ifTrue: [ 
				matrix at: p put: $#.
				(self isLoop: matrix start: startPos dir: startDir)
					ifTrue: [ cnt := cnt + 1 ].
				matrix at: p put: $.. ] ].
	
	^ cnt
]
