Class {
	#name : #Day8,
	#superclass : #Object,
	#category : #AdventOfCode2023
}

{ #category : #examples }
Day8 class >> examplePart1 [

 	| directions points currLoc steps dirIndex |

	points := Dictionary new.
	AOC2023 baseDirectory / 'day8_input.txt' readStreamDo: [ :stream |
		| p l r |
		directions := stream nextLine.
		stream nextLine.
		[ stream atEnd ]
			whileFalse: [ 
				p := stream upTo: Character space.
				stream upTo: $(.
				l := stream upTo: $,.
				r := (stream upTo: $)) trimBoth.
				stream nextLine.
				points at: p put: (Array with: l with: r) ] ].
	
	currLoc := 'AAA'.
	dirIndex := 1.
	steps := 0.
	[ currLoc = 'ZZZ' ] whileFalse: [ 
		| dir |
		dirIndex > directions size
			ifTrue: [ dirIndex := 1 ].
		dir := directions at: dirIndex.
		currLoc := dir = $L ifTrue: [ (points at: currLoc) first ] ifFalse: [ (points at: currLoc) last ].
		steps := steps + 1.
		dirIndex := dirIndex + 1 ].
			
	steps
]

{ #category : #examples }
Day8 class >> examplePart2 [

 	| directions points list lcm |

	points := Dictionary new.
	AOC2023 baseDirectory / 'day8_input.txt' readStreamDo: [ :stream |
		| p l r |
		directions := stream nextLine.
		stream nextLine.
		[ stream atEnd ]
			whileFalse: [ 
				p := stream upTo: Character space.
				stream upTo: $(.
				l := stream upTo: $,.
				r := (stream upTo: $)) trimBoth.
				stream nextLine.
				points at: p put: (Array with: l with: r) ] ].
	
	list := (points keys select: [:e | e last = $A ]) collect: [ :each |
		| currLoc steps dirIndex |
		dirIndex := 1.
		steps := 0.
		currLoc := each.
		[ currLoc last = $Z ] whileFalse: [ 
			| dir |
			dirIndex > directions size
				ifTrue: [ 
					dirIndex := 1 ].
			dir := directions at: dirIndex.
			currLoc := dir = $L 
				ifTrue: [ (points at: currLoc) first ] 
				ifFalse: [ (points at: currLoc) last ].
			steps := steps + 1.
			dirIndex := dirIndex + 1 ].
		steps ].
	
	lcm := list first lcm: list second.
	2 to: list size do: [ :nr | lcm := lcm lcm: (list at: nr) ].
	^ lcm

]
