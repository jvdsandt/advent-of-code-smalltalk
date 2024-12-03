Class {
	#name : 'AoC24Day03',
	#superclass : 'Object',
	#category : 'AdventOfCode2024',
	#package : 'AdventOfCode2024'
}

{ #category : 'actions' }
AoC24Day03 class >> part1 [

	^ AoC24 inputDay03 readStreamDo: [ :s | self part1: s ]
]

{ #category : 'actions' }
AoC24Day03 class >> part1: stream [
	"self part1: 'xmul(2,4)%&mul[3,7]!@^do_not_mul(5,5)+mul(32,64]then(mul(11,8)mul(8,5))' readStream"

	| sum |
	sum := 0.
	[ stream atEnd ] whileFalse: [
		stream upToAll: 'mul('.
		sum := sum + (self readNumbers: stream) ].
	^ sum
]

{ #category : 'actions' }
AoC24Day03 class >> part2 [

	^ AoC24 inputDay03 readStreamDo: [ :s | self part2: s ]
]

{ #category : 'actions' }
AoC24Day03 class >> part2: stream [
	"self part2: 'xmul(2,4)&mul[3,7]!^don''t()_mul(5,5)+mul(32,64](mul(11,8)undo()?mul(8,5))' readStream"

	| sum on cmd |
	
	sum := 0.
	on := true.
	
	[ stream atEnd ] whileFalse: [
		cmd := self readCommand:	stream.
		cmd = #do
			ifTrue: [ on := true ].
		cmd = #donnt
			ifTrue: [ on := false ].
		cmd = #mul
			ifTrue: [ 
				| nrs |
				nrs := self readNumbers: stream.
				on
					ifTrue: [ sum := sum + nrs ] ] ].
	^ sum
]

{ #category : 'actions' }
AoC24Day03 class >> readCommand: stream [

	| text |
	
	text := stream upTo: $(.
	(text endsWith: 'don''t')
		ifTrue: [ ^ #donnt ].
	(text endsWith: 'do')
		ifTrue: [ ^ #do ].		
	(text endsWith: 'mul')
		ifTrue: [ ^ #mul ].
	^ nil
]

{ #category : 'actions' }
AoC24Day03 class >> readNumber: stream [

	| nr |
	
	nr := ''.
	[ stream peek isDigit and: [ nr size < 3 ] ]
		whileTrue: [ nr := nr copyWith: stream next ].
	^ nr asInteger
]

{ #category : 'actions' }
AoC24Day03 class >> readNumbers: stream [

	| nr1 nr2 |

	stream atEnd
		ifTrue: [ ^ 0 ].
	nr1 := self readNumber: stream.
	stream peek = $, ifFalse: [ ^ 0 ].
	stream next.
	nr2 := self readNumber: stream.
	stream peek = $) ifFalse: [ ^ 0 ].
	stream next.

	^ (nr1 < 1000 and: [ nr2 < 1000 ])
		  ifTrue: [ nr1 * nr2 ]
		  ifFalse: [ 0 ]
]
