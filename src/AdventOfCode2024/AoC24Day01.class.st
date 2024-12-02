Class {
	#name : 'AoC24Day01',
	#superclass : 'Object',
	#category : 'AdventOfCode2024',
	#package : 'AdventOfCode2024'
}

{ #category : 'actions' }
AoC24Day01 class >> part1 [
	"self part1"

	^ self part1: AoC24 inputDay01
]

{ #category : 'actions' }
AoC24Day01 class >> part1: readstream [

	| list1 list2 sum |
	list1 := OrderedCollection new.
	list2 := OrderedCollection new.
	readstream linesDo: [ :each |
		| nrs |
		nrs := each substrings collect: [ :s | s asInteger ].
		list1 add: nrs first.
		list2 add: nrs last ].

	list1 := list1 sorted.
	list2 := list2 sorted.
	sum := 0.
	list1 with: list2 do: [ :a :b | sum := sum + (a - b) abs ].
	^ sum
]

{ #category : 'actions' }
AoC24Day01 class >> part2 [

	^ self part2: AoC24 inputDay01
]

{ #category : 'actions' }
AoC24Day01 class >> part2: readstream [

	| list1 list2 sum |
	list1 := OrderedCollection new.
	list2 := OrderedCollection new.
	readstream linesDo: [ :each |
		| nrs |
		nrs := each substrings collect: [ :s | s asInteger ].
		list1 add: nrs first.
		list2 add: nrs last ].

	sum := 0.
	list1 do: [ :each |
		sum := sum + (each * (list2 occurrencesOf: each)) ].
	^ sum
]
