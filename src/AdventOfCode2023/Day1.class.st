Class {
	#name : #Day1,
	#superclass : #Object,
	#category : #AdventOfCode2023
}

{ #category : #day1 }
Day1 class >> day1DigitFrom: line using: markers [

	| index marker |
	index := line indexOfAnyOf: ($0 to: $9).
	marker := nil.
	markers do: [ :each |
		| idx |
		idx := line indexOfSubCollection: each.
		(idx > 0 and: [ index < 1 or: [ idx < index ] ]) ifTrue: [
			index := idx.
			marker := each ] ].
	^ marker
		  ifNil: [ line at: index ]
		  ifNotNil: [ (markers indexOf: marker) asString first ]
]

{ #category : #day1 }
Day1 class >> day1PartOne: stream [
	"'/Users/jan/Projects/AdventOfCode2023/day1_input.txt' asFileReference 
		readStreamDo: [ :stream | self day1PartOne: stream ]"

	| sum |
	sum := 0.
	[ stream atEnd ] whileFalse: [
		| line first last |
		line := stream nextLine.
		first := line detect: [ :ch | ch isDigit ].
		last := line reversed detect: [ :ch | ch isDigit ].
		sum := sum + (String with: first with: last) asInteger ].
	^ sum
]

{ #category : #day1 }
Day1 class >> day1PartTwo: stream [
	"self day1PartTwo: 'two1nine
eightwothree
abcone2threexyz
xtwone3four
4nineeightseven2
zoneight234
7pqrstsixteen' readStream"

	"'/Users/jan/Projects/AdventOfCode2023/day1_input.txt' asFileReference 
		readStreamDo: [ :stream | self day1PartTwo: stream ]"

	| sum numbers revnumbers |
	numbers := { 'one'. 'two'. 'three'. 'four'. 'five'. 'six'. 'seven'.
	           'eight'. 'nine' }.
	revnumbers := numbers collect: [ :each | each reversed ].
	sum := 0.
	[ stream atEnd ] whileFalse: [
		| line first last |
		line := stream nextLine.
		first := self day1DigitFrom: line using: numbers.
		last := self day1DigitFrom: line reversed using: revnumbers.
		sum := sum + (String with: first with: last) asInteger ].
	^ sum
]
