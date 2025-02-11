Class {
	#name : #GtSearchImageClassesFilter,
	#superclass : #GtSearchClassesFilter,
	#category : #'GToolkit-Pharo-Coder-Filters'
}

{ #category : #comparing }
GtSearchImageClassesFilter >> = anObject [
	self == anObject ifTrue: [ ^ true ].
	self class = anObject class ifFalse: [ ^ false ].
	^ true
]

{ #category : #enumerating }
GtSearchImageClassesFilter >> classesDo: aBlock [
	GtPharoSystemTraverser default allClassesAndTraitsDo: aBlock
]

{ #category : #accessing }
GtSearchImageClassesFilter >> defaultFilterScope [
	^ self
]

{ #category : #testing }
GtSearchImageClassesFilter >> includesClass: aClass [
	^ Smalltalk hasClassNamed: aClass name
]

{ #category : #enumerating }
GtSearchImageClassesFilter >> itemsDo: aBlock [
	^ self classesDo: aBlock
]
