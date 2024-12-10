Extension { #name : 'SequenceableCollection' }

{ #category : '*AdventOfCode2023' }
SequenceableCollection >> findFirst: aBlock startingAt: start [
	"Return the index of my first element for which aBlock evaluates as true.
	If no matching element is found, return 0"

	"(#(1 5 10) findFirst: [ :each | each > 3 ]) >>> 2"
	"(#(1 5 10) findFirst: [ :each | each > 15 ]) >>> 0"

	| index |
	index := start - 1.
	[(index := index + 1) <= self size] whileTrue:
		[(aBlock value: (self at: index)) ifTrue: [^index]].
	^ 0
]

{ #category : '*AdventOfCode2023' }
SequenceableCollection >> findLast: aBlock startingAt: start [
	"Return the index of my last element for which aBlock evaluates as true.
	If no matching element is found, return 0"

	"(#(10 20 30 40 50) findLast: [ :each | each > 10 ]) >>> 5"
	"(#(10 20 30 40 50) findLast: [ :each | each > 60 ]) >>> 0"

	| index |
	index := start + 1.
	[(index := index - 1) >= 1] whileTrue:
		[(aBlock value: (self at: index)) ifTrue: [^index]].
	^ 0
]
