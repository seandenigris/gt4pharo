Class {
	#name : #GtSearchMethodsFilter,
	#superclass : #GtSearchTypedEntitiesFilter,
	#category : #'GToolkit-Pharo-Coder-Filters'
}

{ #category : #'instance creation' }
GtSearchMethodsFilter class >> createFilterFor: aMethodCoder [
	^ self new
]

{ #category : #accessing }
GtSearchMethodsFilter class >> descriptorForTagType: aString in: aMethodsCoder [
	self withAllSubclasses
		do: [ :each | 
			(each filterDescriptorFor: aMethodsCoder)
				ifNotNil: [ :descriptor | 
					descriptor name = aString
						ifTrue: [ ^ descriptor ] ] ]
]

{ #category : #accessing }
GtSearchMethodsFilter class >> filterDescriptorFor: aMethodsCoder [
	^ nil
]

{ #category : #accessing }
GtSearchMethodsFilter class >> filterDescriptorsFor: aMethodsCoder into: aCollection [
	(self filterDescriptorFor: aMethodsCoder) 
		ifNotNil: [ :aDescriptor | aCollection add: aDescriptor ]
]

{ #category : #testing }
GtSearchMethodsFilter class >> isTag: aTag validFor: aMethodsCoder [
	^ (self descriptorForTagType: aTag tagType in: aMethodsCoder)
		ifNil: [ false ]
		ifNotNil:
			[ :descriptor | descriptor valueIsRequired not or: [ aTag name trim notEmpty ] ]
]

{ #category : #accessing }
GtSearchMethodsFilter class >> resultType [
	^ GtSearchMethodGroupResult 
]

{ #category : #accessing }
GtSearchMethodsFilter >> defaultFilterScope [
	^ GtSearchImageMethodsFilter new
]

{ #category : #accessing }
GtSearchMethodsFilter >> filterValueString [
	^ nil
]

{ #category : #testing }
GtSearchMethodsFilter >> gtMetricsFor: aView [
	<gtView>
	^ aView forward
		title: 'Metrics';
		priority: 11;
		object: [ self result ];
		view: #gtMetricsFor:
]

{ #category : #testing }
GtSearchMethodsFilter >> includesMethod: aCompiledMethod [
	self subclassResponsibility
]

{ #category : #testing }
GtSearchMethodsFilter >> matches: anObject [
	^ anObject isCompiledMethod and: [ 
		self includesMethod: anObject ]
]
