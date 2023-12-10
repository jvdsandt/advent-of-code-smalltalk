Class {
	#name : #Day10,
	#superclass : #Object,
	#category : #AdventOfCode2023
}

{ #category : #examples }
Day10 class >> part1 [
	"self part1"

 	| lines apos bpos adir bdir map steps |

	lines := OrderedCollection new.
	AOC2023 baseDirectory / 'day10_input.txt' readStreamDo: [ :stream |
		[ stream atEnd ]
			whileFalse: [ 
				lines add: stream nextLine ] ].

	map := Dictionary new
		at: (0 @ -1) -> $F put: (1 @ 0);
		at: (0 @ -1) -> $| put: (0 @ -1);
		at: (0 @ -1) -> $7 put: (-1 @ 0);
		at: (1 @ 0) -> $J  put: (0 @ -1);
		at: (1 @ 0) -> $- put: (1 @ 0);
		at: (1 @ 0) -> $7 put: (0 @ 1);
		at: (0 @ 1) -> $J put: (-1 @ 0);
		at: (0 @ 1) -> $| put: (0 @ 1);
		at: (0 @ 1) -> $L put: (1 @ 0);
		at: (-1 @ 0) -> $F put: (0 @ 1);
		at: (-1 @ 0) -> $- put: (-1 @ 0);
		at: (-1 @ 0) -> $L put: (0 @ -1);
		yourself.
		
	apos := nil.
	lines doWithIndex: [ :line :idx |
		(apos isNil and: [ (line indexOf: $S) > 0 ])
			ifTrue: [ apos := (line indexOf: $S) @ idx ] ].
	bpos := apos.
	adir := 0 @ 1.
	bdir := 0 @ -1.
	steps := 0.
	[	| asym bsym | 
		apos := apos + adir.
		bpos := bpos + bdir.
		asym := (lines at: apos y) at: apos x.
		bsym := (lines at: bpos y) at: bpos x.
		adir := map at: (adir -> asym).
		bdir := map at: (bdir -> bsym).
		steps := steps + 1.
	 ] doWhileFalse: [ apos = bpos ].

	^ steps
]

{ #category : #examples }
Day10 class >> part2 [
	"self part2"

 	| lines apos bpos adir bdir map points sum |

	lines := OrderedCollection new.
	AOC2023 baseDirectory / 'day10_input.txt' readStreamDo: [ :stream |
		[ stream atEnd ]
			whileFalse: [ 
				lines add: stream nextLine ] ].

	map := Dictionary new
		at: (0 @ -1) -> $F put: (1 @ 0);
		at: (0 @ -1) -> $| put: (0 @ -1);
		at: (0 @ -1) -> $7 put: (-1 @ 0);
		at: (1 @ 0) -> $J  put: (0 @ -1);
		at: (1 @ 0) -> $- put: (1 @ 0);
		at: (1 @ 0) -> $7 put: (0 @ 1);
		at: (0 @ 1) -> $J put: (-1 @ 0);
		at: (0 @ 1) -> $| put: (0 @ 1);
		at: (0 @ 1) -> $L put: (1 @ 0);
		at: (-1 @ 0) -> $F put: (0 @ 1);
		at: (-1 @ 0) -> $- put: (-1 @ 0);
		at: (-1 @ 0) -> $L put: (0 @ -1);
		yourself.
		
	apos := nil.
	lines doWithIndex: [ :line :idx |
		(apos isNil and: [ (line indexOf: $S) > 0 ])
			ifTrue: [ apos := (line indexOf: $S) @ idx ] ].
	bpos := apos.
	adir := 0 @ 1.
	bdir := 0 @ -1.
	points := Set new.
	points add: apos.
	[	| asym bsym | 
		apos := apos + adir.
		bpos := bpos + bdir.
		asym := (lines at: apos y) at: apos x.
		bsym := (lines at: bpos y) at: bpos x.
		adir := map at: (adir -> asym).
		bdir := map at: (bdir -> bsym).
		points add: apos; add: bpos.
	 ] doWhileFalse: [ apos = bpos ].

	sum := 0.
	lines doWithIndex: [ :line :y |
		| in |
		in := false.
		line doWithIndex: [ :ch :x |
			(points includes: x @ y)
				ifTrue: [ 
					('|JLS' includes: ch) 
						ifTrue: [ in := in not ] ]
				ifFalse: [
					in ifTrue: [ sum := sum + 1 ] ] ] ]. 
	^ sum
]
