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
AOC2024 class >> inputDay01 [

	^ self inputDay: 1
]

{ #category : 'accessing' }
AOC2024 class >> inputDay02 [

	^ self inputDay: 2
]

{ #category : 'accessing' }
AOC2024 class >> inputDay03 [

	^ self inputDay: 3
]

{ #category : 'accessing' }
AOC2024 class >> inputDay: aNumber [

	^ self baseDirectory / ('day', (aNumber printStringLength: 2 padded: true)) / 'input.txt'
]

{ #category : 'accessing' }
AOC2024 >> baseDirectory [

	^ self class baseDirectory
]

{ #category : 'actions' }
AOC2024 >> day01part1 [
	"self new day01part1"

	| list1 list2 sum |
	list1 := OrderedCollection new.
	list2 := OrderedCollection new.
	AOC2024 inputDay01 readStreamDo: [ :s |
		[ s atEnd ] whileFalse: [
			| line |
			line := s nextLine asIntegers.
			list1 add: line first.
			list2 add: line last ] ].

	list1 := list1 sorted.
	list2 := list2 sorted.
	sum := 0.
	list1 with: list2 do: [ :a :b | sum := sum + (a - b) abs ].
	^ sum
]

{ #category : 'actions' }
AOC2024 >> day01part2 [
	"self new day01part2"

	| list1 list2 sum |
	list1 := OrderedCollection new.
	list2 := OrderedCollection new.
	AOC2024 inputDay01 readStreamDo: [ :s |
		[ s atEnd ] whileFalse: [
			| line |
			line := s nextLine asIntegers.
			list1 add: line first.
			list2 add: line last ] ].

	sum := 0.
	list1 do: [ :each |
		sum := sum + (each * (list2 occurrencesOf: each)) ].
	^ sum
]

{ #category : 'tests' }
AOC2024 >> testBaseDirectory [
	"AOC2024 baseDirectory: 'C:\Stuff\AoC_2024'"
	"AOC2024 baseDirectory: '/Users/jan/Projects/AdventOfCode2024'"
	
	self assert: self baseDirectory exists
]
