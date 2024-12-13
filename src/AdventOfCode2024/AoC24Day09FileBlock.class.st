Class {
	#name : #AoC24Day09FileBlock,
	#superclass : #AoC24Day09Block,
	#instVars : [
		'id'
	],
	#category : 'AdventOfCode2024'
}

{ #category : #accessing }
AoC24Day09FileBlock >> id [

	^ id
]

{ #category : #'as yet unclassified' }
AoC24Day09FileBlock >> initStart: aStart size: aSize id: anId [

	super initStart: aStart size: aSize. 
	id := anId
]

{ #category : #testing }
AoC24Day09FileBlock >> isFileBlock [

	^ true
]

{ #category : #printing }
AoC24Day09FileBlock >> printOn: stream [

	^ size timesRepeat: [ stream nextPut: id asString first ]
]
