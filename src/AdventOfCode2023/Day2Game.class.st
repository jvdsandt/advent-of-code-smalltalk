Class {
	#name : 'Day2Game',
	#superclass : 'Object',
	#instVars : [
		'id',
		'grabs'
	],
	#category : 'AdventOfCode2023',
	#package : 'AdventOfCode2023'
}

{ #category : 'instance creation' }
Day2Game class >> fromLine: input [
	"self fromLine: 'Game 3: 8 green, 6 blue, 20 red; 5 blue, 4 red, 13 green; 5 green, 1 red'"

	| stream id grabs |
	stream := input readStream.
	id := (stream
		       next: 4;
		       upTo: $:) asInteger.
	grabs := OrderedCollection new.
	[ stream atEnd ] whileFalse: [
		grabs add: (Day2GameGrab from:
				 (stream upToAnyOf: (Array with: $; with: Character lf))) ].

	^ self new id: id grabs: grabs
]

{ #category : 'instance creation' }
Day2Game class >> readAllFrom: stream [

	| coll |
	coll := OrderedCollection new.
	[ stream atEnd ] whileFalse: [ 
		coll add: (self fromLine: stream nextLine) ].
	^coll
]

{ #category : 'accessing' }
Day2Game >> grabs [

	^ grabs
]

{ #category : 'accessing' }
Day2Game >> id [

	^ id
]

{ #category : 'initialization' }
Day2Game >> id: anId grabs: aColl [

	id := anId.
	grabs := aColl
]

{ #category : 'testing' }
Day2Game >> isPossibleWithRed: maxRed green: maxGreen blue: maxBlue [

	^ self grabs allSatisfy: [ :each |
		  each nrRed <= maxRed and: [
			  each nrGreen <= maxGreen and: [ each nrBlue <= maxBlue ] ] ]
]

{ #category : 'accessing' }
Day2Game >> minGrab [

	| minRed minGreen minBlue |
	
	minRed := minGreen := minBlue := 0.
	self grabs do: [ :each |
		minRed := minRed max: each nrRed.
		minGreen := minGreen max: each nrGreen.
		minBlue := minBlue max: each nrBlue ].
	^ Day2GameGrab red: minRed green: minGreen blue: minBlue
]
