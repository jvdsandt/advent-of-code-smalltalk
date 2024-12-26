Class {
	#name : 'AoC24Day24',
	#superclass : 'Object',
	#category : 'AdventOfCode2024',
	#package : 'AdventOfCode2024'
}

{ #category : 'as yet unclassified' }
AoC24Day24 class >> dumpGates: symbol gates: gates on: stream [

	gates at: symbol 
		ifPresent: [ :gate |
			stream nextPutAll: '('.
			stream nextPutAll: gate first; space. 
			self dumpGates: gate second gates: gates on: stream.
			stream nextPutAll: ', '.
			self dumpGates: gate third gates: gates on: stream.
			stream nextPutAll: ')']
		ifAbsent: [ stream nextPutAll: symbol ]
]

{ #category : 'as yet unclassified' }
AoC24Day24 class >> evaluate: symbol values: values gates: gates [

	| gate |
	
	values at: symbol ifPresent: [ :v | ^ v = 1 ].
	gate := gates at: symbol.

	gate first = #XOR
		ifTrue: [ 
			^ (self evaluate: gate second values: values gates: gates) ~= (self evaluate: gate third values: values gates: gates) ].
		
	gate first = #AND
		ifTrue: [ 
			^ (self evaluate: gate second values: values gates: gates) and: [ (self evaluate: gate third values: values gates: gates) ] ].
		
	gate first = #OR
		ifTrue: [ 
			^ (self evaluate: gate second values: values gates: gates) or: [ (self evaluate: gate third values: values gates: gates) ] ].
		
	self error: 'Unknown symbol'
]

{ #category : 'testing' }
AoC24Day24 class >> getAddGateFor: symbol gates: gates [

	| index xsym ysym |
	
	index := symbol allButFirst asInteger.
	xsym := ('x', symbol allButFirst) asSymbol.
	ysym := ('y', symbol allButFirst) asSymbol.

	self getXORFor: xsym and: ysym.
]

{ #category : 'testing' }
AoC24Day24 class >> isCorrentAddition: symbol gates: gates [

	
]

{ #category : 'examples' }
AoC24Day24 class >> part1 [

	^ AoC24 inputDay24 readStreamDo: [ :s | self part1: s ]
]

{ #category : 'examples' }
AoC24Day24 class >> part1: stream [

	| values gates zkeys outputs |
	
	values := Dictionary new.
	gates := nil.
	[ stream atEnd ] whileFalse: [ 
		| line |
		line := stream nextLine.
		gates ifNil: [ 
			line trimBoth isEmpty
				ifTrue: [ gates := Dictionary new ]
				ifFalse: [ 
					| parts |
					parts := line splitOn: $:.
					values at: parts first asSymbol put: parts last trimBoth asInteger ] ]
			ifNotNil: [ 
				| parts |
				parts := line splitOn: Character space.
				gates at: parts last asSymbol put: (Array with: parts second asSymbol with: parts first with: parts third) ] ].
		
	zkeys := (gates keys select: [ :each | each first = $z ]) sorted.
	outputs := WriteStream on: (String new: 100).
	zkeys reverseDo: [ :each |
		outputs nextPutAll: ((self evaluate: each values: values gates: gates) ifTrue: [ '1' ] ifFalse: [ '0' ]) ].
	
	^ Integer readFrom: outputs contents readStream base: 2
]

{ #category : 'examples' }
AoC24Day24 class >> part2 [

	^ AoC24 inputDay24 readStreamDo: [ :s | self part2: s ]
]

{ #category : 'examples' }
AoC24Day24 class >> part2: stream [
	"
		z = (x XOR y XOR cin)
		cout = (x AND y) OR (cin OR (x XOR y))
	"

	| values gates zkeys ztrees |
	
	values := Dictionary new.
	gates := nil.
	[ stream atEnd ] whileFalse: [ 
		| line |
		line := stream nextLine.
		gates ifNil: [ 
			line trimBoth isEmpty
				ifTrue: [ gates := Dictionary new ]
				ifFalse: [ 
					| parts |
					parts := line splitOn: $:.
					values at: parts first asSymbol put: parts last trimBoth asInteger ] ]
			ifNotNil: [ 
				| parts |
				parts := line splitOn: Character space.
				gates at: parts last asSymbol put: (Array with: parts second asSymbol with: parts first with: parts third) ] ].
		
	zkeys := (gates keys select: [ :each | each first = $z ]) sorted.
	ztrees := zkeys collect: [ :sym | AoC24Day24Node newFor: sym gates: gates  values: values ].
self halt.
	ztrees := ztrees reject: [ :each | each isValidAdd ].
	ztrees inspect
]
