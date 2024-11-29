Class {
	#name : 'Day7',
	#superclass : 'Object',
	#instVars : [
		'hand',
		'bid'
	],
	#category : 'AdventOfCode2023',
	#package : 'AdventOfCode2023'
}

{ #category : 'resources' }
Day7 class >> demoData [

	^'32T3K 765
T55J5 684
KK677 28
KTJJT 220
QQQJA 483'
]

{ #category : 'examples' }
Day7 class >> examplePart1 [
 | sum coll |

	sum := 0.
	coll := AOC2023 baseDirectory / 'day7_input.txt' readStreamDo: [ :stream |
		(self readAllFrom: stream) sorted ].
	coll doWithIndex: [ :each :index | sum := sum + (each bid * index) ].
	^ sum  
	
	"256448566"
]

{ #category : 'examples' }
Day7 class >> examplePart1Demo [

	| sum |
	
	sum := 0.
	
	(self readAllFrom: self demoData readStream) sorted 
			doWithIndex: [ :each :index | sum := sum + (each bid * index) ].
	^ sum

]

{ #category : 'examples' }
Day7 class >> examplePart2 [

 	| sum coll |

	sum := 0.
	coll := AOC2023 baseDirectory / 'day7_input.txt' readStreamDo: [ :stream |
		(Day7Part2 readAllFrom: stream) sorted ].
	coll doWithIndex: [ :each :index | sum := sum + (each bid * index) ].
	^ sum    "254412181"
]

{ #category : 'examples' }
Day7 class >> examplePart2Demo [

	| sum |
	
	sum := 0.
	
	(Day7Part2 readAllFrom: self demoData readStream) sorted 
			doWithIndex: [ :each :index | sum := sum + (each bid * index) ].
	^ sum

]

{ #category : 'instance creation' }
Day7 class >> fromLine: line [

	| str |
	
	str :=line readStream.
	^ self new hand: (str upTo: Character space) bid: str nextLine asInteger
]

{ #category : 'instance creation' }
Day7 class >> readAllFrom: stream [

	| coll |
	
	coll := OrderedCollection new.
	[ stream atEnd ]
		whileFalse: [ coll add: (self fromLine: stream nextLine) ].
	^ coll
]

{ #category : 'comparing' }
Day7 >> <= other [

	| rd |
	hand = other hand ifTrue: [ ^true ].
	rd := self typeRank - other typeRank.
	rd = 0 ifFalse: [ ^ rd < 0 ].

	1 to: 5 do: [ :idx |
		| diff |
		diff := (self cards indexOf: (hand at: idx)) - (self cards indexOf: (other hand at: idx)).
		diff = 0
			ifFalse: [ ^ diff < 0 ] ].
	
	self error: 'unexpected!'
]

{ #category : 'accessing' }
Day7 >> bid [

	^ bid
]

{ #category : 'accessing' }
Day7 >> cards [

	^'23456789TJQKA'
]

{ #category : 'accessing' }
Day7 >> hand [

	^ hand
]

{ #category : 'accessing' }
Day7 >> hand: h bid: b [
	hand := h.
	bid := b
]

{ #category : 'testing' }
Day7 >> isFiveOfAKind [

	^ self sortedCounts size = 1
]

{ #category : 'testing' }
Day7 >> isFourOfAKind [

	^ self sortedCounts first key = 4
]

{ #category : 'testing' }
Day7 >> isFullHouse [

	^ (self sortedCounts first key = 3) and: [ 
		 self sortedCounts second key = 2]
]

{ #category : 'testing' }
Day7 >> isHighCard [

	^ self sortedCounts size = 5
]

{ #category : 'testing' }
Day7 >> isOnePair [

	^ (self sortedCounts first key = 2) and: [ 
		 self sortedCounts size = 4]
]

{ #category : 'testing' }
Day7 >> isThreeOfAKind [

	^ (self sortedCounts first key = 3) and: [ 
		 self sortedCounts size = 3]
]

{ #category : 'testing' }
Day7 >> isTwoPair [

	^ (self sortedCounts first key = 2) and: [ 
		 self sortedCounts size = 3]
]

{ #category : 'printing' }
Day7 >> printOn: aStream [

	aStream nextPutAll: hand; 
		nextPutAll: ' -> '; 
		nextPutAll: bid asString;
		nextPutAll: ' (', self typeRank asString, ')'
]

{ #category : 'testing' }
Day7 >> sortedCounts [

	^ hand asBag sortedCounts
]

{ #category : 'testing' }
Day7 >> typeRank [

	self isFiveOfAKind ifTrue: [  ^6 ].
	self isFourOfAKind ifTrue: [ ^5 ].
	self isFullHouse ifTrue: [ ^4 ].
	self isThreeOfAKind ifTrue: [ ^3 ].
	self isTwoPair ifTrue: [ ^2 ].
	self isOnePair ifTrue: [ ^1 ].
	^ 0
]
