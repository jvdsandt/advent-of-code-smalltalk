Class {
	#name : 'AoC24Day22',
	#superclass : 'Object',
	#category : 'AdventOfCode2024',
	#package : 'AdventOfCode2024'
}

{ #category : 'accessing' }
AoC24Day22 class >> digitsEvolveNr: nr times: cnt [

	| result digits map |
	
	result := nr.
	digits := Array new: cnt.
	1 to: cnt do: [ :idx |
		digits at: idx put: result \\ 10.
		result := self evolveNr: result ].

	map := Dictionary new.
	5 to: cnt do: [ :idx |
		| changes |
		changes := (4 to: 1 by: -1) collect: [ :i2 | (digits at: idx-i2+1) - (digits at: idx-i2) ].
		(map includesKey: changes)
			ifFalse: [ map at: changes put: (digits at: idx) ] ].
	^ map
]

{ #category : 'accessing' }
AoC24Day22 class >> evolveNr: nr [

	| result |
	
	result := self prune: ((self mix: (nr * 64) into: nr)).
	result := self prune: ((self mix: (result / 32) truncated into: result)).
	result := self prune: ((self mix: (result * 2048) into: result)).

	^ result
]

{ #category : 'accessing' }
AoC24Day22 class >> evolveNr: nr times: cnt [

	| result |
	
	result := nr.
	cnt timesRepeat: [ result := self evolveNr: result ].
	^ result
]

{ #category : 'accessing' }
AoC24Day22 class >> mix: aValue into: nr [

	^ aValue bitXor: nr
]

{ #category : 'examples' }
AoC24Day22 class >> part1 [

	^ AoC24 inputDay22 readStreamDo: [ :s | self part1: s ]
]

{ #category : 'examples' }
AoC24Day22 class >> part1: stream [

	| inputs results |
	
	inputs := stream linesCollect: [ :each | each asInteger ].
	
	results := inputs collect: [ :each | self evolveNr: each times: 2000 ].
	
	^ results sum 
]

{ #category : 'examples' }
AoC24Day22 class >> part2 [

	^ AoC24 inputDay22 readStreamDo: [ :s | self part2: s ]
]

{ #category : 'examples' }
AoC24Day22 class >> part2: stream [

	| inputs maps keys bestScore |
	
	inputs := stream linesCollect: [ :each | each asInteger ].
	
	maps := inputs collect: [ :each | self digitsEvolveNr: each times: 2000 ].
	keys := Set new.
	maps do: [ :each | keys addAll: each keys ].
	bestScore := -1.
	keys do: [ :eachKey |
		| score |
		score := (maps collect: [ :eachMap | eachMap at: eachKey ifAbsent: [ 0 ] ]) sum.
		score > bestScore
			ifTrue: [ bestScore := score ] ].
		
	^ bestScore
]

{ #category : 'accessing' }
AoC24Day22 class >> prune: nr [

	^ nr \\ 16777216
]
