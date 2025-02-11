Class {
	#name : #GtBaselineOfClassCompletionStrategy,
	#superclass : #GtBaselineCompletionStrategy,
	#category : #'GToolkit-Pharo-Coder-AddOns-Expandable baseline'
}

{ #category : #private }
GtBaselineOfClassCompletionStrategy >> namesMatching: aString [
	| name |
	name := 'BaselineOf' , aString.
	^ (BaselineOf withAllSubclasses
		select: [ :each | each name beginsWith: name ])
		collect: [ :each | each name allButFirst: 10 ]
]
