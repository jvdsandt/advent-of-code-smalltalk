Class {
	#name : 'AoC24Day23',
	#superclass : 'Object',
	#category : 'AdventOfCode2024',
	#package : 'AdventOfCode2024'
}

{ #category : 'examples' }
AoC24Day23 class >> part1 [

	^ AoC24 inputDay23 readStreamDo: [ :s | self part1: s ]
]

{ #category : 'examples' }
AoC24Day23 class >> part1: stream [

	| conns triangles n2 n3 |
	
	conns := IdentityDictionary new.
	[ stream atEnd ] whileFalse: [ 
		| from to |
		from := (stream upTo: $-) trimBoth asSymbol.
		to := stream nextLine trimBoth asSymbol.
		(conns at: from ifAbsentPut: [ OrderedCollection new ]) add: to.
	 	(conns at: to ifAbsentPut: [ OrderedCollection new ]) add: from ].
	
	triangles := Set new.
	conns keysAndValuesDo: [ :n :to |
		to size > 2 ifTrue: [
			1 to: to size - 1 do: [ :idx1 |
				idx1+1 to: to size do: [ :idx2 |
					n2 := to at: idx1.
					n3 := to at: idx2.				
					((n first = $t or: [ n2 first = $t or: [ n3 first = $t ] ]) and: [ 
						(conns at: n2) includes: n3 ])
							ifTrue: [ triangles add: (Array with: n with: n2 with: n3) sorted ] ] ] ] ].
			
	^ triangles size
				
	
]

{ #category : 'examples' }
AoC24Day23 class >> part2 [

	^ AoC24 inputDay23 readStreamDo: [ :s | self part2: s ]
]

{ #category : 'examples' }
AoC24Day23 class >> part2: stream [

	| conns cliques maxClique |
	conns := IdentityDictionary new.
	[ stream atEnd ] whileFalse: [
		| from to |
		from := (stream upTo: $-) trimBoth asSymbol.
		to := stream nextLine trimBoth asSymbol.
		(conns at: from ifAbsentPut: [ OrderedCollection new ]) add: to.
		(conns at: to ifAbsentPut: [ OrderedCollection new ]) add: from ].

	cliques := self recurseBK: Set new
		           poss: (Set withAll: conns keys)
		           exc: Set new
		           in: conns.
	maxClique := cliques detectMax: [ :c | c size ].

	^ ',' join: maxClique sorted
]

{ #category : 'examples' }
AoC24Day23 class >> recurseBK: r poss: p exc: x in: connDict [

	| cliques res poss exc |
	res := r.
	poss := p.
	exc := x.

	poss isEmpty & exc isEmpty ifTrue: [ ^ Array with: res ].

	cliques := Set new.
	poss do: [ :vertex |
		| vertSet |
		vertSet := Set with: vertex.
		cliques addAll: (self
				 recurseBK: res, vertSet
				 poss: (poss intersection: (connDict at: vertex))
				 exc: (exc intersection: (connDict at: vertex))
				 in: connDict).

		poss := poss copyWithoutAll: vertSet.
		exc := exc copyWithAll: vertSet ].
	^ cliques
]
