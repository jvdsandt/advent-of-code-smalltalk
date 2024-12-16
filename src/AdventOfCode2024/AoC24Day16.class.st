Class {
	#name : #AoC24Day16,
	#superclass : #Object,
	#category : #AdventOfCode2024
}

{ #category : #examples }
AoC24Day16 class >> part1 [

	^ AoC24 inputDay16 readStreamDo: [ :s | self part1: s ]
]

{ #category : #examples }
AoC24Day16 class >> part1: stream [

	| matrix startpos startdir endpos paths |
	
	matrix := AoCMatrix from: stream.
	startpos := matrix findPos: $S.
	startdir := 1 @ 0.
	endpos := matrix findPos: $E.
	
	paths := self travelFrom: (Array with: startpos -> startdir) in: matrix to: endpos.
	
	^ paths
]

{ #category : #examples }
AoC24Day16 class >> part2 [

	^ AoC24 inputDay16 readStreamDo: [ :s | self part2: s ]
]

{ #category : #examples }
AoC24Day16 class >> part2: stream [
]

{ #category : #examples }
AoC24Day16 class >> travelFrom: path in: matrix to: endpos [

	| currpos currdir allPaths rightdir leftdir |
	
	Transcript show: (String streamContents: [ : s |
		matrix printWith: path on: s.
		s cr ]).
	self halt.
	
	currpos := path last key.
	currdir := path last value.
	currpos + currdir = endpos
		ifTrue: [ ^ Array with: path ].
	(path includes: currpos)
		ifTrue: [ ^ #() ].
		
	rightdir := currdir rightRotated.
	leftdir := currdir leftRotated.
	  
	allPaths := OrderedCollection new.
	(matrix at: currpos + currdir) ~= $#
		ifTrue: [ 
			allPaths addAll: (
				self travelFrom: (path copyWith: (currpos + currdir) -> currdir) in: matrix to: endpos) ].
		
	(matrix at: currpos + rightdir) ~= $#
		ifTrue: [ 
			allPaths addAll: (
				self travelFrom: (path copyWith: (currpos + rightdir) -> rightdir) in: matrix to: endpos) ].
			
	(matrix at: currpos + leftdir) ~= $#
		ifTrue: [ 
			allPaths addAll: (
				self travelFrom: (path copyWith: (currpos + leftdir) -> leftdir) in: matrix to: endpos) ].
		
	^ allPaths select: [ :each | each last key + each last value = endpos ]
]
