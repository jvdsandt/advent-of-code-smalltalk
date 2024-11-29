Class {
	#name : #AOC2024,
	#superclass : #TestCase,
	#classVars : [
		'BaseDirectory'
	],
	#category : #AdventOfCode2024
}

{ #category : #accessing }
AOC2024 class >> baseDirectory [

	^ BaseDirectory
]

{ #category : #accessing }
AOC2024 class >> baseDirectory: aString [

	BaseDirectory := aString
]

{ #category : #accessing }
AOC2024 >> baseDirectory [

	^ self class baseDirectory
]

{ #category : #tests }
AOC2024 >> testBaseDirectory [
	"AOC2024 baseDirectory: 'C:\Stuff\AoC_2024'"
	
	self assert: self baseDirectory asFileReference exists
]
