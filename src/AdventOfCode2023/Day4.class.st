Class {
	#name : 'Day4',
	#superclass : 'Object',
	#instVars : [
		'id',
		'numbers',
		'winningNumbers'
	],
	#category : 'AdventOfCode2023',
	#package : 'AdventOfCode2023'
}

{ #category : 'as yet unclassified' }
Day4 class >> allFrom: stream [

	| coll |
	
	coll := OrderedCollection new.
	[  stream atEnd ] whileFalse: [ 
		| line |
		line := stream nextLine.
		coll add: (self fromLine: line) ].
	^ coll
	
]

{ #category : 'as yet unclassified' }
Day4 class >> fromLine: input [

	| stream id numbers winningNumbers |
	
	stream := input readStream.
	stream upTo: Character space.
	id := stream upTo: $:.
	numbers := self readNumbers: (stream upTo: $|).
	winningNumbers := self readNumbers: stream upToEnd.
	^ self new id: id numbers: numbers winningNumbers: winningNumbers
	
	

]

{ #category : 'as yet unclassified' }
Day4 class >> readNumbers: input [

	| nrs str |
	nrs := OrderedCollection new.
	str := input readStream.
	[  str atEnd ] whileFalse: [ nrs add: (str upTo: Character space) asInteger ].
	^ nrs
]

{ #category : 'as yet unclassified' }
Day4 >> id: anId numbers: c1 winningNumbers: c2 [	
	id := anId.
	numbers := c1.
	winningNumbers := c2 
]

{ #category : 'as yet unclassified' }
Day4 >> points [

	| p |
	
	p := 0.
	numbers do: [ :each |
		(winningNumbers includes: each)
			ifTrue: [ 
				p := p = 0 ifTrue: [ 1 ] ifFalse: [ p * 2 ] ] ].
		^ p
]
