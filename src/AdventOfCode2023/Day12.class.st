Class {
	#name : #Day12,
	#superclass : #Object,
	#instVars : [
		'line',
		'numbers'
	],
	#classVars : [
		'Cache'
	],
	#category : #AdventOfCode2023
}

{ #category : #examples }
Day12 class >> fromLine: input [

	| str line numbers |
	
	str := ReadStream on: input.
	line := str upTo: Character space.
	numbers := (str upToEnd splitOn: $,) collect: [ :e | e asInteger ].
	^ self new 
		line: line numbers: numbers asArray; 
		yourself
]

{ #category : #examples }
Day12 class >> part1 [ 

	| coll |

	coll := OrderedCollection new.
	AOC2023 baseDirectory / 'day12_input.txt' readStreamDo: [ :stream |
		[ stream atEnd ] whileFalse: [
			coll add: (self fromLine: stream nextLine) ] ].
	
	^ [
	  Cache := Dictionary new.
	  coll inject: 0 into: [ :sum :each | sum + each count ] ] ensure: [ Cache := nil ]
]

{ #category : #examples }
Day12 class >> part2 [

	| coll |

	coll := OrderedCollection new.
	AOC2023 baseDirectory / 'day12_input.txt' readStreamDo: [ :stream |
		[ stream atEnd ] whileFalse: [
			coll add: (self fromLine: stream nextLine) ] ].

	coll do: [ :each | each unfold ].

	^ [
	  Cache := Dictionary new.
	  coll inject: 0 into: [ :sum :each | sum + each count ] ] ensure: [ Cache := nil ]
]

{ #category : #actions }
Day12 >> calcHs: input numbers: array [

	| sz |

	array isEmpty
		ifTrue: [ ^ 0 ].
		
	sz := array first.
	input size < sz
		ifTrue: [  ^ 0 ].
		
	1 to: sz do: [ :idx |
		(input at: idx) = $.
			ifTrue: [ ^ 0 ] ].
		
	input size = sz
		ifTrue: [ 
			^ array size = 1
				ifTrue: [ 1 ] 
				ifFalse: [ 0 ] ].
			
	(input at: sz+1) = $#
		ifTrue: [ ^ 0 ].
		
	^ self count: (input allButFirst: sz+1) numbers: array allButFirst
]

{ #category : #actions }
Day12 >> count [

	^ self count: line numbers: numbers
]

{ #category : #actions }
Day12 >> count: input numbers: array [

	input isEmpty
		ifTrue: [ 
			^ array isEmpty
				ifTrue: [ 1 ]
				ifFalse: [ 0 ] ].
			
	input first = $.
		ifTrue: [ ^ self count: input allButFirst numbers: array ].
		
	input first = $#
		ifTrue: [ 
			^ self hs: input numbers: array ].
	
	input first = $?
		ifTrue: [ 
			^ (self count: input allButFirst numbers: array) + (self hs: input numbers: array) ].
		
												 	
					
]

{ #category : #actions }
Day12 >> hs: input numbers: array [

	| key |
	
	key := (Array with: input with: array).
	^ Cache at: key ifAbsentPut: [ self calcHs: input numbers: array ]
]

{ #category : #initialization }
Day12 >> line: l numbers: n [
	line := l.
	numbers := n
]

{ #category : #actions }
Day12 >> unfold [

	| str |
	
	str := WriteStream on: String new.
	(1 to: 5) 
		do: [ :idx | str nextPutAll: line ]
		separatedBy: [ str nextPut: $? ].
	line := str contents.
	
	str := WriteStream on: OrderedCollection new.
	5 timesRepeat: [ str nextPutAll: numbers ].
	numbers := str contents asArray
]
