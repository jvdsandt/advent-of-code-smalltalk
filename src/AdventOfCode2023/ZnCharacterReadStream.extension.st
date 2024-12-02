Extension { #name : 'ZnCharacterReadStream' }

{ #category : '*AdventOfCode2023' }
ZnCharacterReadStream >> linesCollect: aBlock [

	| coll |
	
	coll := OrderedCollection new.
	[ self atEnd ] whileFalse: [ coll add: (aBlock value: self nextLine) ].
	^ coll
]

{ #category : '*AdventOfCode2023' }
ZnCharacterReadStream >> linesDo: aBlock [

	[ self atEnd ] whileFalse: [ aBlock value: self nextLine ]
]
