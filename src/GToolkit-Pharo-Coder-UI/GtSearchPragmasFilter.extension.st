Extension { #name : #GtSearchPragmasFilter }

{ #category : #'*GToolkit-Pharo-Coder-UI' }
GtSearchPragmasFilter class >> filterDescriptorFor: aMethodsCoder [
	^ GtFilterDescriptor
		creator: [ :value | self forPragma: value ]
		named: 'Pragma'
		order: 11
		completion:
			(GtStringsCompletionStrategy new
				completions: aMethodsCoder pragmaNames)
]
