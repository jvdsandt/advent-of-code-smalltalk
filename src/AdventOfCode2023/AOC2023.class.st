Class {
	#name : 'AOC2023',
	#superclass : 'TestCase',
	#classVars : [
		'BaseDirectory'
	],
	#category : 'AdventOfCode2023',
	#package : 'AdventOfCode2023'
}

{ #category : 'accessing' }
AOC2023 class >> baseDirectory [

	^ BaseDirectory ifNil: [ FileSystem workingDirectory ]
]

{ #category : 'accessing' }
AOC2023 class >> baseDirectory: aDir [
	"AOC2023 baseDirectory: 'C:\Stuff\AoC_2023'"
	"AOC2023 baseDirectory: '/Users/jan/Projects/AdventOfCode2023'"

	BaseDirectory := aDir asFileReference 
]

{ #category : 'utilities' }
AOC2023 class >> readNumbers: line [
	"self readNumbers: ' 12 13   14 15'"

	| str coll |
	
	str := line readStream.
	coll := OrderedCollection new.
	str skipSeparators.
	[  str atEnd ] whileFalse: [ coll add: (str upTo: Character space) asInteger. str skipSeparators  ].
	^ coll
]
