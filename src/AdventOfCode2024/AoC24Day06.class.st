Class {
	#name : 'AoC24Day06',
	#superclass : 'Object',
	#category : 'AdventOfCode2024',
	#package : 'AdventOfCode2024'
}

{ #category : 'actions' }
AoC24Day06 class >> isLoop: matrix start: startPos [

	| visited pos dir |
	
	visited := Set new.
	pos := startPos.
	dir := 0 @ -1.
	
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

	| matrix visited pos dir |
	
	matrix := AoCMatrix from: stream.
	visited := Set new.
	pos := matrix findPos: $^.
	dir := 0 @ -1.
	
	[ 
		visited add: pos.
		(matrix isInside: pos + dir)
			ifTrue: [ 
				(matrix at: pos + dir) = $#
					ifTrue: [ dir := dir rightRotated ].
				pos := pos + dir ]
			ifFalse: [ ^ visited size ] ] doWhileTrue: [ true ]
]

{ #category : 'examples' }
AoC24Day06 class >> part2 [

	^ AoC24 inputDay06 readStreamDo: [ :s | self part2: s ]
]

{ #category : 'actions' }
AoC24Day06 class >> part2: stream [

	| matrix pos cnt points |
	
	matrix := AoCMatrix from: stream.
	pos := matrix findPos: $^.
	cnt := 0.
	points := OrderedCollection new.
	
	1 to: matrix maxX do: [ :x |
		1 to: matrix maxY do: [ :y |
			(matrix at: x @ y) = $.
				ifTrue: [ 
					matrix at: x @ y put: $#.
					(self isLoop: matrix start: pos)
						ifTrue: [ cnt := cnt + 1. points add: x @ y ].
					matrix at: x @ y put: $.. ] ] ].
		
	points do: [ :p | 
		matrix at: p put: $#.
		(self isLoop: matrix start: pos)
			ifFalse: [ self error: 'No loop!' ].
		matrix at: p put: $. ].
	
	^ cnt
]
