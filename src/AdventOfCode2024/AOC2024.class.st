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

{ #category : 'accessing' }
AOC2024 >> day01part1 [
	"self new day01part1"

	| list1 list2 sum |
	list1 := OrderedCollection new.
	list2 := OrderedCollection new.
	AOC2024 baseDirectory / 'day01' / 'input.txt' readStreamDo: [ :s |
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

{ #category : 'accessing' }
AOC2024 >> day01part2 [
	"self new day01part2"

	| list1 list2 sum |
	list1 := OrderedCollection new.
	list2 := OrderedCollection new.
	AOC2024 baseDirectory / 'day01' / 'input.txt' readStreamDo: [ :s |
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
