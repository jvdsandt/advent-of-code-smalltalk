Class {
	#name : 'AoC24Day04',
	#superclass : 'Object',
	#category : 'AdventOfCode2024',
	#package : 'AdventOfCode2024'
}

{ #category : 'examples' }
AoC24Day04 class >> check: lines for: word from: aPoint dir: aDir [

	| maxX maxY |
	
	maxX := lines first size.
	maxY := lines size.

	2 to: word size do: [ :idx |
		| x y |
		x := aPoint x + ((idx - 1) * aDir x).
		y := aPoint y + ((idx - 1) * aDir y).
		((x between: 1 and: maxX) and: [ (y between: 1 and: maxY) and: [ ((lines at: y) at: x) = (word at: idx) ] ])
			ifFalse: [ ^ 0 ] ].
	^ 1
]

{ #category : 'examples' }
AoC24Day04 class >> checkXmas: lines from: aPoint [

	| maxX maxY w1 w2 |
	
	(aPoint x < 2 or: [ aPoint y < 2 ])
		ifTrue: [ ^ 0 ].
	
	maxX := lines first size.
	maxY := lines size.

	(aPoint x >= maxX or: [ aPoint y >= maxY ])
		ifTrue: [ ^ 0 ].
		
	w1 := String with: ((lines at: (aPoint y)-1) at: (aPoint x)-1) 
		with: ((lines at: aPoint y) at: aPoint x)
		with: ((lines at: (aPoint y)+1) at: (aPoint x)+1).
		
	w2 := String with: ((lines at: (aPoint y)-1) at: (aPoint x)+1) 
		with: ((lines at: aPoint y) at: aPoint x)
		with: ((lines at: (aPoint y)+1) at: (aPoint x)-1).
		
	^ ((#( 'MAS' 'SAM' ) includes: w1) and: [ #( 'MAS' 'SAM' ) includes: w2 ])
			ifTrue: [ 1 ]
			ifFalse: [ 0 ]
]

{ #category : 'examples' }
AoC24Day04 class >> part1 [

	^ AoC24 inputDay04 readStreamDo: [ :s | self part1: s ]
]

{ #category : 'examples' }
AoC24Day04 class >> part1: stream [

	| lines sum |
	
	lines := stream linesCollect: [ :each | each ].
	sum := 0.
	
	lines doWithIndex: [ :line :y |
		line doWithIndex: [ :ch : x |
			ch = $X
				ifTrue: [ 
					sum := sum + (self check: lines for: 'XMAS' from: x @ y dir: 1 @ 0).
					sum := sum + (self check: lines for: 'XMAS' from: x @ y dir: 1 @ 1).
					sum := sum + (self check: lines for: 'XMAS' from: x @ y dir: 0 @ 1).
					sum := sum + (self check: lines for: 'XMAS' from: x @ y dir: -1 @ 1).
					sum := sum + (self check: lines for: 'XMAS' from: x @ y dir: -1 @ 0).
					sum := sum + (self check: lines for: 'XMAS' from: x @ y dir: -1 @ -1).
					sum := sum + (self check: lines for: 'XMAS' from: x @ y dir: 0 @ -1). 
					sum := sum + (self check: lines for: 'XMAS' from: x @ y dir: 1 @ -1) ] ] ].
	^ sum
]

{ #category : 'examples' }
AoC24Day04 class >> part2 [

	^ AoC24 inputDay04 readStreamDo: [ :s | self part2: s ]
]

{ #category : 'examples' }
AoC24Day04 class >> part2: stream [

	| lines sum |
	
	lines := stream linesCollect: [ :each | each ].
	sum := 0.
	
	lines doWithIndex: [ :line :y |
		line doWithIndex: [ :ch : x |
			ch = $A
				ifTrue: [ 
					sum := sum + (self checkXmas: lines from: x @ y) ] ] ].
	^ sum
]
