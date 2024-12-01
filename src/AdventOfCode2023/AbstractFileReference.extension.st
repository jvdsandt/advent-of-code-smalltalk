Extension { #name : 'AbstractFileReference' }

{ #category : '*AdventOfCode2023' }
AbstractFileReference >> linesCollect: aBlock [

	| list |
	list := OrderedCollection new.
	self readStreamDo: [ :str |
		[ str atEnd ]
			whileFalse: [ list add: (aBlock value: str nextLine) ] ].
	^ list
]

{ #category : '*AdventOfCode2023' }
AbstractFileReference >> linesDo: aBlock [

	self readStreamDo: [ :str |
		[ str atEnd ]
			whileFalse: [ aBlock value: str nextLine ]	]
]
