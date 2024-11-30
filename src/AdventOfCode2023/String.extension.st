Extension { #name : 'String' }

{ #category : '*AdventOfCode2023' }
String >> asIntegers [
	"' 12 13   14 15' asIntegers"
	"' ' asIntegers"
	"'1 2 3' asIntegers"
	"'1		2	3' asIntegers"

	| str coll |
	
	str := self readStream.
	coll := OrderedCollection new.
	str skipSeparators.
	[ str atEnd ] whileFalse: [ coll add: (str upToAnyOf: Character separators) asInteger. str skipSeparators ].
	^ coll asArray
]

{ #category : '*AdventOfCode2023' }
String >> asKeyAndValues [
	"'key: v1 v2 v3' asKeyAndValues"
	"'key: v1 		v2 v3	' asKeyAndValues"
	"'' asKeyAndValues"

	| str key values |
	
	(self includes: $:)
		ifFalse: [ ^ nil ].
	str := self readStream.
	key := str upTo: $:.
	values := OrderedCollection new.
	str skipSeparators.
	[ str atEnd ] whileFalse: [ values add: (str upToAnyOf: Character separators). str skipSeparators ].
	^ key -> values asArray
]
