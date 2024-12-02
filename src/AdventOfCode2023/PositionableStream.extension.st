Extension { #name : 'PositionableStream' }

{ #category : '*AdventOfCode2023' }
PositionableStream >> linesCollect: aBlock [

	| coll |
	
	coll := OrderedCollection new.
	[ self atEnd ] whileFalse: [ coll add: (aBlock value: self nextLine) ].
	^ coll
]

{ #category : '*AdventOfCode2023' }
PositionableStream >> linesDo: aBlock [

	[ self atEnd ] whileFalse: [ aBlock value: self nextLine ]
]
