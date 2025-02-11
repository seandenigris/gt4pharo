Class {
	#name : #GtBehaviorCoderElementExamples,
	#superclass : #Object,
	#category : #'GToolkit-Pharo-Coder-Examples'
}

{ #category : #'examples - instance creation' }
GtBehaviorCoderElementExamples >> forClassElement [
	<gtExample>
	| aCoderUIModel aCoderElement |

	aCoderUIModel := self forClassUIModel.
	aCoderElement := aCoderUIModel asElement.

	^ aCoderElement
]

{ #category : #'examples - instance creation' }
GtBehaviorCoderElementExamples >> forClassUIModel [
	<gtExample>
	| aCoder aCoderUIModel |
	aCoder := GtBehaviorCoderExamples new forClass.
	aCoderUIModel := aCoder asCoderUIModel.

	self assert: aCoderUIModel class equals: GtPharoBehaviorCoderViewModel.
	self assert: aCoderUIModel coder equals: aCoder.

	self
		assert: aCoderUIModel definitionCoderUIModel class
		equals: GtBehaviorDefinitionCoderUIModel.
	self
		assert: aCoderUIModel definitionCoderUIModel coder
		equals: aCoder definitionCoder.

	self
		assert: aCoderUIModel methodsCoderUIModel class
		equals: GtPharoMethodsCoderViewModel.
	self
		assert: aCoderUIModel methodsCoderUIModel coder
		equals: aCoder methodsCoder.

	^ aCoderUIModel
]
