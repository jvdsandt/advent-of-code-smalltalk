Class {
	#name : #AoC24Day05,
	#superclass : #Object,
	#category : 'AdventOfCode2024'
}

{ #category : #testing }
AoC24Day05 class >> isOrdered: nrs dict: beforeDict [

	2 to: nrs size do: [ :idx |
		| before after |
		before := beforeDict at: (nrs at: idx) ifAbsent: [ #() ].
		before notEmpty 
			ifTrue: [ 
				after := nrs copyFrom: 1 to: idx-1.
				(before intersection: after) notEmpty 
					ifTrue: [ ^ false ] ] ].
	^ true
]

{ #category : #examples }
AoC24Day05 class >> part1 [

	^ AoC24 inputDay05 readStreamDo: [ :s | self part1: s ]
]

{ #category : #actions }
AoC24Day05 class >> part1: stream [

	| beforeDict lines |
	
	beforeDict := Dictionary new.
	lines := OrderedCollection new.
	stream linesDo: [ :line |
		| nrs |
		(line includes: $|)
			ifTrue: [ 
				nrs := (line splitOn: $|) collect: [ :each | each asInteger ].
				(beforeDict at: nrs first ifAbsentPut: [ Set new ]) add: nrs last ].
		(line includes: $,)
			ifTrue: [ 
				nrs := (line splitOn: $,) collect: [ :each | each asInteger ].
				lines add: nrs ] ].
		
	lines := lines select: [ :eachNrs |
		self isOrdered: eachNrs dict: beforeDict ].		
		
	^ (lines collect: [ :eachNrs | eachNrs middle ]) sum
]

{ #category : #examples }
AoC24Day05 class >> part2 [

	^ AoC24 inputDay05 readStreamDo: [ :s | self part2: s ]
]

{ #category : #actions }
AoC24Day05 class >> part2: stream [

	| beforeDict lines |
	
	beforeDict := Dictionary new.
	lines := OrderedCollection new.
	stream linesDo: [ :line |
		| nrs |
		(line includes: $|)
			ifTrue: [ 
				nrs := (line splitOn: $|) collect: [ :each | each asInteger ].
				(beforeDict at: nrs first ifAbsentPut: [ Set new ]) add: nrs last ].
		(line includes: $,)
			ifTrue: [ 
				nrs := (line splitOn: $,) collect: [ :each | each asInteger ].
				lines add: nrs ] ].
		
	lines := lines reject: [ :eachNrs |
		self isOrdered: eachNrs dict: beforeDict ].		
			
	lines := lines collect: [ :eachNrs | self sort: eachNrs dict: beforeDict ].
		
	^ (lines collect: [ :eachNrs | eachNrs middle ]) sum
]

{ #category : #sorting }
AoC24Day05 class >> sort: nrs dict: beforeDict [

	| sortedNrs |
	
	sortedNrs := nrs copy.
	nrs do: [ :nr |
		| idx allBefore |
		idx := sortedNrs indexOf: nr.
		allBefore := sortedNrs copyFrom: 1 to: idx-1.
		allBefore notEmpty 
			ifTrue: [
				| set swap | 
				set := beforeDict at: nr ifAbsent: [ #() ].
				swap := allBefore detect: [ :eachNr | set includes: eachNr ] ifNone: [ nil ].
				swap ifNotNil: [ 
					sortedNrs remove: nr.
					sortedNrs add: nr before: swap ] ] ].
	^ sortedNrs
]
