Class {
	#name : 'Day6',
	#superclass : 'Object',
	#instVars : [
		'time',
		'distance'
	],
	#category : 'AdventOfCode2023',
	#package : 'AdventOfCode2023'
}

{ #category : 'examples' }
Day6 class >> examplePart1 [	

	^ AOC2023 baseDirectory / 'day6_input.txt' readStreamDo: [ :stream |
			(self readAllFrom: stream) inject: 1 into: [ :prod :each | prod * each winCount ] ]

]

{ #category : 'examples' }
Day6 class >> examplePart1Demo [	

	| input |
	
	input := 'Time:      7  15   30
Distance:  9  40  200'.
	^ (self readAllFrom: input readStream) 
			inject: 1 into: [ :prod :each | prod * each winCount ]

]

{ #category : 'examples' }
Day6 class >> examplePart2 [

	^ AOC2023 baseDirectory / 'day6_input.txt' readStreamDo: [ :stream |
			(self readBigFrom: stream) winCount ]

]

{ #category : 'examples' }
Day6 class >> examplePart2Demo [

	| input |
	
	input := 'Time:      7  15   30
Distance:  9  40  200'.
	^ (self readBigFrom: input readStream)  winCount

]

{ #category : 'instance creation' }
Day6 class >> readAllFrom: stream [

	| times distances |
	
	stream upTo: $:.
	times := self readNumbers: stream nextLine.
	stream upTo: $:.
	distances := self readNumbers: stream nextLine.
	
	^ times withIndexCollect: [ :each :index |
		self new time: each distance: (distances at: index) ]
]

{ #category : 'instance creation' }
Day6 class >> readBigFrom: stream [

	| time distance |
	
	stream upTo: $:.
	time := self readBigNumber: stream nextLine.
	stream upTo: $:.
	distance := self readBigNumber: stream nextLine.
	
	^ self new time: time distance: distance 
]

{ #category : 'utilities' }
Day6 class >> readBigNumber: line [

	| str out |
	
	str := line readStream.
	out := WriteStream on: String new.
	str skipSeparators.
	[  str atEnd ] whileFalse: [ out nextPutAll: (str upTo: Character space). str skipSeparators  ].
	^ out contents asInteger
]

{ #category : 'utilities' }
Day6 class >> readNumbers: line [

	^ AOC2023 readNumbers: line
]

{ #category : 'as yet unclassified' }
Day6 >> fastestTime [

	| firstX lastX |
	
	firstX := (time - ((time raisedTo: 2) - (4 * distance)) sqrt) / 2.0.
	lastX := (time + ((time raisedTo: 2) - (4 * distance)) sqrt) / 2.0.
]

{ #category : 'as yet unclassified' }
Day6 >> ranges [

	| firstX lastX |
	
	firstX := (time - ((time raisedTo: 2) - (4 * distance)) sqrt) / 2.0.
	lastX := (time + ((time raisedTo: 2) - (4 * distance)) sqrt) / 2.0.
	
	^ (firstX + 0.0001) ceiling to: (lastX - 0.0001) floor
]

{ #category : 'as yet unclassified' }
Day6 >> time: t distance: d [

	time := t.
	distance := d
]

{ #category : 'as yet unclassified' }
Day6 >> winCount [

	^ self ranges size
]
