Class {
	#name : 'AoC24Tests',
	#superclass : 'TestCase',
	#category : 'AdventOfCode2024',
	#package : 'AdventOfCode2024'
}

{ #category : 'tests' }
AoC24Tests >> testBaseDirectory [
	"AoC24 baseDirectory: 'C:\Stuff\AoC_2024'"
	"AoC24 baseDirectory: '/Users/jeske/Downloads/jan-aoc24'"

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
"	self assert: (AoC24Day09 part1: data readStream) equals: 1928.
	
	self assert: (AoC24Day09 part2: data readStream) equals: 2858"
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

{ #category : 'tests' }
AoC24Tests >> testDay11 [

	| data |
	
	data := '125 17'.
	self assert: (AoC24Day11 part1: data readStream) equals: 55312.
	
	"self assert: (AoC24Day11 part2: data readStream) equals: 55312"
]

{ #category : 'tests' }
AoC24Tests >> testDay12 [

	| data |
	
	data := 'AAAA
BBCD
BBCC
EEEC'.
	self assert: (AoC24Day12 part1: data readStream) equals: 140.
	
	data := 'OOOOO
OXOXO
OOOOO
OXOXO
OOOOO'.
	self assert: (AoC24Day12 part1: data readStream) equals: 772.

	data := 'RRRRIICCFF
RRRRIICCCF
VVRRRCCFFF
VVRCCCJFFF
VVVVCJJCFE
VVIVCCJJEE
VVIIICJJEE
MIIIIIJJEE
MIIISIJEEE
MMMISSJEEE'.
	self assert: (AoC24Day12 part1: data readStream) equals: 1930.


	"self assert: (AoC24Day12 part2: data readStream) equals: AoC24Day12"
]

{ #category : 'tests' }
AoC24Tests >> testDay12part2 [

	| data |
	
	data := 'AAAA
BBCD
BBCC
EEEC'.
	self assert: (AoC24Day12 part2: data readStream) equals: 80.
	
	data := 'EEEEE
EXXXX
EEEEE
EXXXX
EEEEE'.
	self assert: (AoC24Day12 part2: data readStream) equals: 236.

	data := 'AAAAAA
AAABBA
AAABBA
ABBAAA
ABBAAA
AAAAAA'.
	self assert: (AoC24Day12 part2: data readStream) equals: 368.

	data := 'RRRRIICCFF
RRRRIICCCF
VVRRRCCFFF
VVRCCCJFFF
VVVVCJJCFE
VVIVCCJJEE
VVIIICJJEE
MIIIIIJJEE
MIIISIJEEE
MMMISSJEEE'.
	self assert: (AoC24Day12 part2: data readStream) equals: 1206.

]

{ #category : 'tests' }
AoC24Tests >> testDay13 [

	| data |
	
	data := 'Button A: X+94, Y+34
Button B: X+22, Y+67
Prize: X=8400, Y=5400

Button A: X+26, Y+66
Button B: X+67, Y+21
Prize: X=12748, Y=12176

Button A: X+17, Y+86
Button B: X+84, Y+37
Prize: X=7870, Y=6450

Button A: X+69, Y+23
Button B: X+27, Y+71
Prize: X=18641, Y=10279'.
	self assert: (AoC24Day13 part1: data readStream) equals: 480.
	
	"self assert: (AoC24Day13 part2: data readStream) equals: 55312"
]

{ #category : 'tests' }
AoC24Tests >> testDay14 [

	| data |
	
	data := 'p=0,4 v=3,-3
p=6,3 v=-1,-3
p=10,3 v=-1,2
p=2,0 v=2,-1
p=0,0 v=1,3
p=3,0 v=-2,-2
p=7,6 v=-1,-3
p=3,0 v=-1,-2
p=9,3 v=2,3
p=7,3 v=-1,2
p=2,4 v=2,-3
p=9,5 v=-3,-3'.
	self assert: (AoC24Day14 part1: data readStream width: 11 height: 7) equals: 12
]

{ #category : 'tests' }
AoC24Tests >> testDay15 [

	| data |
	
	data := '########
#..O.O.#
##@.O..#
#...O..#
#.#.O..#
#...O..#
#......#
########

<^^>>>vv<v>>v<<'.
	self assert: (AoC24Day15 part1: data readStream) equals: 2028.
	
	data := '##########
#..O..O.O#
#......O.#
#.OO..O.O#
#..O@..O.#
#O#..O...#
#O..O..O.#
#.OO.O.OO#
#....O...#
##########

<vv>^<v^>v>^vv^v>v<>v^v<v<^vv<<<^><<><>>v<vvv<>^v^>^<<<><<v<<<v^vv^v>^
vvv<<^>^v^^><<>>><>^<<><^vv^^<>vvv<>><^^v>^>vv<>v<<<<v<^v>^<^^>>>^<v<v
><>vv>v^v^<>><>>>><^^>vv>v<^^^>>v^v^<^^>v^^>v^<^v>v<>>v^v^<v>v^^<^^vv<
<<v<^>>^^^^>>>v^<>vvv^><v<<<>^^^vv^<vvv>^>v<^^^^v<>^>vvvv><>>v^<<^^^^^
^><^><>>><>^^<<^^v>>><^<v>^<vv>>v>>>^v><>^v><<<<v>>v<v<v>vvv>^<><<>^><
^>><>^v<><^vvv<^^<><v<<<<<><^v<<<><<<^^<v<^^^><^>>^<v^><<<^>>^v<v^v<v^
>^>>^v>vv>^<<^v<>><<><<v<<v><>v<^vv<<<>^^v^>^^>>><<^v>>v^v><^^>>^<>vv^
<><^^>^^^<><vvvvv^v<v<<>^v<v>v<<^><<><<><<<^^<<<^<<>><<><^^^>^^<>^>v<>
^^>vv<^v^v<vv>^<><v<^v>^^^>>>^^vvv^>vvv<>>>^<^>>>>>^<<^v>^vvv<>^<><<v>
v^^>>><<^^<>>^v^<v^vv<>v^<<>^<^v^v><^<<<><<^<v><v<>vv>>v><v^<vv<>v^<<^'.
	self assert: (AoC24Day15 part1: data readStream) equals: 10092.
	
	self assert: (AoC24Day15 part2: data readStream) equals: 9021
]

{ #category : 'tests' }
AoC24Tests >> testDay16 [

	| data |
	
	data := '###############
#.......#....E#
#.#.###.#.###.#
#.....#.#...#.#
#.###.#####.#.#
#.#.#.......#.#
#.#.#####.###.#
#...........#.#
###.#.#####.#.#
#...#.....#.#.#
#.#.#.###.#.#.#
#.....#...#.#.#
#.###.#.#.#.#.#
#S..#.....#...#
###############'.
	self assert: (AoC24Day16 part1: data readStream) equals: 7036.
	self assert: (AoC24Day16 part2: data readStream) equals: 45.
	
	data := '#################
#...#...#...#..E#
#.#.#.#.#.#.#.#.#
#.#.#.#...#...#.#
#.#.#.#.###.#.#.#
#...#.#.#.....#.#
#.#.#.#.#.#####.#
#.#...#.#.#.....#
#.#.#####.#.###.#
#.#.#.......#...#
#.#.###.#####.###
#.#.#...#.....#.#
#.#.#.#####.###.#
#.#.#.........#.#
#.#.#.#########.#
#S#.............#
#################'.
	self assert: (AoC24Day16 part1: data readStream) equals: 11048.
	self assert: (AoC24Day16 part2: data readStream) equals: 64.

]

{ #category : 'tests' }
AoC24Tests >> testDay17 [

	| data |
	
	data := 'Register A: 729
Register B: 0
Register C: 0

Program: 0,1,5,4,3,0'.
	self assert: (AoC24Day17 part1: data readStream) equals: '4635635210'.
]

{ #category : 'tests' }
AoC24Tests >> testDay17Line1 [

	| data compu |
	
	data := 'Register A: 0
Register B: 0
Register C: 9

Program: 2,6'.
	compu := AoC24Day17 new initFrom: data readStream.
	compu run.
	self assert: compu b equals: 1

]

{ #category : 'tests' }
AoC24Tests >> testDay17Line2 [

	| data compu |
	
	data := 'Register A: 10
Register B: 0
Register C: 0

Program: 5,0,5,1,5,4'.
	compu := AoC24Day17 new initFrom: data readStream.
	compu run.
	self assert: compu output asArray equals: #( 0 1 2 )

]

{ #category : 'tests' }
AoC24Tests >> testDay17Line3 [

	| data compu |
	
	data := 'Register A: 2024
Register B: 0
Register C: 0

Program: 0,1,5,4,3,0'.
	compu := AoC24Day17 new initFrom: data readStream.
	compu run.
	self assert: compu output asArray equals: #( 4 2 5 6 7 7 7 7 3 1 0 ).
	self assert: compu a equals: 0

]

{ #category : 'tests' }
AoC24Tests >> testDay17Line4 [

	| data compu |
	
	data := 'Register A: 0
Register B: 29
Register C: 0

Program: 1,7'.
	compu := AoC24Day17 new initFrom: data readStream.
	compu run.
	self assert: compu b equals: 26

]

{ #category : 'tests' }
AoC24Tests >> testDay17Line5 [

	| data compu |
	
	data := 'Register A: 0
Register B: 2024
Register C: 43690

Program: 4,0'.
	compu := AoC24Day17 new initFrom: data readStream.
	compu run.
	self assert: compu b equals: 44354

]

{ #category : 'tests' }
AoC24Tests >> testDay18 [

	| data |
	
	data := '5,4
4,2
4,5
3,0
2,1
6,3
2,4
1,5
0,6
3,3
2,6
5,1
1,2
5,5
2,5
6,5
1,4
0,4
6,4
1,1
6,1
1,0
0,5
1,6
2,0'.
	self assert: (AoC24Day18 part1: data readStream rows: 7 cols: 7 fallen: 12) equals: 22.
	
	self assert: (AoC24Day18 part2: data readStream rows: 7 cols: 7 fallen: 12) equals: 6 @ 1.
	

]

{ #category : 'tests' }
AoC24Tests >> testDay19 [

	| data |
	
	data := 'r, wr, b, g, bwu, rb, gb, br

brwrr
bggr
gbbr
rrbgbr
ubwu
bwurrg
brgr
bbrgwb'.
	self assert: (AoC24Day19 part1: data readStream) equals: 6.
	
	self assert: (AoC24Day19 part2: data readStream) equals: 16
]

{ #category : 'tests' }
AoC24Tests >> testDay20 [

	| data |
	
	data := '###############
#...#...#.....#
#.#.#.#.#.###.#
#S#...#.#.#...#
#######.#.#.###
#######.#.#...#
#######.#.###.#
###..E#...#...#
###.#######.###
#...###...#...#
#.#####.#.###.#
#.#...#.#.#...#
#.#.#.#.#.#.###
#...#...#...###
###############'.
	self assert: (AoC24Day20 part1: data readStream minSavings: 1) equals: 44.
	
	self assert: (AoC24Day20 part2: data readStream) equals: 0
]

{ #category : 'tests' }
AoC24Tests >> testDay21 [

	| data |
	data := '029A
980A
179A
456A
379A'.
"	self assert: (AoC24Day21 part1: data readStream) equals: 126384.

	self assert: (AoC24Day21 part2: data readStream) equals: AoC24Day21"
]

{ #category : 'tests' }
AoC24Tests >> testDay22 [

	| data |
	
	data := '1
10
100
2024'.
	self assert: (AoC24Day22 part1: data readStream) equals: 37327623.
	
	data := '1
2
3
2024'.
	self assert: (AoC24Day22 part2: data readStream) equals: 23
]

{ #category : 'tests' }
AoC24Tests >> testDay23 [

	| data |
	data := 'kh-tc
qp-kh
de-cg
ka-co
yn-aq
qp-ub
cg-tb
vc-aq
tb-ka
wh-tc
yn-cg
kh-ub
ta-co
de-co
tc-td
tb-wq
wh-td
ta-ka
td-qp
aq-cg
wq-ub
ub-vc
de-ta
wq-aq
wq-vc
wh-yn
ka-de
kh-ta
co-tc
wh-qp
tb-vc
td-yn'.
	self assert: (AoC24Day23 part1: data readStream) equals: 7.


	self
		assert: (AoC24Day23 part2: data readStream)
		equals: 'co,de,ka,ta'
]

{ #category : 'tests' }
AoC24Tests >> testDay24 [

	| data |
	data := 'x00: 1
x01: 0
x02: 1
x03: 1
x04: 0
y00: 1
y01: 1
y02: 1
y03: 1
y04: 1

ntg XOR fgs -> mjb
y02 OR x01 -> tnw
kwq OR kpj -> z05
x00 OR x03 -> fst
tgd XOR rvg -> z01
vdt OR tnw -> bfw
bfw AND frj -> z10
ffh OR nrd -> bqk
y00 AND y03 -> djm
y03 OR y00 -> psh
bqk OR frj -> z08
tnw OR fst -> frj
gnj AND tgd -> z11
bfw XOR mjb -> z00
x03 OR x00 -> vdt
gnj AND wpb -> z02
x04 AND y00 -> kjc
djm OR pbm -> qhw
nrd AND vdt -> hwm
kjc AND fst -> rvg
y04 OR y02 -> fgs
y01 AND x02 -> pbm
ntg OR kjc -> kwq
psh XOR fgs -> tgd
qhw XOR tgd -> z09
pbm OR djm -> kpj
x03 XOR y03 -> ffh
x00 XOR y04 -> ntg
bfw OR bqk -> z06
nrd XOR fgs -> wpb
frj XOR qhw -> z04
bqk OR frj -> z07
y03 OR x01 -> nrd
hwm AND bqk -> z03
tgd XOR rvg -> z12
tnw OR pbm -> gnj'.

	self assert: (AoC24Day24 part1: data readStream) equals: 2024.
	
	self assert: (AoC24Day24 part2: data readStream) equals: 2024.
]

{ #category : 'tests' }
AoC24Tests >> testDay25 [

	| data |
	data := ''.

	self assert: (AoC24Day25 part1: data readStream) equals: AoC24Day25.


]
