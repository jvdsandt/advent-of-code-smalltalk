"
Please describe the package using the class comment of the included manifest class. The manifest class also includes other additional metadata for the package. These meta data are used by other tools such as the SmalllintManifestChecker and the critics Browser
"
Class {
	#name : 'ManifestAdventOfCode2024',
	#superclass : 'PackageManifest',
	#category : 'AdventOfCode2024-Manifest',
	#package : 'AdventOfCode2024',
	#tag : 'Manifest'
}

{ #category : 'code-critics' }
ManifestAdventOfCode2024 class >> ruleModifiesCollectionRuleV1FalsePositive [

	<ignoreForCoverage>
	^ #(#(#(#RGMethodDefinition #(#'AoC24Day08 class' #findNodesPart2For:in: #true)) #'2024-12-08T06:38:29.542242+01:00') #(#(#RGMethodDefinition #(#'AoC24Day08 class' #findNodesFor:in: #true)) #'2024-12-08T06:38:52.690852+01:00') )
]
