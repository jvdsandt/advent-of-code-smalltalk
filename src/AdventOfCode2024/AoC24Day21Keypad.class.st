Class {
	#name : 'AoC24Day21Keypad',
	#superclass : 'Object',
	#instVars : [
		'keys',
		'pos',
		'controller',
		'buttonPresses'
	],
	#category : 'AdventOfCode2024',
	#package : 'AdventOfCode2024'
}

{ #category : 'actions' }
AoC24Day21Keypad >> activate [

	self moveTo: $A
]

{ #category : 'actions' }
AoC24Day21Keypad >> addButtonPress: aValue [

	buttonPresses ifNil: [ buttonPresses := OrderedCollection new ].
	buttonPresses add: aValue
]

{ #category : 'accessing' }
AoC24Day21Keypad >> buttonPresses [

	^ buttonPresses
]

{ #category : 'accessing' }
AoC24Day21Keypad >> controller [

	^ controller
]

{ #category : 'accessing' }
AoC24Day21Keypad >> controller: anObject [

	controller := anObject
]

{ #category : 'accessing' }
AoC24Day21Keypad >> countPressed [

	^ controller 
		ifNotNil: [ controller countPressed ] 
		ifNil: [ buttonPresses ifNotNil: [ buttonPresses size ] ifNil: [ 0 ] ]
]

{ #category : 'actions' }
AoC24Day21Keypad >> ctrlActivate [

	controller 
		ifNotNil: [ controller activate ]
		ifNil: [ self addButtonPress: $A ]
]

{ #category : 'actions' }
AoC24Day21Keypad >> ctrlMoveTo: aValue [

	controller 
		ifNotNil: [ controller moveTo: aValue ]
		ifNil: [ self addButtonPress: aValue ]
]

{ #category : 'actions' }
AoC24Day21Keypad >> distanceTo: aValue [

	| p |
	
	p := keys findPos: aValue.
	^ (pos x - p x) abs + (pos y - p y) abs
]

{ #category : 'initialization' }
AoC24Day21Keypad >> initDirectional [

	keys := AoCMatrix from: ' ^A
<v>' readStream.
	pos := 3 @ 1
]

{ #category : 'initialization' }
AoC24Day21Keypad >> initNumeric [

	keys := AoCMatrix from: '789
456
123
 0A' readStream.
	pos := 3 @ 4
]

{ #category : 'actions' }
AoC24Day21Keypad >> moveTo: aValue [

	| newPos xd yd startCnt |
	
	startCnt := self countPressed.
	newPos := keys findPos: aValue.
	xd := newPos x - pos x.
	yd := newPos y - pos y.
	
	(controller notNil and: [ xd ~= 0 and: [ yd ~= 0 ] ])
		ifTrue: [ 
			| ctrlX ctrlY |
			ctrlY := yd > 0 ifTrue: [ $v ] ifFalse: [ $^ ].
			ctrlX := xd > 0 ifTrue: [ $> ] ifFalse: [ $< ].

				 ]
		ifFalse: [ 
			self moveY: yd.
			self moveX: xd ].
	pos := newPos
]

{ #category : 'actions' }
AoC24Day21Keypad >> moveX: xd [

	| ctrlValue |
	
	xd ~= 0 ifTrue: [ 
		ctrlValue := xd > 0 ifTrue: [ $> ] ifFalse: [ $< ].
		self ctrlMoveTo: ctrlValue.
		xd timesRepeat: [ self ctrlActivate ] ]
]

{ #category : 'actions' }
AoC24Day21Keypad >> moveY: yd [

	| ctrlValue |
	
	yd ~= 0 ifTrue: [  
		ctrlValue := yd > 0 ifTrue: [ $v ] ifFalse: [ $^ ].
		self ctrlMoveTo: ctrlValue.
		yd timesRepeat: [ self ctrlActivate ] ]
]

{ #category : 'accessing' }
AoC24Day21Keypad >> pos [

	^ pos
]
