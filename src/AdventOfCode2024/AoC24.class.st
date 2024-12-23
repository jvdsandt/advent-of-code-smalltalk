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
AoC24 class >> inputDay10 [

	^ self inputDay: 10
]

{ #category : 'accessing' }
AoC24 class >> inputDay11 [

	^ self inputDay: 11
]

{ #category : 'accessing' }
AoC24 class >> inputDay12 [

	^ self inputDay: 12
]

{ #category : 'accessing' }
AoC24 class >> inputDay13 [

	^ self inputDay: 13
]

{ #category : 'accessing' }
AoC24 class >> inputDay14 [

	^ self inputDay: 14
]

{ #category : 'accessing' }
AoC24 class >> inputDay15 [

	^ self inputDay: 15
]

{ #category : 'accessing' }
AoC24 class >> inputDay16 [

	^ self inputDay: 16
]

{ #category : 'accessing' }
AoC24 class >> inputDay17 [

	^ self inputDay: 17
]

{ #category : 'accessing' }
AoC24 class >> inputDay18 [

	^ self inputDay: 18
]

{ #category : 'accessing' }
AoC24 class >> inputDay19 [

	^ self inputDay: 19
]

{ #category : 'accessing' }
AoC24 class >> inputDay20 [

	^ self inputDay: 20
]

{ #category : 'accessing' }
AoC24 class >> inputDay21 [

	^ self inputDay: 21
]

{ #category : 'accessing' }
AoC24 class >> inputDay22 [

	^ self inputDay: 22
]

{ #category : 'accessing' }
AoC24 class >> inputDay23 [

	^ self inputDay: 23
]

{ #category : 'accessing' }
AoC24 class >> inputDay24 [

	^ self inputDay: 24
]

{ #category : 'accessing' }
AoC24 class >> inputDay25 [

	^ self inputDay: 25
]

{ #category : 'accessing' }
AoC24 class >> inputDay: aNumber [

	^ self baseDirectory / ('day', (aNumber printStringLength: 2 padded: true)) / 'input.txt'
]
