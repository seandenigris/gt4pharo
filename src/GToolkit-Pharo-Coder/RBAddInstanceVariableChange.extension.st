Extension { #name : #RBAddInstanceVariableChange }

{ #category : #'*GToolkit-Pharo-Coder' }
RBAddInstanceVariableChange >> gtDiff [
	| aClass aDefinition oldSource newSource |
	
	aClass := self changeClass.
	aDefinition := GtBehaviorDefinition targetDefinitionForBehavior: aClass.
	oldSource := aDefinition asDefinitionString.
	
	aDefinition slots addSlotNamed: variable asSymbol.
	newSource := aDefinition asDefinitionString.

	^ ClassDiffBuilder
		from: oldSource
		to: newSource
		inClass: aClass
]
