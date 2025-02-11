Class {
	#name : #GtPharoMethodCoderViewModel,
	#superclass : #GtPharoSourceCoderViewModel,
	#instVars : [
		'savePreventors'
	],
	#category : #'GToolkit-Pharo-Coder-UI-! View Models'
}

{ #category : #'api - actions' }
GtPharoMethodCoderViewModel >> allowSave [
	"Remove all save prventors and recompute the updated save availability"

	savePreventors removeAll.
	self notifySaveEnabled
]

{ #category : #'api - actions' }
GtPharoMethodCoderViewModel >> allowSaveDueTo: aSavePreventor [
	savePreventors
		remove: aSavePreventor
		ifAbsent: [ ^ self ].
		
	savePreventors
		ifNotEmpty: [ ^ self ].
		
	self notifySaveEnabled
]

{ #category : #'api - coder model' }
GtPharoMethodCoderViewModel >> behavior [
	^ self coderModel behavior
]

{ #category : #'api - actions' }
GtPharoMethodCoderViewModel >> compile [
	<return: #Boolean>

	^ self coderModel compileInContext: self evaluationContext
]

{ #category : #'api - coder model' }
GtPharoMethodCoderViewModel >> compiledMethod [
	<return: #CompiledMethod>

	^ self coderModel compiledMethod
]

{ #category : #'api - actions' }
GtPharoMethodCoderViewModel >> discardChanges [
	super discardChanges.
	self allowSave
]

{ #category : #accessing }
GtPharoMethodCoderViewModel >> elementClass [
	self coders
		ifNil: [ ^ GtExpandableMethodCoderElement ].

	^ self coders isForClass
		ifTrue: [ GtExpandableMethodCoderForBehaviorElement ]
		ifFalse: [ GtExpandableMethodCoderElement ]
]

{ #category : #'private - evaluation' }
GtPharoMethodCoderViewModel >> evaluationContext [
	^ super evaluationContext
		receiverObject: (self selfObject ifNil: [ self behavior instanceSide ])
]

{ #category : #'gt-extension' }
GtPharoMethodCoderViewModel >> gtInfo [
	^ super gtInfo, (Array streamContents: [ :aStream |
		aStream nextPut: (#saveEnabled -> self isSaveEnabled).
		self isSaveEnabled
			ifFalse: [ aStream nextPut: (#savePreventors -> savePreventors asArray) ] ])
]

{ #category : #'api - coder model' }
GtPharoMethodCoderViewModel >> hasDeclaredVariableNamed: aVariableName [
	"Return true if a variable with a given name is declared"
	<return: #Boolean>
	
	(super hasDeclaredVariableNamed: aVariableName)
		ifTrue: [ ^ true ].
		
	(self behavior classThatDefinesInstVarNamed: aVariableName)
		 ifNotNil: [ ^ true ].
		
	(self behavior classThatDefinesClassVariable: aVariableName)
		 ifNotNil: [ ^ true ].

	^ false
]

{ #category : #initialization }
GtPharoMethodCoderViewModel >> initialize [
	super initialize.
	
	savePreventors := OrderedCollection new
]

{ #category : #testing }
GtPharoMethodCoderViewModel >> isMeta [
	"Return true if the method is implemented in a pharo metaclass (~ class side)"
	<return: #Boolean>

	^ self coderModel isMeta
]

{ #category : #testing }
GtPharoMethodCoderViewModel >> isSaveEnabled [
	^ savePreventors isEmpty
]

{ #category : #'private - notifying' }
GtPharoMethodCoderViewModel >> notifySaveDisabled [
	self announce: (GtMethodCoderSaveDisabled new preventors: savePreventors asArray)
]

{ #category : #'private - notifying' }
GtPharoMethodCoderViewModel >> notifySaveEnabled [
	self announce: (GtMethodCoderSaveEnabled new)
]

{ #category : #'api - actions' }
GtPharoMethodCoderViewModel >> playAll [
	"Evaluate the whole source code and inspect the result"

	^ self coder playAllInContext: (self evaluationContext all; receiverObject: self receiverObjectToPlay)
]

{ #category : #'api - actions' }
GtPharoMethodCoderViewModel >> playAllAndInspect [
	"Evaluate the whole source code and inspect the result"
	
	^ self coder playAllAndInspectInContext: (self evaluationContext all; receiverObject: self receiverObjectToPlay)
]

{ #category : #'api - actions' }
GtPharoMethodCoderViewModel >> preventSaveDueTo: aSavePreventor [
	(savePreventors includes: aSavePreventor)
		ifTrue: [ ^ self ].

	savePreventors add: aSavePreventor.

	savePreventors size > 1
		ifTrue: [ ^ self ].
		
	self notifySaveDisabled
]

{ #category : #'api - coder model' }
GtPharoMethodCoderViewModel >> protocol [
	<return: #String>

	^ self coderModel protocol
]

{ #category : #private }
GtPharoMethodCoderViewModel >> receiverObjectToPlay [
	self isMeta ifTrue: [ ^ self behavior instanceSide ].
	^ self selfObject
		ifNil: [ self behavior new ]
]

{ #category : #'api - actions' }
GtPharoMethodCoderViewModel >> save [
	<return: #Boolean>
	
	self isSaveEnabled
		ifFalse: [ ^ self ].

	^ self coderModel saveInContext: self evaluationContext
]

{ #category : #'api - coder model' }
GtPharoMethodCoderViewModel >> selector [
	^ self coderModel selector
]
