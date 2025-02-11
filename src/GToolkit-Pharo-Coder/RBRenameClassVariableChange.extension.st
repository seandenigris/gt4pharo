Extension { #name : #RBRenameClassVariableChange }

{ #category : #'*GToolkit-Pharo-Coder' }
RBRenameClassVariableChange >> gtDiff [
	| aClass aDefinition oldSource newSource |
	
	aClass := self changeClass.
	aDefinition := GtBehaviorDefinition targetDefinitionForBehavior: aClass.
	oldSource := aDefinition asDefinitionString.
	
	aDefinition classVariables renameClassVariableNamed: oldName asSymbol to: newName asSymbol.
	newSource := aDefinition asDefinitionString.

	^ ClassDiffBuilder
		from: oldSource
		to: newSource
		inClass: aClass
]
