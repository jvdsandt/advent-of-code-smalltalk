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
AoC24Tests >> testDay05 [

	| data |
	
	data := '47|53
97|13
97|61
97|47
75|29
61|13
75|53
29|13
97|29
53|29
61|53
97|53
61|29
47|13
75|47
97|75
47|61
75|61
47|29
75|13
53|13

75,47,61,53,29
97,61,53,29,13
75,29,13
75,97,47,61,53
61,13,29
97,13,75,29,47'.
	self assert: (AoC24Day05 part1: data readStream) equals: 143.
	
	self assert: (AoC24Day05 part2: data readStream) equals: 123
]

{ #category : 'tests' }
AoC24Tests >> testDay06 [

	| data |
	
	data := '....#.....
.........#
..........
..#.......
.......#..
..........
.#..^.....
........#.
#.........
......#...'.
	self assert: (AoC24Day06 part1: data readStream) equals: 41.
	
	self assert: (AoC24Day06 part2: data readStream) equals: 6
]
