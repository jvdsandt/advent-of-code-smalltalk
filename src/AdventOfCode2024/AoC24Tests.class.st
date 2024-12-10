Class {
	#name : 'AoC24Tests',
	#superclass : 'TestCase',
	#category : 'AdventOfCode2024',
	#package : 'AdventOfCode2024'
}

{ #category : 'tests' }
AoC24Tests >> testBaseDirectory [
	"AoC24 baseDirectory: 'C:\Stuff\AoC_2024'"
	"AoC24 baseDirectory: '/Users/jan/Projects/AdventOfCode2024'"

	self assert: AoC24 baseDirectory exists
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

{ #category : 'tests' }
AoC24Tests >> testDay07 [

	| data |
	
	data := '190: 10 19
3267: 81 40 27
83: 17 5
156: 15 6
7290: 6 8 6 15
161011: 16 10 13
192: 17 8 14
21037: 9 7 18 13
292: 11 6 16 20'.
	self assert: (AoC24Day07 part1: data readStream) equals: 3749.
	
	self assert: (AoC24Day07 part2: data readStream) equals: 11387
]

{ #category : 'tests' }
AoC24Tests >> testDay08 [

	| data |
	
	data := '............
........0...
.....0......
.......0....
....0.......
......A.....
............
............
........A...
.........A..
............
............'.
	self assert: (AoC24Day08 part1: data readStream) equals: 14.
	
	self assert: (AoC24Day08 part2: data readStream) equals: 34
]

{ #category : 'tests' }
AoC24Tests >> testDay09 [

	| data |
	
	data := '2333133121414131402'.
	self assert: (AoC24Day09 part1: data readStream) equals: 1928.
	
	self assert: (AoC24Day09 part2: data readStream) equals: 2858
]

{ #category : 'tests' }
AoC24Tests >> testDay10 [

	| data |
	
	data := '89010123
78121874
87430965
96549874
45678903
32019012
01329801
10456732'.
	self assert: (AoC24Day10 part1: data readStream) equals: 36.
	
	self assert: (AoC24Day10 part2: data readStream) equals: 81
]
