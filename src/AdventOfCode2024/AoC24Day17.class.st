Class {
	#name : 'AoC24Day17',
	#superclass : 'Object',
	#instVars : [
		'a',
		'b',
		'c',
		'ip',
		'instructions',
		'output'
	],
	#category : 'AdventOfCode2024',
	#package : 'AdventOfCode2024'
}

{ #category : 'examples' }
AoC24Day17 class >> part1 [

	^ AoC24 inputDay17 readStreamDo: [ :s | self part1: s ]
]

{ #category : 'examples' }
AoC24Day17 class >> part1: stream [

	| compu output |
	
	compu := self new initFrom: stream.
	output := compu run.
	
	^String streamContents: [ :str |
		output do: [ :each | each printOn: str ] ]
]

{ #category : 'accessing' }
AoC24Day17 >> a [

	^ a
]

{ #category : 'operations' }
AoC24Day17 >> adv: operand [

	a := a >> (self comboOperand: operand).
	ip := ip + 2
	
]

{ #category : 'accessing' }
AoC24Day17 >> b [

	^ b
]

{ #category : 'operations' }
AoC24Day17 >> bdv: operand [

	b := a >> (self comboOperand: operand).
	ip := ip + 2

]

{ #category : 'operations' }
AoC24Day17 >> bst: operand [

	| result |
	
	result := (self comboOperand: operand) \\ 8.
	b := result.
	ip := ip + 2
	
]

{ #category : 'operations' }
AoC24Day17 >> bxc: operand [

	| result |
	
	result := b bitXor: c.
	b := result.
	ip := ip + 2
	
]

{ #category : 'operations' }
AoC24Day17 >> bxl: operand [

	| result |
	
	result := b bitXor: operand.
	b := result.
	ip := ip + 2
	
]

{ #category : 'accessing' }
AoC24Day17 >> c [

	^ c
]

{ #category : 'operations' }
AoC24Day17 >> cdv: operand [

	c := a >> (self comboOperand: operand).
	ip := ip + 2
	
]

{ #category : 'as yet unclassified' }
AoC24Day17 >> comboOperand: value [
	
	(value between: 0 and: 3)
		ifTrue: [ ^ value ].
	value = 4
		ifTrue: [ ^ a ].
	value = 5
		ifTrue: [ ^ b ].		
	value = 6
		ifTrue: [ ^ c ].
	self error: 'Invalid operand'
]

{ #category : 'initialization' }
AoC24Day17 >> initFrom: stream [

	a := (stream upTo: $:; nextLine) trimBoth asInteger.
	b := (stream upTo: $:; nextLine) trimBoth asInteger.
	c := (stream upTo: $:; nextLine) trimBoth asInteger.
	stream nextLine.
	instructions := ((stream upTo: $:; upToEnd) trimBoth splitOn: $,) collect: [ :each | each asInteger ].
	ip := 0.
	output := OrderedCollection new
]

{ #category : 'accessing' }
AoC24Day17 >> ip [

	^ ip
]

{ #category : 'operations' }
AoC24Day17 >> jnz: operand [

	ip := a = 0 ifTrue: [ ip + 2 ] ifFalse: [ operand ]
]

{ #category : 'operations' }
AoC24Day17 >> out: operand [

	| result |
	
	result := (self comboOperand: operand) \\ 8.
	output add: result.
	ip := ip + 2
	
]

{ #category : 'accessing' }
AoC24Day17 >> output [

	^ output
]

{ #category : 'as yet unclassified' }
AoC24Day17 >> run [

	[ ip < instructions size ]
		whileTrue: [ self runStep ].
	^ output

]

{ #category : 'as yet unclassified' }
AoC24Day17 >> runStep [

	| ops opcode operand |
	
	opcode := instructions at: ip+1.
	operand := instructions at: ip+2.
	
	ops := Dictionary new
		at: 0 put: [ :arg | self adv: arg ];
		at: 1 put: [ :arg | self bxl: arg ];		
		at: 2 put: [ :arg | self bst: arg ];					
		at: 3 put: [ :arg | self jnz: arg ];					
		at: 4 put: [ :arg | self bxc: arg ];		
		at: 5 put: [ :arg | self out: arg ];		
		at: 6 put: [ :arg | self bdv: arg ];		
		at: 7 put: [ :arg | self cdv: arg ];
		yourself.
		
	(ops at: opcode) value: operand
		
	

]
