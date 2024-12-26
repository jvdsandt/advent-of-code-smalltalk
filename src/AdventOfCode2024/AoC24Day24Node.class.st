Class {
	#name : 'AoC24Day24Node',
	#superclass : 'Object',
	#instVars : [
		'output'
	],
	#category : 'AdventOfCode2024',
	#package : 'AdventOfCode2024'
}

{ #category : 'instance creation' }
AoC24Day24Node class >> newFor: aSymbol gates: gateDict values: valueDict [

	valueDict at: aSymbol ifPresent: [ :v | ^ AoC24Day24ValueNode new init: aSymbol value: v ].
	
	gateDict at: aSymbol ifPresent: [ :gate |
		^ AoC24Day24GateNode new init: aSymbol op: gate first 
				input1: (self newFor: gate second gates: gateDict values: valueDict )
				input2: (self newFor: gate third gates: gateDict values: valueDict ) ].
			
	self error: 'Unknown symbol: ', aSymbol asString
]

{ #category : 'accessing' }
AoC24Day24Node >> index [

	^ output allButFirst asInteger
]

{ #category : 'accessing' }
AoC24Day24Node >> isValidAdd [

	^ false
]

{ #category : 'accessing' }
AoC24Day24Node >> op [

	^ nil
]

{ #category : 'accessing' }
AoC24Day24Node >> output [

	^ output
]

{ #category : 'as yet unclassified' }
AoC24Day24Node >> xname [

	^ ('x', output allButFirst) asSymbol 
]

{ #category : 'as yet unclassified' }
AoC24Day24Node >> xname: index [

	^ ('x', (index printStringBase: 10 length: 2 padded: true)) asSymbol
]

{ #category : 'as yet unclassified' }
AoC24Day24Node >> yname [

	^ ('y', output allButFirst) asSymbol 
]

{ #category : 'as yet unclassified' }
AoC24Day24Node >> yname: index [

	^ ('y', (index printStringBase: 10 length: 2 padded: true)) asSymbol
]
