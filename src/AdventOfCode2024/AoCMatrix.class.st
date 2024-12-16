Class {
	#name : #AoCMatrix,
	#superclass : #Object,
	#instVars : [
		'rows',
		'maxX',
		'maxY'
	],
	#category : #AdventOfCode2024
}

{ #category : #'instance creation' }
AoCMatrix class >> from: aReadStream [

	^ self fromRows: (aReadStream linesCollect: [ :each | each]) asArray
]

{ #category : #'instance creation' }
AoCMatrix class >> fromRows: aCollection [

	^ self new initRows: aCollection
]

{ #category : #accessing }
AoCMatrix >> allDirections [

	^ { 1 @ 0. 1 @ 1. 0 @ 1. -1 @ 1. -1 @ 0. -1 @ -1. 0 @ -1. 1 @ -1 }
]

{ #category : #accessing }
AoCMatrix >> allValues [

	| values |
	
	values := Set new.
	self doWithCells: [ :eachValue | values add: eachValue ].
	^ values
]

{ #category : #converting }
AoCMatrix >> asRectangle [

	^ Rectangle point: (1 @ 1) point: (maxX @ maxY)
]

{ #category : #accessing }
AoCMatrix >> at: aPoint [

	^ (rows at: aPoint y) at: aPoint x
]

{ #category : #iterating }
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

{ #category : #accessing }
AoCMatrix >> at: aPoint ifOutside: aBlock [

	^ (self isInside: aPoint)
		ifTrue: [ self at: aPoint ]
		ifFalse: [ aBlock value ]
]

{ #category : #accessing }
AoCMatrix >> at: aPoint put: aValue [

	(rows at: aPoint y) at: aPoint x put: aValue
]

{ #category : #converting }
AoCMatrix >> convertToInteger [

	1 to: maxY do: [ :y |
		rows at: y put: ((rows at: y) asArray collect: [ :ch | 
			ch isDigit 
				ifTrue: [ ch asInteger - 48 ]
				ifFalse: [ch ] ]) ]

]

{ #category : #counting }
AoCMatrix >> countWord: word [

	| sum |
	
	sum := 0.
	self doWithCells: [ :each :point |
		(self at: point) = word first
			ifTrue: [ sum := sum + (self countWord: word at: point) ] ].
	^ sum
]

{ #category : #counting }
AoCMatrix >> countWord: word at: aPoint [

	^ (self allDirections collect: [ :eachDir | self countWord: word at: aPoint dir: eachDir ]) sum
]

{ #category : #counting }
AoCMatrix >> countWord: word at: aPoint dir: dirPoint [

	| p |
	
	p := aPoint.
	1 to: word size do: [ :idx |
		((self at: p ifOutside: [ ^ 0 ]) = (word at: idx))
			ifFalse: [ ^ 0 ].
		p := p + dirPoint ].
	^ 1
]

{ #category : #iterating }
AoCMatrix >> doWithCells: aBlock [

	rows doWithIndex: [ :line :y |
		line doWithIndex: [ :each :x |
			aBlock cull: each cull: x @ y ] ]
]

{ #category : #accessing }
AoCMatrix >> findAllPos: aValue [

	| list |
	
	list := OrderedCollection new.
	1 to: maxY do: [ :y |
		1 to: maxX do: [ :x |
			(self at: x @ y) = aValue
				ifTrue: [ list add: x @ y ] ] ].
	^ list
]

{ #category : #accessing }
AoCMatrix >> findPos: aValue [

	1 to: maxY do: [ :y |
		| idx |
		idx := (rows at: y) indexOf: aValue.
		idx > 0
			ifTrue: [ ^ idx @ y ] ].
	self error: 'Not found'
]

{ #category : #accessing }
AoCMatrix >> getPlotPoints: p [
	
	| points |
	
	points := Set new.
	self getPlotPoints: p value: (self at: p) visited: points.
	^ points
]

{ #category : #accessing }
AoCMatrix >> getPlotPoints: p value: value visited: visited [
	
	visited add: p.
	{ 1 @ 0. 0 @ 1. -1 @ 0. 0 @ -1 } do: [ :dir | 
		((self isInside: p + dir) and: [ (self at: p + dir) = value ])
			ifTrue: [ 
				(visited includes: p + dir)
					ifFalse: [ self getPlotPoints: p + dir value: value visited: visited ] ] ].

]

{ #category : #initialization }
AoCMatrix >> initRows: aColl [

	maxX := aColl isEmpty 
		ifTrue: [ 0 ]
		ifFalse: [ aColl first size ].
	maxY := aColl size.
	rows := aColl.
	
	(rows allSatisfy: [ :each | each size = maxX ])
		ifFalse: [ self error: 'Row size mismatch' ]
]

{ #category : #testing }
AoCMatrix >> isInside: aPoint [

	^ (aPoint x between: 1 and: maxX) and: [ aPoint y between: 1 and: maxY ]
]

{ #category : #testing }
AoCMatrix >> isOutside: aPoint [

	^ (self isInside: aPoint) not
]

{ #category : #accessing }
AoCMatrix >> maxX [

	^ maxX
]

{ #category : #accessing }
AoCMatrix >> maxY [

	^ maxY
]

{ #category : #printing }
AoCMatrix >> printOn: stream [

	rows do: [ :each |
		each do: [ :v |
			v isCharacter 
				ifTrue: [ stream nextPut: v ]
				ifFalse: [ stream nextPutAll: v asString ] ].
		stream cr ]
]

{ #category : #printing }
AoCMatrix >> printWith: path on: stream [

	rows doWithIndex: [ :each :y |
		each doWithIndex: [ :v :x |
			| p |
			p := path detect: [ :e | e key = (x @ y) ] ifNone: [ nil ].
			p 
				ifNotNil: [ stream nextPut: $* ]
				ifNil: [  
					v isCharacter 
						ifTrue: [ stream nextPut: v ]
						ifFalse: [ stream nextPutAll: v asString ] ] ].
		stream cr ]
]

{ #category : #iterating }
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

{ #category : #accessing }
AoCMatrix >> wordAt: startPoint size: maxSize dir: dirPoint [

	| stream |
	
	stream := WriteStream on: (rows first class new: 0).
	self at: startPoint dir: dirPoint do: [ :each :point :cnt |
		stream nextPut: each.
		cnt >= maxSize
			ifTrue: [ ^ stream contents ] ].
	^ stream contents
]
