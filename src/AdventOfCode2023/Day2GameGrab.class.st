Class {
	#name : 'Day2GameGrab',
	#superclass : 'Object',
	#instVars : [
		'nrRed',
		'nrBlue',
		'nrGreen'
	],
	#category : 'AdventOfCode2023',
	#package : 'AdventOfCode2023'
}

{ #category : 'instance creation' }
Day2GameGrab class >> from: input [
	"self from: '8 green, 6 blue, 20 red'"

	| map stream |
	map := Dictionary new.
	stream := input readStream.
	[ stream atEnd ] whileFalse: [
		| nr color |
		stream skipSeparators.
		nr := (stream upTo: Character space) asInteger.
		stream skipSeparators.
		color := stream upTo: $,.
		map at: color put: nr ].
	^ self
		  red: (map at: 'red' ifAbsent: [ 0 ])
		  green: (map at: 'green' ifAbsent: [ 0 ])
		  blue: (map at: 'blue' ifAbsent: [ 0 ])
]

{ #category : 'instance creation' }
Day2GameGrab class >> red: nrRed green: nrGreen blue: nrBlue [

	^ self new red: nrRed green: nrGreen blue: nrBlue 
]

{ #category : 'accessing' }
Day2GameGrab >> nrBlue [

	^ nrBlue
]

{ #category : 'accessing' }
Day2GameGrab >> nrGreen [

	^ nrGreen
]

{ #category : 'accessing' }
Day2GameGrab >> nrRed [

	^ nrRed
]

{ #category : 'accessing' }
Day2GameGrab >> power [
	^ nrRed * nrGreen * nrBlue 
]

{ #category : 'initialization' }
Day2GameGrab >> red: aNrRed green: aNrGreen blue: aNrBlue [

	nrRed := aNrRed.
	nrGreen := aNrGreen.
	nrBlue := aNrBlue.
]
