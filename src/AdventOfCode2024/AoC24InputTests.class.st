Class {
	#name : 'AoC24InputTests',
	#superclass : 'TestCase',
	#category : 'AdventOfCode2024',
	#package : 'AdventOfCode2024'
}

{ #category : 'asserting' }
AoC24InputTests >> should: aBlock equal: expected description: aText [

	| time result |
	
	time := [ result := aBlock value ] millisecondsToRun.
	self assert: result equals: expected.
	Transcript crShow: (self class name, ' ', aText, ' result=', result asString, ' time=', time asString, 'ms')
]

{ #category : 'tests' }
AoC24InputTests >> testDay01 [

	self should: [ AoC24 inputDay01 readStreamDo: [ :s | AoC24Day01 part1: s ] ] 
		equal: 1834060
		description: 'day01 part1'.
		
	self should: [ AoC24 inputDay01 readStreamDo: [ :s | AoC24Day01 part2: s ] ] 
		equal: 21607792
		description: 'day01 part2'.
]

{ #category : 'tests' }
AoC24InputTests >> testDay06 [

	self should: [ AoC24 inputDay06 readStreamDo: [ :s | AoC24Day06 part1: s ] ] 
		equal: 4789
		description: 'day06 part1'.
		
	self should: [ AoC24 inputDay06 readStreamDo: [ :s | AoC24Day06 part2: s ] ] 
		equal: 1304
		description: 'day06 part2'.
]

{ #category : 'tests' }
AoC24InputTests >> testDay07 [

	self should: [ AoC24 inputDay07 readStreamDo: [ :s | AoC24Day07 part1: s ] ] 
		equal: 465126289353
		description: 'day07 part1'.
		
	self should: [ AoC24 inputDay07 readStreamDo: [ :s | AoC24Day07 part2: s ] ] 
		equal: 70597497486371
		description: 'day07 part2'.
]

{ #category : 'tests' }
AoC24InputTests >> testDay08 [

	self should: [ AoC24 inputDay08 readStreamDo: [ :s | AoC24Day08 part1: s ] ] 
		equal: 311
		description: 'day08 part1'.
		
	self should: [ AoC24 inputDay08 readStreamDo: [ :s | AoC24Day08 part2: s ] ] 
		equal: 1115
		description: 'day08 part2'.
]