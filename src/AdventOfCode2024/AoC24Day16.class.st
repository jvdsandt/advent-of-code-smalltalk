Class {
	#name : #AoC24Day16,
	#superclass : #Object,
	#classInstVars : [
		'minCosts'
	],
	#category : #AdventOfCode2024
}

{ #category : #examples }
AoC24Day16 class >> calcCosts: path [

	| turns |
	
	turns := 0.
	2 to: path size do: [ :idx |
		(path at: idx-1) value = (path at: idx) value
			ifFalse: [ turns := turns + 1 ] ].

	^ path size + (turns * 1000)
]

{ #category : #examples }
AoC24Day16 class >> part1 [

	^ AoC24 inputDay16 readStreamDo: [ :s | self part1: s ]
]

{ #category : #examples }
AoC24Day16 class >> part1: stream [

	| matrix startpos startdir endpos path |
	
	matrix := AoCMatrix from: stream.
	startpos := matrix findPos: $S.
	startdir := 1 @ 0.
	endpos := matrix findPos: $E.
	
	minCosts := 2 raisedTo: 62.
	path := self travelFrom: (Array with: startpos -> startdir) in: matrix to: endpos.
	
	^ self calcCosts: path
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

	| currpos currdir rightdir leftdir newPath newCosts |
	
	newCosts := self calcCosts: path.
	newCosts > minCosts 
		ifTrue: [ ^ nil ].
	currpos := path last key.
	currdir := path last value.
	currpos + currdir = endpos
		ifTrue: [ minCosts := newCosts. ^ path ].
	(path anySatisfy: [ :kv | kv key = (currpos + currdir) ])
		ifTrue: [ ^ nil ].
		
	rightdir := currdir rightRotated.
	leftdir := currdir leftRotated.
	  
	(matrix at: currpos + currdir) ~= $#
		ifTrue: [ 
			(self travelFrom: (path copyWith: (currpos + currdir) -> currdir) in: matrix to: endpos)
				ifNotNil: [ :p | newPath := p ] ].
		
	(matrix at: currpos + rightdir) ~= $#
		ifTrue: [ 
			(self travelFrom: (path copyWith: (currpos + rightdir) -> rightdir) in: matrix to: endpos) 
				ifNotNil: [ :p | newPath := p ] ].
			
	(matrix at: currpos + leftdir) ~= $#
		ifTrue: [ 
			(self travelFrom: (path copyWith: (currpos + leftdir) -> leftdir) in: matrix to: endpos) 
				ifNotNil: [ :p | newPath := p ] ].

	^ newPath
]

{ #category : #examples }
AoC24Day16 class >> travelFrom: path in: matrix to: endpos costs: minCosts [

	| currpos currdir allPaths rightdir leftdir newPath newCosts |
	
	currpos := path last key.
	currdir := path last value.
	currpos + currdir = endpos
		ifTrue: [ ^ path ].
	(path anySatisfy: [ :kv | kv key = (currpos + currdir) ])
		ifTrue: [ ^ nil ].
	newCosts := minCosts.
		
	rightdir := currdir rightRotated.
	leftdir := currdir leftRotated.
	  
	(matrix at: currpos + currdir) ~= $#
		ifTrue: [ 
			(self travelFrom: (path copyWith: (currpos + currdir) -> currdir) in: matrix to: endpos costs: newCosts)
				ifNotNil: [ :p | 
					| c | 
					c := self calcCosts: p.
					c < newCosts 
						ifTrue: [ newPath := p. newCosts := c ] ] ].
		
	(matrix at: currpos + rightdir) ~= $#
		ifTrue: [ 
			(self travelFrom: (path copyWith: (currpos + rightdir) -> rightdir) in: matrix to: endpos costs: newCosts) 
				ifNotNil: [ :p | 
					| c | 
					c := self calcCosts: p.
					c < newCosts 
						ifTrue: [ newPath := p. newCosts := c ] ] ].
			
	(matrix at: currpos + leftdir) ~= $#
		ifTrue: [ 
			(self travelFrom: (path copyWith: (currpos + leftdir) -> leftdir) in: matrix to: endpos costs: newCosts) 
				ifNotNil: [ :p | 
					| c | 
					c := self calcCosts: p.
					c < newCosts 
						ifTrue: [ newPath := p. newCosts := c ] ] ].
	^ newPath
]
