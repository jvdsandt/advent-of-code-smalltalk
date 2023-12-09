Class {
	#name : #Day9,
	#superclass : #Object,
	#category : #AdventOfCode2023
}

{ #category : #examples }
Day9 class >> examplePart1 [

 	| numberLines tot |

	numberLines := OrderedCollection new.
	AOC2023 baseDirectory / 'day9_input.txt' readStreamDo: [ :stream |
		[ stream atEnd ]
			whileFalse: [ 
				numberLines add: (AOC2023 readNumbers: stream nextLine) ] ].
		
	tot := 0.
	numberLines do: [ :numbers |
		| diffs current nextVal |
		diffs := OrderedCollection new.
		current := numbers.
		diffs add: numbers.
		[ current allSatisfy: [ :e | e = 0 ] ]
			whileFalse: [ 
				current := current overlappingPairsCollect: [ :f :s | s - f ].
				diffs add: current ].
		nextVal := diffs reversed inject: 0 into: [ :sum :each | sum + each last ].
		tot := tot + nextVal ].
	
	^ tot
]

{ #category : #examples }
Day9 class >> examplePart2 [

 	| numberLines |

	numberLines := OrderedCollection new.
	AOC2023 baseDirectory / 'day9_input.txt' readStreamDo: [ :stream |
		[ stream atEnd ]
			whileFalse: [ 
				numberLines add: (AOC2023 readNumbers: stream nextLine) ] ].
		
	numberLines inject: 0 into: [ :tot :numbers |
		| diffs nextVal |
		diffs := OrderedCollection with: numbers.
		[ diffs last allSatisfy: [ :e | e = 0 ] ]
			whileFalse: [ 
				diffs add: (diffs last overlappingPairsCollect: [ :f :s | s - f ]) ].
		nextVal := diffs reversed inject: 0 into: [ :sum :each | each first - sum ].
		tot + nextVal ]
]
