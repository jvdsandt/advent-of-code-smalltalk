Class {
	#name : #AoC24Day13,
	#superclass : #Object,
	#category : #AdventOfCode2024
}

{ #category : #examples }
AoC24Day13 class >> calcCost2: da with: db with: pmin [

	| p a b |
	
	p := pmin + (10000000000000 @ 10000000000000).
	a := (p y - ((p x * db y) / db x)) / (da y - ((da x * db y) / db x)).
	a isInteger
		ifFalse: [ ^ 0 ].
	b := (p x / db x) - ((da x / db x) * a).
	b isInteger
		ifFalse: [ ^ 0 ].
	
	^ ( a * 3) + b
]

{ #category : #examples }
AoC24Day13 class >> calcCost: da with: db with: p [

	| a b |
	
	a := (p y - ((p x * db y) / db x)) / (da y - ((da x * db y) / db x)).
	a isInteger
		ifFalse: [ ^ 0 ].
	b := (p x / db x) - ((da x / db x) * a).
	b isInteger
		ifFalse: [ ^ 0 ].
	
	^ ( a * 3) + b
]

{ #category : #examples }
AoC24Day13 class >> parse: stream [	

	| ba bb prize list |
	
	list := OrderedCollection new.
	[ stream atEnd ] whileFalse: [ 
		ba := self parseXY: stream nextLine readStream.
		bb := self parseXY: stream nextLine readStream.
		prize := self parseXY: stream nextLine readStream.
		stream nextLine.
		list add: (Array with: ba with: bb with: prize) ].
	^ list
]

{ #category : #examples }
AoC24Day13 class >> parseXY: stream [	

	| x y |
	
	stream upTo: $X.
	x := (stream upTo: $,) asInteger.
	stream upTo: $Y.
	y := (stream upTo: Character cr) asInteger.
	^ x @ y
]

{ #category : #examples }
AoC24Day13 class >> part1 [

	^ AoC24 inputDay13 readStreamDo: [ :s | self part1: s ]
]

{ #category : #examples }
AoC24Day13 class >> part1: stream [

	| list |
	
	list := self parse: stream.
	
	^ list inject: 0 into: [ :sum :each | 
			sum + (self calcCost: each first with: each second with: each third) ]
]

{ #category : #examples }
AoC24Day13 class >> part2 [

	^ AoC24 inputDay13 readStreamDo: [ :s | self part2: s ]
]

{ #category : #examples }
AoC24Day13 class >> part2: stream [

	| list |
	
	list := self parse: stream.
	
	^ list inject: 0 into: [ :sum :each | 
			sum + (self calcCost2: each first with: each second with: each third) ]
]
