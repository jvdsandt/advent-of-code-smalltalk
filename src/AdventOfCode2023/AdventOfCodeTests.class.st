Class {
	#name : #AdventOfCodeTests,
	#superclass : #TestCase,
	#category : #AdventOfCode2023
}

{ #category : #accessing }
AdventOfCodeTests >> baseDirectory [
	^ '/Users/jan/Projects/AdventOfCode2023' asFileReference 
]

{ #category : #tests }
AdventOfCodeTests >> countPossibleGames: stream [

	| games sum |
	
	games := Day2Game readAllFrom: stream.

	sum := 0.
	games do: [ :each |
		(each isPossibleWithRed: 12 green: 13 blue: 14) ifTrue: [
			sum := sum + each id ] ].
	^ sum
]

{ #category : #tests }
AdventOfCodeTests >> countPowerOfFewestCubes: stream [
	"'/Users/jan/Projects/AdventOfCode2023/day2_input.txt' asFileReference
		readStreamDo: [ :stream | self new countPowerOfFewestCubes: stream ]."

	| games |
	games := Day2Game readAllFrom: stream.
	^ games inject: 0 into: [ :sum :each | sum + each minGrab power ]
]

{ #category : #tests }
AdventOfCodeTests >> testDay1PartOne [

	| count |
	
	count := self baseDirectory / 'day1_input.txt' readStreamDo: [ :stream |
		Day1 day1PartOne: stream ].
	
	self assert: count equals: 55130
]

{ #category : #tests }
AdventOfCodeTests >> testDay1PartTwo [

	| count |
	
	count := self baseDirectory / 'day1_input.txt' readStreamDo: [ :stream |
		Day1 day1PartTwo: stream ].
	
	self assert: count equals: 54985
]

{ #category : #tests }
AdventOfCodeTests >> testDay2CountPossibleGames [

	| count |
	count := self baseDirectory / 'day2_input.txt' readStreamDo: [ :stream |
		self countPossibleGames: stream ].

	self assert: count equals: 2268
]

{ #category : #tests }
AdventOfCodeTests >> testDay2PowerOfFewestCubes [
	| count |
	count := self baseDirectory / 'day2_input.txt' readStreamDo: [ :stream |
		self countPowerOfFewestCubes: stream ].

	self assert: count equals: 63542
]
