Class {
	#name : #AoC24Day09Block,
	#superclass : #Object,
	#instVars : [
		'start',
		'size'
	],
	#category : 'AdventOfCode2024'
}

{ #category : #comparing }
AoC24Day09Block >> <= other [

	^ start <= other start
]

{ #category : #initialization }
AoC24Day09Block >> initStart: aStart size: aSize [

	start := aStart.
	size := aSize
]

{ #category : #testing }
AoC24Day09Block >> isFileBlock [

	^ false
]

{ #category : #testing }
AoC24Day09Block >> isFreeBlock [

	^ false
]

{ #category : #accessing }
AoC24Day09Block >> size [

	^ size
]

{ #category : #accessing }
AoC24Day09Block >> size: anObject [

	size := anObject
]

{ #category : #accessing }
AoC24Day09Block >> start [

	^ start
]

{ #category : #accessing }
AoC24Day09Block >> start: anObject [

	start := anObject
]
