Class {
	#name : 'AoC24Tests',
	#superclass : 'TestCase',
	#category : 'AdventOfCode2024',
	#package : 'AdventOfCode2024'
}

{ #category : 'accessing' }
AoC24Tests >> baseDirectory [

	^ AoC24 baseDirectory
]

{ #category : 'tests' }
AoC24Tests >> testBaseDirectory [
	"AoC24 baseDirectory: 'C:\Stuff\AoC_2024'"
	"AoC24 baseDirectory: '/Users/jan/Projects/AdventOfCode2024'"

	self assert: self baseDirectory exists
]

{ #category : 'tests' }
AoC24Tests >> testDay01 [

	| data |
	data := '3   4
4   3
2   5
1   3
3   9
3   3'.

	self assert: (AoC24Day01 part1: data readStream) equals: 11.
	self assert: (AoC24Day01 part2: data readStream) equals: 31
]

{ #category : 'tests' }
AoC24Tests >> testDay02 [

	| data |
	data := '7 6 4 2 1
1 2 7 8 9
9 7 6 2 1
1 3 2 4 5
8 6 4 4 1
1 3 6 7 9'.

	self assert: (AoC24Day02 part1: data readStream) equals: 2.
	self assert: (AoC24Day02 part2: data readStream) equals: 4
]

{ #category : 'tests' }
AoC24Tests >> testDay03 [

	| data |
	
	data := 'xmul(2,4)%&mul[3,7]!@^do_not_mul(5,5)+mul(32,64]then(mul(11,8)mul(8,5))'.
	self assert: (AoC24Day03 part1: data readStream) equals: 161.
	
	data := 'xmul(2,4)&mul[3,7]!^don''t()_mul(5,5)+mul(32,64](mul(11,8)undo()?mul(8,5))'.
	self assert: (AoC24Day03 part2: data readStream) equals: 48
]

{ #category : 'tests' }
AoC24Tests >> testDay04 [

	| data |
	
	data := 'MMMSXXMASM
MSAMXMSMSA
AMXSXMAAMM
MSAMASMSMX
XMASAMXAMM
XXAMMXXAMA
SMSMSASXSS
SAXAMASAAA
MAMMMXMMMM
MXMXAXMASX'.
	self assert: (AoC24Day04 part1: data readStream) equals: 18.
	
	self assert: (AoC24Day04 part2: data readStream) equals: 9
]
