Class {
	#name : 'AoC24Day24GateNode',
	#superclass : 'AoC24Day24Node',
	#instVars : [
		'op',
		'inputs'
	],
	#category : 'AdventOfCode2024',
	#package : 'AdventOfCode2024'
}

{ #category : 'as yet unclassified' }
AoC24Day24GateNode >> init: aSymbol op: opSymbol input1: node1 input2: node2 [

	output := aSymbol.
	op := opSymbol.
	inputs := Array with: node1 with: node2
]

{ #category : 'accessing' }
AoC24Day24GateNode >> inputNames [

	^ (inputs collect: [ :each | each output ]) asSet
]

{ #category : 'accessing' }
AoC24Day24GateNode >> inputs [

	^ inputs
]

{ #category : 'accessing' }
AoC24Day24GateNode >> isValidAdd [

	| xorGate otherGate |
	
	op = #XOR
		ifFalse: [ ^ false ].
	self index = 0
		ifTrue: [ ^ op = #XOR and: [ self inputNames = (Set with: #x00 with: #y00) ] ].
		
	xorGate := inputs detect: [ :e | e op = #XOR ] ifNone: [ ^ false ].
	(xorGate inputNames = (Set with: self xname with: self yname))
		ifFalse: [ ^ false ].
	
	otherGate := inputs detect: [ :e | e ~= xorGate ].
	(otherGate isValidCout: self index - 1)
		ifFalse: [ ^ false ].
		
	^ true
	
	
]

{ #category : 'accessing' }
AoC24Day24GateNode >> isValidCout: index [

	| andGate orGate xorGate otherGate |
	
	index = 0
		ifTrue: [ ^ op = #AND and: [ self inputNames = (Set with: #x00 with: #y00) ] ].
	self op = #OR
		ifFalse: [ ^ false ].
		
	andGate := inputs detect: [ :e | e op = #AND ] ifNone: [ ^ false ].
	(andGate inputNames = (Set with: (self xname: index) with: (self yname: index )))
		ifFalse: [ ^ false ].
	
	orGate := inputs detect: [ :e | e op = #OR ] ifNone: [ ^ false ].
		
	xorGate := orGate inputs detect: [ :e | e op = #XOR ] ifNone: [ ^ false ].
	(xorGate inputNames = (Set with: (self xname: index) with: (self yname: index )))
		ifFalse: [ ^ false ].
		
	otherGate := orGate inputs detect: [ :e | e ~= xorGate ].
	^ otherGate isValidCout: index-1
]

{ #category : 'accessing' }
AoC24Day24GateNode >> op [ 

	^ op
]

{ #category : 'printing' }
AoC24Day24GateNode >> printOn: str [

	output printOn: str.
	str nextPutAll: ': '. 
	op printOn: str.
	str nextPutAll: '('.
	inputs do: [ :e | e printOn: str ] separatedBy: [ str nextPut: $, ].
	str nextPut: $)
]
