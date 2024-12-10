Class {
	#name : 'AoC24Day09FreeBlock',
	#superclass : 'AoC24Day09Block',
	#instVars : [
		'id'
	],
	#category : 'AdventOfCode2024',
	#package : 'AdventOfCode2024'
}

{ #category : 'testing' }
AoC24Day09FreeBlock >> isFreeBlock [

	^ true
]

{ #category : 'printing' }
AoC24Day09FreeBlock >> printOn: stream [

	^ size timesRepeat: [ stream nextPut: $. ]
]
