Extension { #name : #GtSearchMethodsWithPackagePatternFilter }

{ #category : #'*GToolkit-Pharo-Coder-UI' }
GtSearchMethodsWithPackagePatternFilter class >> filterDescriptorFor: aMethodsCoder [
	^ GtFilterDescriptor
		creator: [ :value | self pattern: value ]
		named: 'Package'
		order: 30
		completion:
			(GtStringsCompletionStrategy new
				completions: aMethodsCoder packageNames)
]
