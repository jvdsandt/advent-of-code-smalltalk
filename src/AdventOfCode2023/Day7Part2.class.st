Class {
	#name : 'Day7Part2',
	#superclass : 'Day7',
	#category : 'AdventOfCode2023',
	#package : 'AdventOfCode2023'
}

{ #category : 'as yet unclassified' }
Day7Part2 >> cards [

	^'J23456789TQKA'
]

{ #category : 'testing' }
Day7Part2 >> sortedCounts [

	| counts ch |
	
	counts := super sortedCounts.
	(hand includes: $J) 
		ifFalse: [ ^ counts ].
		
	ch := counts first value.
	(ch = $J and: [ counts size > 1 ])
		ifTrue: [ ch := counts second value ].
			
	^ (hand collect: [ :each | each = $J ifTrue: [ ch ] ifFalse: [ each ] ]) asBag sortedCounts
]
