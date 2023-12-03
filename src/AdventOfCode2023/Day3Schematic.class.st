Class {
	#name : #Day3Schematic,
	#superclass : #Object,
	#instVars : [
		'lines'
	],
	#category : #AdventOfCode2023
}

{ #category : #'instance creation' }
Day3Schematic class >> fromStream: stream [

	| lines |
	
	lines := OrderedCollection new.
	[ stream atEnd ] whileFalse: [ lines add: stream nextLine ].
	^ self new
		lines: lines;
		yourself
]

{ #category : #testing }
Day3Schematic >> isNumberAdjacent: input before: aPoint [

	(aPoint x - input size - 1) to: aPoint x do: [ :x |
		(aPoint y - 1) to: (aPoint y + 1) do: [ :y |
			| ch |
			ch := self valueAt: x @ y.
			(ch isDigit or: [ ch = $. ])
				ifFalse: [ ^ true ] ] ].
	^ false
]

{ #category : #accessing }
Day3Schematic >> lines [

	^ lines
]

{ #category : #accessing }
Day3Schematic >> lines: anObject [

	lines := anObject
]

{ #category : #actions }
Day3Schematic >> numberRectangles [

	| rectangles |
	
	rectangles := Dictionary new.
	lines doWithIndex: [ :eachLine :y |
		| nr |
		nr := ''.
		eachLine doWithIndex: [ :ch :x |
			ch isDigit 
				ifTrue: [ nr := nr copyWith: ch ]
				ifFalse: [ 
					nr notEmpty 
						ifTrue: [ 
							rectangles at: (Rectangle origin: x - nr size @ y corner: x - 1 @ y) put: nr asInteger.
							nr := '' ] ] ].
		nr notEmpty
			ifTrue: [ 
				rectangles at: (Rectangle origin: eachLine size - nr size @ y corner: eachLine size @ y) put: nr asInteger ] ].
	^ rectangles
]

{ #category : #actions }
Day3Schematic >> partNumbers [

	| numbers |
	
	numbers := OrderedCollection new.
	lines doWithIndex: [ :eachLine :y |
		| nr |
		nr := ''.
		eachLine doWithIndex: [ :ch :x |
			ch isDigit 
				ifTrue: [ nr := nr copyWith: ch ]
				ifFalse: [ 
					nr notEmpty 
						ifTrue: [ 
							(self isNumberAdjacent: nr before: x @ y)
								ifTrue: [ numbers add: nr asInteger ].
							nr := '' ] ] ].
		(self isNumberAdjacent: nr before: eachLine size + 1 @ y)
			ifTrue: [ numbers add: nr asInteger ].
		nr := '' ].
	^ numbers
]

{ #category : #testing }
Day3Schematic >> rect: aRect touches: otherRect [

	^ ((aRect origin x between: otherRect origin x and: otherRect corner x) or: [ 
		 aRect corner x between: otherRect origin x and: otherRect corner x ]) and: [ 
			(aRect origin y between: otherRect origin y and: otherRect corner y) or: [ 
				 aRect corner y between: otherRect origin y and: otherRect corner y ] ]
]

{ #category : #actions }
Day3Schematic >> sumOfPartNumbers [

	^ self partNumbers inject: 0 into: [ :nr :sum | nr + sum ]
]

{ #category : #actions }
Day3Schematic >> totalGearRatio [

	| map sum |
	
	map := self numberRectangles.
	sum := 0.
	lines doWithIndex: [ :eachLine :y |
		eachLine doWithIndex: [ :ch :x |
			ch = $*
				ifTrue: [ 
					| myRect nrRects |
					myRect := Rectangle origin: (x-1) @ (y-1) corner: (x+1) @ (y+1). 
					nrRects := map keys select: [ :each | self rect: each touches: myRect ].
					nrRects size = 2
						ifTrue: [ sum := sum + ((map at: nrRects first) * (map at: nrRects last)) ] ] ] ].
	^ sum
]

{ #category : #accessing }
Day3Schematic >> valueAt: aPoint [

	| line |
	
	(aPoint y < 1 or: [ aPoint y > lines size ])
		ifTrue: [ ^ $. ].
	line := lines at: aPoint y.
	^ (aPoint x < 1 or: [ aPoint x > line size ])
			ifTrue: [ $. ]
			ifFalse: [ line at: aPoint x ]
]
