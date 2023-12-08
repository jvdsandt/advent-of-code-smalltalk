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

 	| directions points currLocs steps dirIndex |

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
	
	currLocs := points keys select: [ :each | each last = $A ].
	dirIndex := 1.
	steps := 0.
	[ currLocs allSatisfy: [ :each | each last = $Z ] ] whileFalse: [ 
		| dir |
		dirIndex > directions size
			ifTrue: [ 
				dirIndex := 1 ].
		dirIndex = 1
			ifTrue: [ Transcript show: 'Looping ...', steps asString, ': ', currLocs asString, ' - ', dirIndex asString; flush ].
		dir := directions at: dirIndex.
		currLocs := dir = $L 
			ifTrue: [ currLocs collect: [ :each | (points at: each) first ] ] 
			ifFalse: [ currLocs collect: [ :each | (points at: each) last ] ].
		steps := steps + 1.
		dirIndex := dirIndex + 1 ].
			
	steps
]
