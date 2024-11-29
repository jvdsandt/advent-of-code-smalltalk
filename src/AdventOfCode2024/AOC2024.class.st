Class {
	#name : 'AOC2024',
	#superclass : 'TestCase',
	#classVars : [
		'BaseDirectory'
	],
	#category : 'AdventOfCode2024',
	#package : 'AdventOfCode2024'
}

{ #category : 'accessing' }
AOC2024 class >> baseDirectory [

	^ BaseDirectory ifNil: [ FileSystem workingDirectory ]
]

{ #category : 'accessing' }
AOC2024 class >> baseDirectory: aString [

	BaseDirectory := aString asFileReference 
]

{ #category : 'accessing' }
AOC2024 >> baseDirectory [

	^ self class baseDirectory
]

{ #category : 'tests' }
AOC2024 >> testBaseDirectory [
	"AOC2024 baseDirectory: 'C:\Stuff\AoC_2024'"
	"AOC2024 baseDirectory: '/Users/jan/Projects/AdventOfCode2024'"
	
	self assert: self baseDirectory exists
]
