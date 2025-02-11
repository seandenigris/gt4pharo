Class {
	#name : #GtSearchMethodsInPackageFilter,
	#superclass : #GtSearchMethodsFilter,
	#instVars : [
		'package'
	],
	#category : #'GToolkit-Pharo-Coder-Filters'
}

{ #category : #comparing }
GtSearchMethodsInPackageFilter >> = anObject [
	self == anObject ifTrue: [ ^ true ].
	self class = anObject class ifFalse: [ ^ false ].
	^ package = anObject package
]

{ #category : #accessing }
GtSearchMethodsInPackageFilter >> defaultFilterScope [
	^ self
]

{ #category : #comparing }
GtSearchMethodsInPackageFilter >> hash [
	^ self class hash bitXor: self package hash
]

{ #category : #testing }
GtSearchMethodsInPackageFilter >> includesMethod: aCompiledMethod [
	^ aCompiledMethod package = package
]

{ #category : #enumerating }
GtSearchMethodsInPackageFilter >> itemsDo: aBlock [
	^ self methodsDo: aBlock
]

{ #category : #enumerating }
GtSearchMethodsInPackageFilter >> methodsDo: aBlock [
	package methods do: aBlock.
]

{ #category : #accessing }
GtSearchMethodsInPackageFilter >> package [ 	
	^ package
]

{ #category : #accessing }
GtSearchMethodsInPackageFilter >> package: aPackage [
	package := aPackage
]
