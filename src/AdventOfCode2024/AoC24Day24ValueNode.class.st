Class {
	#name : 'AoC24Day24ValueNode',
	#superclass : 'AoC24Day24Node',
	#instVars : [
		'value'
	],
	#category : 'AdventOfCode2024',
	#package : 'AdventOfCode2024'
}

{ #category : 'as yet unclassified' }
AoC24Day24ValueNode >> init: aSymbol value: aValue [

	output := aSymbol.
	value := aValue
]

{ #category : 'printing' }
AoC24Day24ValueNode >> printOn: str [

	output printOn: str
]
