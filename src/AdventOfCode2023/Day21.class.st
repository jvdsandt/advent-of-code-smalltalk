Class {
	#name : 'Day21',
	#superclass : 'Object',
	#category : 'AdventOfCode2023',
	#package : 'AdventOfCode2023'
}

{ #category : 'examples' }
Day21 >> findStart: lines [

	lines doWithIndex: [ :line :y |
		| x |
		x := line indexOf: $S.
		x > 0
			ifTrue: [ ^ x @ y ] ].
		
	self error: 'Start not found'
]

{ #category : 'examples' }
Day21 >> part1 [
	"self new part1"

	| lines start |
	
	lines := AOC2023 baseDirectory / 'day21' / 'input.txt' readStreamDo: [ :s | s linesCollect: [ :each | each ] ].
	start := self findStart: lines.
	
	^ (self travelFrom: (Set with: start) steps: 64 lines: lines) size
	
	
]

{ #category : 'examples' }
Day21 >> travelFrom: points steps: steps lines: lines [

	| newPoints |
	
	newPoints := Set new.
	points do: [ :p |
		"north"
		(p y > 1 and: [ ((lines at: p y -1) at: p x) ~= $# ]) 
			ifTrue: [ newPoints add: (p x @ (p y - 1)) ].
		"south"
		(p y < lines size and: [ ((lines at: p y +1) at: p x) ~= $# ]) 
			ifTrue: [ newPoints add: (p x @ (p y + 1)) ].
		"east"
		(p x < (lines at: p y) size and: [ ((lines at: p y) at: p x +1) ~= $# ]) 
			ifTrue: [ newPoints add: ((p x + 1) @ p y) ].
		"west"
		(p x > 1 and: [ ((lines at: p y) at: p x -1) ~= $# ]) 
			ifTrue: [ newPoints add: ((p x - 1) @ p y) ] ].
	
	^ steps > 1 
			ifTrue: [ self travelFrom: newPoints steps: steps-1 lines: lines ]
			ifFalse: [ newPoints ]
]
