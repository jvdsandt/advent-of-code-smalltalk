Class {
	#name : 'AoC24Day21',
	#superclass : 'Object',
	#category : 'AdventOfCode2024',
	#package : 'AdventOfCode2024'
}

{ #category : 'examples' }
AoC24Day21 class >> part1 [

	^ AoC24 inputDay21 readStreamDo: [ :s | self part1: s ]
]

{ #category : 'examples' }
AoC24Day21 class >> part1: stream [

	| codes numKeypad dirKeypad1 dirKeypad2 dirKeypad3 |
	
	codes := stream linesCollect: [ :each | each trimBoth ].
	
	dirKeypad1 := AoC24Day21Keypad new initDirectional.
	
	dirKeypad2 := AoC24Day21Keypad new initDirectional.
	dirKeypad2 controller: dirKeypad1.

	dirKeypad3 := AoC24Day21Keypad new initDirectional.
	dirKeypad3 controller: dirKeypad2.

	numKeypad := AoC24Day21Keypad new initNumeric.
	numKeypad controller: dirKeypad3.

	codes do: [ :eachCode |
		eachCode do: [ :eachDigit |
			numKeypad moveTo: eachDigit ] ].
	

]

{ #category : 'examples' }
AoC24Day21 class >> part2 [

	^ AoC24 inputDay21 readStreamDo: [ :s | self part2: s ]
]

{ #category : 'examples' }
AoC24Day21 class >> part2: stream [
]
