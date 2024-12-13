Class {
	#name : #AoC24Day04,
	#superclass : #Object,
	#category : 'AdventOfCode2024'
}

{ #category : #examples }
AoC24Day04 class >> part1 [

	^ AoC24 inputDay04 readStreamDo: [ :s | self part1: s ]
]

{ #category : #examples }
AoC24Day04 class >> part1: stream [

	| matrix |
	
	matrix := AoCMatrix from: stream.
	^ matrix countWord: 'XMAS'
]

{ #category : #examples }
AoC24Day04 class >> part2 [

	^ AoC24 inputDay04 readStreamDo: [ :s | self part2: s ]
]

{ #category : #examples }
AoC24Day04 class >> part2: stream [

	| matrix sum |
	
	matrix := AoCMatrix from: stream.
	sum := 0.
	
	matrix doWithCells: [ :ch :point |
		ch = $A
			ifTrue: [ 
				| diag1 diag2 |
				diag1 := (matrix countWord: 'MAS' at: ((point x) - 1) @ ((point y) - 1) dir: 1 @ 1) +
					(matrix countWord: 'SAM' at: ((point x) - 1) @ ((point y) - 1) dir: 1 @ 1).
				diag2 := (matrix countWord: 'MAS' at: ((point x) + 1) @ ((point y) - 1) dir: -1 @ 1) +
					(matrix countWord: 'SAM' at: ((point x) + 1) @ ((point y) - 1) dir: -1 @ 1).
				(diag1 = 1 and: [ diag2 = 1 ])
					ifTrue: [ sum := sum + 1 ] ] ].
	^ sum
]
