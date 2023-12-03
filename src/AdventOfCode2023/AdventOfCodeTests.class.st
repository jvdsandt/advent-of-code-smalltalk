Class {
	#name : #AdventOfCodeTests,
	#superclass : #TestCase,
	#category : #AdventOfCode2023
}

{ #category : #accessing }
AdventOfCodeTests >> baseDirectory [
	^ FileSystem workingDirectory / 'pharo-local/iceberg/advent-of-code-smalltalk/data'
]

{ #category : #calculating }
AdventOfCodeTests >> day2CountPossibleGames: stream [

	| games sum |
	
	games := Day2Game readAllFrom: stream.

	sum := 0.
	games do: [ :each |
		(each isPossibleWithRed: 12 green: 13 blue: 14) ifTrue: [
			sum := sum + each id ] ].
	^ sum
]

{ #category : #calculating }
AdventOfCodeTests >> day2CountPowerOfFewestCubes: stream [
	"'/Users/jan/Projects/AdventOfCode2023/day2_input.txt' asFileReference
		readStreamDo: [ :stream | self new countPowerOfFewestCubes: stream ]."

	| games |
	games := Day2Game readAllFrom: stream.
	^ games inject: 0 into: [ :sum :each | sum + each minGrab power ]
]

{ #category : #calculating }
AdventOfCodeTests >> day3CalcPart1 [
	"self new calcDay3Part1"

	| day3|
	
	day3 := self baseDirectory / 'day3_input.txt' readStreamDo: [ :stream |
		Day3Schematic fromStream: stream ].

	^ day3 sumOfPartNumbers
]

{ #category : #calculating }
AdventOfCodeTests >> day3CalcPart2 [
	"self new calcDay3Part2"

	| day3|
	
	day3 := self baseDirectory / 'day3_input.txt' readStreamDo: [ :stream |
		Day3Schematic fromStream: stream ].

	^ day3 totalGearRatio 
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
		self day2CountPossibleGames: stream ].

	self assert: count equals: 2268
]

{ #category : #tests }
AdventOfCodeTests >> testDay2PowerOfFewestCubes [
	| count |
	count := self baseDirectory / 'day2_input.txt' readStreamDo: [ :stream |
		self day2CountPowerOfFewestCubes: stream ].

	self assert: count equals: 63542
]

{ #category : #tests }
AdventOfCodeTests >> testDay3Part1Example [

	| input day3 |
	
	input := '467..114..
...*......
..35..633.
......#...
617*......
.....+.58.
..592.....
......755.
...$.*....
.664.598..'.

	day3 := Day3Schematic fromStream: input readStream.
	
	self assert: day3 sumOfPartNumbers equals: 4361
]

{ #category : #tests }
AdventOfCodeTests >> testDay3Part2Example [

	| input day3 |
	
	input := '467..114..
...*......
..35..633.
......#...
617*......
.....+.58.
..592.....
......755.
...$.*....
.664.598..'.

	day3 := Day3Schematic fromStream: input readStream.
	
	self assert: day3 totalGearRatio equals: 467835
]
