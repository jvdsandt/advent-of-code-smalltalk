Class {
	#name : 'AoC24Day09',
	#superclass : 'Object',
	#instVars : [
		'blocks'
	],
	#category : 'AdventOfCode2024',
	#package : 'AdventOfCode2024'
}

{ #category : 'examples' }
AoC24Day09 class >> part1 [

	^ AoC24 inputDay09 readStreamDo: [ :s | self part1: s ]
]

{ #category : 'examples' }
AoC24Day09 class >> part1: stream [

	| blocks id pos firstFreePos sum |
	
	blocks := OrderedCollection new.
	id := 0.
	[ stream atEnd ] whileFalse: [ 
		| fileLen freeLen |
		fileLen := stream next asString asInteger.
		fileLen timesRepeat: [ blocks add: id ].
		freeLen := stream next asString asInteger.
		freeLen ifNotNil: [ freeLen timesRepeat: [ blocks add: $. ] ].
		id := id + 1 ].

	pos := blocks size.
	firstFreePos := 1.
	[ 
		pos := blocks findLast: [ :ch | ch ~= $. ] startingAt: pos.
		firstFreePos := blocks findFirst: [ :ch | ch = $. ] startingAt: firstFreePos.
		firstFreePos < pos
			ifTrue: [
				blocks at: firstFreePos put: (blocks at: pos).
				blocks at: pos put: $..
				true ]
			ifFalse: [ false ] ] whileTrue.
	
	sum := 0.
	blocks doWithIndex: [ :each :idx |
		each = $.
			ifFalse: [ sum := sum + ((idx - 1) * each) ] ].
	^ sum
]

{ #category : 'examples' }
AoC24Day09 class >> part2 [

	^ AoC24 inputDay09 readStreamDo: [ :s | self part2: s ]
]

{ #category : 'examples' }
AoC24Day09 class >> part2: stream [

	| list id pos blocks |
	
	list := OrderedCollection new.
	id := 0.
	pos := 1.
	[ stream atEnd ] whileFalse: [ 
		| fileLen freeLen |
		fileLen := stream next asString asInteger.
		list add: (AoC24Day09FileBlock new initStart: pos size: fileLen id: id).
		pos := pos + fileLen.
		freeLen := stream next asString asInteger.
		freeLen ifNotNil: [ 
			list add: (AoC24Day09FreeBlock new initStart: pos size: freeLen).
			pos := pos + freeLen ].
		id := id + 1 ].

	blocks := self new initBlocks: list.
	blocks compact.
	
	^ blocks sum
]

{ #category : 'examples' }
AoC24Day09 class >> partX: stream [

	| blocks id pos firstFreePos sum |
	
	blocks := OrderedCollection new.
	id := 0.
	[ stream atEnd ] whileFalse: [ 
		| fileLen freeLen |
		fileLen := stream next asString asInteger.
		fileLen timesRepeat: [ blocks add: id ].
		freeLen := stream next asString asInteger.
		freeLen ifNotNil: [ freeLen timesRepeat: [ blocks add: $. ] ].
		id := id + 1 ].

	pos := blocks size.
	firstFreePos := 1.
	[ 
		pos := blocks findLast: [ :ch | ch ~= $. ] startingAt: pos.
		firstFreePos := blocks findFirst: [ :ch | ch = $. ] startingAt: firstFreePos.
		firstFreePos < pos
			ifTrue: [
				blocks at: firstFreePos put: (blocks at: pos).
				blocks at: pos put: $..
				true ]
			ifFalse: [ false ] ] whileTrue.
	
	sum := 0.
	blocks doWithIndex: [ :each :idx |
		each = $.
			ifFalse: [ sum := sum + ((idx - 1) * each) ] ].
	^ sum
]

{ #category : 'private' }
AoC24Day09 >> compact [

	| fileBlocks |
	
	fileBlocks := (blocks select: #isFileBlock) reversed.
	fileBlocks do: [ :eachFile |
		| freeblock |
		freeblock := blocks detect: [ :each | each isFreeBlock and: [ each size >= eachFile size ] ] ifNone: [ nil ].
		(freeblock notNil and: [ freeblock start < eachFile start ]) ifTrue: [ 
			self swap: eachFile with: freeblock ] ]
]

{ #category : 'as yet unclassified' }
AoC24Day09 >> initBlocks: aList [

	blocks := aList
]

{ #category : 'private' }
AoC24Day09 >> mergeFreeBlocks [

	| newBlocks stream |
	
	newBlocks := OrderedCollection new: blocks size.
	stream := blocks readStream.
	[ stream atEnd ] whileFalse: [ 
		| nextBlock |
		nextBlock := stream next.
		nextBlock isFileBlock 
			ifTrue: [ newBlocks add: nextBlock ]
			ifFalse: [ 
				(newBlocks notEmpty and: [ newBlocks last isFreeBlock ])
					ifTrue: [ newBlocks last size: newBlocks last size + nextBlock size ]
					ifFalse: [ newBlocks add: nextBlock ] ] ].
	blocks := newBlocks 

]

{ #category : 'printing' }
AoC24Day09 >> printOn: stream [

	blocks do: [ :each | each printOn: stream ]
]

{ #category : 'primitives - plugin' }
AoC24Day09 >> sum [

	| sum |
	sum := 0.
	 blocks do: [ :each |
		each isFileBlock ifTrue: [ 
			(each start to: each start + each size - 1) do: [ :idx |
				sum := sum + ((idx-1) * each id) ] ] ].
	^ sum
]

{ #category : 'private' }
AoC24Day09 >> swap: fileblock with: freeblock [

	| fstart |
	
	fstart := fileblock start.
	fileblock start: freeblock start.
	fileblock size = freeblock size
		ifTrue: [ 
			freeblock start: fstart ]
		ifFalse: [ 
			freeblock start: freeblock start + fileblock size.
			freeblock size: freeblock size - fileblock size.
			blocks add: (AoC24Day09FreeBlock new initStart: fstart size: fileblock size) ].
	blocks sort.
	self mergeFreeBlocks.
]
