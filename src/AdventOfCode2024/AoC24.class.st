Class {
	#name : 'AoC24',
	#superclass : 'Object',
	#classVars : [
		'BaseDirectory'
	],
	#category : 'AdventOfCode2024',
	#package : 'AdventOfCode2024'
}

{ #category : 'accessing' }
AoC24 class >> baseDirectory [

	^ BaseDirectory ifNil: [ FileSystem workingDirectory ]
]

{ #category : 'accessing' }
AoC24 class >> baseDirectory: aString [

	BaseDirectory := aString asFileReference 
]

{ #category : 'accessing' }
AoC24 class >> inputDay01 [

	^ self inputDay: 1
]

{ #category : 'accessing' }
AoC24 class >> inputDay02 [

	^ self inputDay: 2
]

{ #category : 'accessing' }
AoC24 class >> inputDay03 [

	^ self inputDay: 3
]

{ #category : 'accessing' }
AoC24 class >> inputDay04 [

	^ self inputDay: 4
]

{ #category : 'accessing' }
AoC24 class >> inputDay05 [

	^ self inputDay: 5
]

{ #category : 'accessing' }
AoC24 class >> inputDay06 [

	^ self inputDay: 6
]

{ #category : 'accessing' }
AoC24 class >> inputDay07 [

	^ self inputDay: 7
]

{ #category : 'accessing' }
AoC24 class >> inputDay08 [

	^ self inputDay: 8
]

{ #category : 'accessing' }
AoC24 class >> inputDay09 [

	^ self inputDay: 9
]

{ #category : 'accessing' }
AoC24 class >> inputDay: aNumber [

	^ self baseDirectory / ('day', (aNumber printStringLength: 2 padded: true)) / 'input.txt'
]
