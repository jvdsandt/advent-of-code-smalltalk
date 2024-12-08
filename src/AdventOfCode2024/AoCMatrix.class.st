Class {
	#name : 'AoCMatrix',
	#superclass : 'Object',
	#instVars : [
		'rows',
		'maxX',
		'maxY'
	],
	#category : 'AdventOfCode2024',
	#package : 'AdventOfCode2024'
}

{ #category : 'instance creation' }
AoCMatrix class >> from: aReadStream [

	^ self fromRows: (aReadStream linesCollect: [ :each | each]) asArray
]

{ #category : 'instance creation' }
AoCMatrix class >> fromRows: aCollection [

	^ self new initRows: aCollection
]

{ #category : 'accessing' }
AoCMatrix >> allDirections [

	^ { 1 @ 0. 1 @ 1. 0 @ 1. -1 @ 1. -1 @ 0. -1 @ -1. 0 @ -1. 1 @ -1 }
]

{ #category : 'accessing' }
AoCMatrix >> allValues [

	| values |
	
	values := Set new.
	self do: [ :eachValue | values add: eachValue ].
	^ values
]

{ #category : 'converting' }
AoCMatrix >> asRectangle [

	^ Rectangle point: (1 @ 1) point: (maxX @ maxY)
]

{ #category : 'accessing' }
AoCMatrix >> at: aPoint [

	^ (rows at: aPoint y) at: aPoint x
]

{ #category : 'iterating' }
AoCMatrix >> at: aPoint dir: dirPoint do: aBlock [

	| p counter |
	
	dirPoint = (0 @ 0)
		ifTrue: [ self error: 'Invalid direction' ].
	
	p := aPoint.
	counter := 0.
	[ self isInside: p ]
		whileTrue: [ 
			counter := counter + 1.
			aBlock cull: (self at: p) cull: p cull: counter.
			p := p + dirPoint ]
]

{ #category : 'accessing' }
AoCMatrix >> at: aPoint ifOutside: aBlock [

	^ (self isInside: aPoint)
		ifTrue: [ self at: aPoint ]
		ifFalse: [ aBlock value ]
]

{ #category : 'accessing' }
AoCMatrix >> at: aPoint put: aValue [

	(rows at: aPoint y) at: aPoint x put: aValue
]

{ #category : 'counting' }
AoCMatrix >> countWord: word [

	| sum |
	
	sum := 0.
	self doWithCells: [ :each :point |
		(self at: point) = word first
			ifTrue: [ sum := sum + (self countWord: word at: point) ] ].
	^ sum
]

{ #category : 'counting' }
AoCMatrix >> countWord: word at: aPoint [

	^ (self allDirections collect: [ :eachDir | self countWord: word at: aPoint dir: eachDir ]) sum
]

{ #category : 'counting' }
AoCMatrix >> countWord: word at: aPoint dir: dirPoint [

	| p |
	
	p := aPoint.
	1 to: word size do: [ :idx |
		((self at: p ifOutside: [ ^ 0 ]) = (word at: idx))
			ifFalse: [ ^ 0 ].
		p := p + dirPoint ].
	^ 1
]

{ #category : 'iterating' }
AoCMatrix >> do: aBlock [

	1 to: maxY do: [ :y |
		1 to: maxX do: [ :x |
			aBlock cull: (self at: (x @ y)) cull: (x @ y) ] ]
]

{ #category : 'iterating' }
AoCMatrix >> doWithCells: aBlock [

	rows doWithIndex: [ :line :y |
		line doWithIndex: [ :each :x |
			aBlock value: each value: x @ y ] ]
]

{ #category : 'accessing' }
AoCMatrix >> findAllPos: aValue [

	| list |
	
	list := OrderedCollection new.
	1 to: maxY do: [ :y |
		1 to: maxX do: [ :x |
			(self at: x @ y) = aValue
				ifTrue: [ list add: x @ y ] ] ].
	^ list
]

{ #category : 'accessing' }
AoCMatrix >> findPos: aValue [

	1 to: maxY do: [ :y |
		| idx |
		idx := (rows at: y) indexOf: aValue.
		idx > 0
			ifTrue: [ ^ idx @ y ] ].
	self error: 'Not found'
]

{ #category : 'initialization' }
AoCMatrix >> initRows: aColl [

	maxX := aColl isEmpty 
		ifTrue: [ 0 ]
		ifFalse: [ aColl first size ].
	maxY := aColl size.
	rows := aColl.
	
	(rows allSatisfy: [ :each | each size = maxX ])
		ifFalse: [ self error: 'Row size mismatch' ]
]

{ #category : 'testing' }
AoCMatrix >> isInside: aPoint [

	^ (aPoint x between: 1 and: maxX) and: [ aPoint y between: 1 and: maxY ]
]

{ #category : 'testing' }
AoCMatrix >> isOutside: aPoint [

	^ (self isInside: aPoint) not
]

{ #category : 'accessing' }
AoCMatrix >> maxX [

	^ maxX
]

{ #category : 'accessing' }
AoCMatrix >> maxY [

	^ maxY
]

{ #category : 'iterating' }
AoCMatrix >> travelFrom: startPoint in: startDirection do: aBlock [

	| p dir |
	p := startPoint.
	dir := startDirection.
	[ self isInside: p ]
		whileTrue: [ 
			dir := aBlock cull: (self at: p) cull: p cull: dir. 
			dir ifNil: [ ^ self ].
			p := p + dir ]
]

{ #category : 'accessing' }
AoCMatrix >> wordAt: startPoint size: maxSize dir: dirPoint [

	| stream |
	
	stream := WriteStream on: (rows first class new: 0).
	self at: startPoint dir: dirPoint do: [ :each :point :cnt |
		stream nextPut: each.
		cnt >= maxSize
			ifTrue: [ ^ stream contents ] ].
	^ stream contents
]
