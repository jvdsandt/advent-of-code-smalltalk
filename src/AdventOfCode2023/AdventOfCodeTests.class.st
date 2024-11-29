Class {
	#name : #AdventOfCodeTests,
	#superclass : #TestCase,
	#category : #AdventOfCode2023
}

{ #category : #accessing }
AdventOfCodeTests >> baseDirectory [
	^ AOC2023 baseDirectory
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

{ #category : #calculating }
AdventOfCodeTests >> day4CalcPart1 [
	"self new day4CalcPart1"

	| day3|
	
	day3 := self baseDirectory / 'day4_input.txt' readStreamDo: [ :stream |
		Day4 allFrom: stream ].

	^ day3 inject: 0 into: [ :sum :each | sum + each points ]
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

{ #category : #tests }
AdventOfCodeTests >> testDay4Part1Example [

	| input coll |
	
	input := 'Card 1: 41 48 83 86 17 | 83 86  6 31 17  9 48 53
Card 2: 13 32 20 16 61 | 61 30 68 82 17 32 24 19
Card 3:  1 21 53 59 44 | 69 82 63 72 16 21 14  1
Card 4: 41 92 73 84 69 | 59 84 76 51 58  5 54 83
Card 5: 87 83 26 28 32 | 88 30 70 12 93 22 82 36
Card 6: 31 18 13 56 72 | 74 77 10 23 35 67 36 11'.
	
	coll := Day4 readFrom: input readStream.
	
	coll inject: 0 into: [ :sum :each | sum + each points ]
	
	
]
