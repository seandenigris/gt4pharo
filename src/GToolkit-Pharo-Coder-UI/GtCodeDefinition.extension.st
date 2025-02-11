Extension { #name : #GtCodeDefinition }

{ #category : #'*GToolkit-Pharo-Coder-UI' }
GtCodeDefinition class >> behaviorNameEditorName [
	^ #'editor--behavior-name'
]

{ #category : #'*GToolkit-Pharo-Coder-UI' }
GtCodeDefinition class >> behaviorSuperclassEditorName [
	^ #'editor--superclass-name'
]

{ #category : #'*GToolkit-Pharo-Coder-UI' }
GtCodeDefinition class >> classVariablesEditorName [
	^ #'editor--class-variables'
]

{ #category : #'*GToolkit-Pharo-Coder-UI' }
GtCodeDefinition >> editors [
	<return: #Collection of: #GtCodeDefinitionViewer>
	
	^ #()
]

{ #category : #'*GToolkit-Pharo-Coder-UI' }
GtCodeDefinition class >> packageEditorName [
	^ #'editor--package-name'
]

{ #category : #'*GToolkit-Pharo-Coder-UI' }
GtCodeDefinition class >> poolsEditorName [
	^ #'editor--pools'
]

{ #category : #'*GToolkit-Pharo-Coder-UI' }
GtCodeDefinition >> readers [
	<return: #Collection of: #GtCodeDefinitionViewer>
	
	^ #()
]

{ #category : #'*GToolkit-Pharo-Coder-UI' }
GtCodeDefinition class >> slotsEditorName [
	^ #'editor--slots'
]

{ #category : #'*GToolkit-Pharo-Coder-UI' }
GtCodeDefinition class >> tagEditorName [
	^ #'editor--tag-name'
]

{ #category : #'*GToolkit-Pharo-Coder-UI' }
GtCodeDefinition class >> traitsEditorName [
	^ #'editor--traits'
]
