Class {
	#name : #GtPharoBehaviorCoder,
	#superclass : #GtCoderModel,
	#traits : 'TGtCoderTrait',
	#classTraits : 'TGtCoderTrait classTrait',
	#instVars : [
		'class',
		'object',
		'hasObject',
		'definitionCoder',
		'methodsCoder'
	],
	#category : #'GToolkit-Pharo-Coder-Coders'
}

{ #category : #constants }
GtPharoBehaviorCoder class >> addNewMethodButtonName [
	^ #'button--add-new-method'
]

{ #category : #constants }
GtPharoBehaviorCoder class >> behaviorNameEditorName [
	^ #'behavior-coder--behavior-name-editor'
]

{ #category : #'instance creation' }
GtPharoBehaviorCoder class >> forClass: aBehavior [
	^ self new
		forClass: aBehavior;
		yourself
]

{ #category : #'instance creation' }
GtPharoBehaviorCoder class >> forObject: anObject [
	^ self new
		forObject: anObject;
		yourself
]

{ #category : #'api - converting' }
GtPharoBehaviorCoder >> asNewCoderModelWithSameSubject [
	"Return new coder model with same subject (e.g., package, class, method)"
	<return: #GtCoderModel>
	^ self hasObject 
		ifTrue: [ self class forObject: self object ] 
		ifFalse: [ self class forClass: self behavior ]
]

{ #category : #accessing }
GtPharoBehaviorCoder >> behavior [
	<return: #Behavior>

	^ class
]

{ #category : #accessing }
GtPharoBehaviorCoder >> coderName [
	^ self theClass name
]

{ #category : #accessing }
GtPharoBehaviorCoder >> definitionCoder [
	<return: #GtPharoBehaviorDefinitionCoder>

	^ definitionCoder
]

{ #category : #initialize }
GtPharoBehaviorCoder >> forClass: aClass [
	hasObject := false.
	self initializeClass: aClass.

	self methodsCoder: (GtClassMethodsCoder forClass: aClass)
]

{ #category : #initialize }
GtPharoBehaviorCoder >> forObject: anObject [
	object := anObject.
	hasObject := true.
	self initializeClass: anObject class.
	
	self methodsCoder: (GtClassMethodsCoder forObject: object)
]

{ #category : #'gt-extension' }
GtPharoBehaviorCoder >> gtLiveFor: aView [
	<gtView>
	^ aView explicit 
		title: 'Class';
		priority: 1;
		stencil: self;
		actionButtonIcon: BrGlamorousVectorIcons browse
			action: [ :aButton | self theClass browse ];
		actionButtonIcon: BrGlamorousVectorIcons inspect
			action: [ :aButton | aButton phlow spawnObject: self theClass ]
]

{ #category : #testing }
GtPharoBehaviorCoder >> hasObject [
	<return: #Boolean>

	^ hasObject
]

{ #category : #accessing }
GtPharoBehaviorCoder >> icon [
	^ BrGlamorousIcons classicon
]

{ #category : #initialize }
GtPharoBehaviorCoder >> initialize [
	super initialize.

	hasObject := false
]

{ #category : #initialize }
GtPharoBehaviorCoder >> initializeClass: aClass [
	self
		assert: [ class isNil ]
		description: [ 'Can not change the behavior behind this coder' ].

	class := aClass.
	definitionCoder := GtPharoBehaviorDefinitionCoder forBehavior: class
]

{ #category : #testing }
GtPharoBehaviorCoder >> isForClass [
	^ true
]

{ #category : #accessing }
GtPharoBehaviorCoder >> methodsCoder [
	^ methodsCoder
]

{ #category : #accessing }
GtPharoBehaviorCoder >> methodsCoder: aMethodsCoder [
	methodsCoder ifNotNil: [ :aCoder | aCoder announcer unsubscribe: self ].
	methodsCoder := aMethodsCoder.
	aMethodsCoder weak
		when: GtCodersFiltersChanged
		send: #onMethodsCoderFiltersChanged:
		to: self
]

{ #category : #accessing }
GtPharoBehaviorCoder >> name [
	^ self theClass name
]

{ #category : #accessing }
GtPharoBehaviorCoder >> object [
	<return: #Object>

	^ object
]

{ #category : #'private - announcement handling' }
GtPharoBehaviorCoder >> onMethodsCoderFiltersChanged: aGtCodersFiltersChanged [
	self announcer announce: aGtCodersFiltersChanged.
]

{ #category : #accessing }
GtPharoBehaviorCoder >> package [
	^ self theClass package
]

{ #category : #accessing }
GtPharoBehaviorCoder >> packageTag [
	^ self package classTagForClass: self theClass
]

{ #category : #printing }
GtPharoBehaviorCoder >> printOn: aStream [
	aStream
		nextPutAll: 'Behavior Coder';
		space;
		nextPut: $(;
		print: self name;
		nextPut: $)
]

{ #category : #actions }
GtPharoBehaviorCoder >> removeClass [
	self theClass removeFromSystem
]

{ #category : #accessing }
GtPharoBehaviorCoder >> theClass [
	<return: #Class>

	^ class
]

{ #category : #'api - navigation' }
GtPharoBehaviorCoder >> withMethodProtocol: aMethodProtocol source: aSource [

	self announce: (GtClassCoderMethodProtocolNavigationAnnouncement new 
		source: aSource;
		methodProtocol: aMethodProtocol)
]

{ #category : #'api - navigation' }
GtPharoBehaviorCoder >> withSelectedMethod: aMethod [
	self
		assert: [ class instanceSide = aMethod methodClass instanceSide ]
		description: [ 'Can not select a method from a different class' ].

	self announce: (GtClassCoderMethodNavigationAnnouncement new method: aMethod)
]
