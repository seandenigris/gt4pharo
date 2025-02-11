Extension { #name : #GtPharoSourceCoder }

{ #category : #'*GToolkit-Pharo-Coder-AddOns' }
GtPharoSourceCoder >> colorAddOnFor: anAST into: coderAddOns [
	<gtAstCoderAddOns: 100>
	coderAddOns addStyler: GtPharoColorStyler new
]

{ #category : #'*GToolkit-Pharo-Coder-AddOns' }
GtPharoSourceCoder >> haltAddOnFor: anAST into: coderAddOns [
	<gtAstCoderAddOns: 20>
	coderAddOns addStyler: GtPharoHaltStyler new
]
