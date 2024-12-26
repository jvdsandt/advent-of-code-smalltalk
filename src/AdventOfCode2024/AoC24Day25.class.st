Class {
	#name : 'AoC24Day25',
	#superclass : 'Object',
	#category : 'AdventOfCode2024',
	#package : 'AdventOfCode2024'
}

{ #category : 'testing' }
AoC24Day25 class >> isMatchKey: key lock: lock [

	key with: lock do: [ :k :l |
		k + l > 5
			ifTrue: [ ^ false ] ].
	^ true
]

{ #category : 'parsing' }
AoC24Day25 class >> parse: stream [
	"AoC24 inputDay25 readStreamDo: [ :s | self parse: s ]"

	| groups locks keys |
	
	groups := (stream linesCollect: [ :each | each trimBoth ]) splitOn: [:l | l isEmpty].
	locks := OrderedCollection new.
	keys := OrderedCollection new.
	groups do: [ :each |
		| nrs |
		nrs := (1 to: 5) collect: [ :idx | (each select: [ :line | (line at: idx) = $# ]) size - 1 ].
		each first first = $#
			ifTrue: [ locks add: nrs ]
			ifFalse: [ keys add: nrs ] ].
		
	^ keys -> locks
]

{ #category : 'examples' }
AoC24Day25 class >> part1 [

	^ AoC24 inputDay25 readStreamDo: [ :s | self part1: s ]
]

{ #category : 'examples' }
AoC24Day25 class >> part1: stream [

	| kv locks keys pairs |
	
	kv := self parse: stream.
	keys := kv key.
	locks := kv value.
	
	pairs := OrderedCollection new.
	
	keys do: [ :key |
		locks do: [ :lock |
			(self isMatchKey: key lock: lock)
				ifTrue: [ pairs add: key -> lock ] ] ].
		
	^ pairs size
]

{ #category : 'examples' }
AoC24Day25 class >> part2 [

	^ AoC24 inputDay25 readStreamDo: [ :s | self part2: s ]
]

{ #category : 'examples' }
AoC24Day25 class >> part2: stream [
]
