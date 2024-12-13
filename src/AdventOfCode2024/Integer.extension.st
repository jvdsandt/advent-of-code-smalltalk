Extension { #name : #Integer }

{ #category : #'*AdventOfCode2024' }
Integer >> || otherInt [
	"AoC 2024 Day07: The concatenation operator (||) combines the digits 
	from its left and right inputs into a single number. For example, 
	12 || 345 would become 12345"

	
	^ (self * (10 raisedTo: otherInt decimalDigitLength)) + otherInt
]
