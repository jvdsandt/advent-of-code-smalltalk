Class {
	#name : 'AoC24MatrixTests',
	#superclass : 'TestCase',
	#category : 'AdventOfCode2024',
	#package : 'AdventOfCode2024'
}

{ #category : 'tests' }
AoC24MatrixTests >> testAsRectangle [

	| matrix |
	
	matrix := AoCMatrix from: '...
.X.
XXX
.X.
...' readStream.

	self assert: (Rectangle origin: (1 @ 1) corner: (3 @ 5)) equals: matrix asRectangle 
	
]

{ #category : 'tests' }
AoC24MatrixTests >> testBasics [

	| matrix |
	
	matrix := self xmasMatrix.

	self assert: matrix maxX equals: 10.
	self assert: matrix maxY equals: 10.
	self assert: (matrix at: 1 @ 1) equals: $M.
	self assert: (matrix at: 10 @ 10) equals: $X.
	
	self should: [ matrix at: 11 @ 11 ] raise: SubscriptOutOfBounds

]

{ #category : 'tests' }
AoC24MatrixTests >> testCountWord [

	| matrix |
	
	matrix := self xmasMatrix.

	self assert: (matrix countWord: 'XMAS' at: 1 @ 4) equals: 0.
	self assert: (matrix countWord: 'XMAS' at: 1 @ 5) equals: 1.
	self assert: (matrix countWord: 'XMAS' at: 1 @ 6) equals: 1.
	self assert: (matrix countWord: 'XMAS' at: 10 @ 10) equals: 2.
	
	self assert: (matrix countWord: 'XMAS') equals: 18.
	
	self assert: (matrix countWord: 'XMAS' at: 11 @ 4) equals: 0.
	self assert: (matrix countWord: 'XMAS' at: 0 @ 0) equals: 0.
	self assert: (matrix countWord: 'XMAS' at: -10 @ 99) equals: 0.

	self assert: (matrix countWord: 'M' at: 10 @ 1 dir: 1 @ 1) equals: 1.
	self assert: (matrix countWord: 'M' at: 10 @ 1) equals: 8.
	self assert: (matrix countWord: 'Q' at: 10 @ 1) equals: 0.
	
	self assert: (matrix countWord: 'MMMSXXMASM') equals: 1
	
	

]

{ #category : 'tests' }
AoC24MatrixTests >> testEmpty [

	| m |
	
	m := AoCMatrix fromRows: #().
	self assert: m maxX equals: 0.
	self assert: m maxY equals: 0.	
	

]

{ #category : 'tests' }
AoC24MatrixTests >> testInit [

	| m |
	
	m := AoCMatrix fromRows: #( ( A B ) ( C D ) ( E F )).
	self assert: m maxX equals: 2.
	self assert: m maxY equals: 3.	
	
	self should: [ AoCMatrix fromRows: #( ( A B ) ( C D E )) ] raise: Error description: 'Row size mismatch'
]

{ #category : 'tests' }
AoC24MatrixTests >> testTravelFrom [

	| matrix pos visited |
	
	matrix := AoCMatrix from: '....#.....
.........#
..........
..#.......
.......#..
..........
.#..^.....
........#.
#.........
......#...' readStream.

	pos := matrix findPos: $^.
	visited := Set new.
	
	matrix travelFrom: pos in: 0 @ -1 do: [ :value :p :dir |
		visited add: p.
		(matrix at: p + dir ifOutside: [ $X ]) = $#
			ifTrue: [ dir rightRotated ]
			ifFalse: [ dir ] ].
		
	self assert: visited size equals: 41
]

{ #category : 'tests' }
AoC24MatrixTests >> testWordAt [

	| matrix |
	
	matrix := self xmasMatrix.

	self assert: (matrix wordAt: 6 @ 1 size: 4 dir: 1 @ 0) equals: 'XMAS'.
	self assert: (matrix wordAt: 10 @ 4 size: 4 dir: 0 @ 1) equals: 'XMAS'.
	self assert: (matrix wordAt: 10 @ 10 size: 4 dir: 1 @ 1) equals: 'X'.

]

{ #category : 'tests' }
AoC24MatrixTests >> xmasMatrix [

	^ AoCMatrix from: 'MMMSXXMASM
MSAMXMSMSA
AMXSXMAAMM
MSAMASMSMX
XMASAMXAMM
XXAMMXXAMA
SMSMSASXSS
SAXAMASAAA
MAMMMXMMMM
MXMXAXMASX' readStream
]
