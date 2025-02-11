Class {
	#name : #GtPharoArrayLiteralNode,
	#superclass : #GtPharoLiteralNode,
	#instVars : [
		'arrayStart',
		'values',
		'arrayStop'
	],
	#category : #'GToolkit-Pharo-Parser-Parser'
}

{ #category : #generated }
GtPharoArrayLiteralNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitArrayLiteral: self
]

{ #category : #generated }
GtPharoArrayLiteralNode >> arrayStart [
	^ arrayStart
]

{ #category : #generated }
GtPharoArrayLiteralNode >> arrayStart: aSmaCCToken [
	arrayStart := aSmaCCToken
]

{ #category : #generated }
GtPharoArrayLiteralNode >> arrayStop [
	^ arrayStop
]

{ #category : #generated }
GtPharoArrayLiteralNode >> arrayStop: aSmaCCToken [
	arrayStop := aSmaCCToken
]

{ #category : #generated }
GtPharoArrayLiteralNode >> compositeNodeVariables [
	^ #(#values)
]

{ #category : #accessing }
GtPharoArrayLiteralNode >> guessType: completionStrategy [
	^ Array
]

{ #category : #'generated-initialize-release' }
GtPharoArrayLiteralNode >> initialize [
	super initialize.
	values := OrderedCollection new: 2.
]

{ #category : #accessing }
GtPharoArrayLiteralNode >> literalValue [
	^ self values collect: [ :eachValue | eachValue literalValue ] as: Array
]

{ #category : #accessing }
GtPharoArrayLiteralNode >> nestingLevel [
	^ 1 + super nestingLevel
]

{ #category : #generated }
GtPharoArrayLiteralNode >> tokenVariables [
	^ #(#arrayStart #arrayStop)
]

{ #category : #generated }
GtPharoArrayLiteralNode >> values [
	^ values
]

{ #category : #generated }
GtPharoArrayLiteralNode >> values: anOrderedCollection [
	self setParents: self values to: nil.
	values := anOrderedCollection.
	self setParents: self values to: self
]
