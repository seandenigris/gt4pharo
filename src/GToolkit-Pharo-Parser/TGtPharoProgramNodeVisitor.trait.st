Trait {
	#name : #TGtPharoProgramNodeVisitor,
	#traits : 'TSmaCCParseNodeVisitor',
	#classTraits : 'TSmaCCParseNodeVisitor classTrait',
	#category : #'GToolkit-Pharo-Parser-Parser'
}

{ #category : #generated }
TGtPharoProgramNodeVisitor >> visitArray: anArray [
	^ self visitValue: anArray
]

{ #category : #generated }
TGtPharoProgramNodeVisitor >> visitArrayLiteral: anArrayLiteral [
	^ self visitLiteral: anArrayLiteral
]

{ #category : #generated }
TGtPharoProgramNodeVisitor >> visitAssignment: anAssignment [
	^ self visitValue: anAssignment
]

{ #category : #generated }
TGtPharoProgramNodeVisitor >> visitBinaryMessage: aBinaryMessage [
	^ self visitMessage: aBinaryMessage
]

{ #category : #generated }
TGtPharoProgramNodeVisitor >> visitBlock: aBlock [
	^ self visitValue: aBlock
]

{ #category : #generated }
TGtPharoProgramNodeVisitor >> visitBlockError: aBlockError [
	^ self visitBlock: aBlockError
]

{ #category : #generated }
TGtPharoProgramNodeVisitor >> visitBooleanLiteral: aBooleanLiteral [
	^ self visitLiteral: aBooleanLiteral
]

{ #category : #generated }
TGtPharoProgramNodeVisitor >> visitByteArrayLiteral: aByteArrayLiteral [
	^ self visitArrayLiteral: aByteArrayLiteral
]

{ #category : #generated }
TGtPharoProgramNodeVisitor >> visitCascade: aCascade [
	^ self visitValue: aCascade
]

{ #category : #generated }
TGtPharoProgramNodeVisitor >> visitCharacterLiteral: aCharacterLiteral [
	^ self visitLiteral: aCharacterLiteral
]

{ #category : #generated }
TGtPharoProgramNodeVisitor >> visitError: anError [
	^ self visitValue: anError
]

{ #category : #generated }
TGtPharoProgramNodeVisitor >> visitErrorPattern: anErrorPattern [
	^ self visitMethodPattern: anErrorPattern
]

{ #category : #generated }
TGtPharoProgramNodeVisitor >> visitKeyword: aKeyword [
	^ self visitProgram: aKeyword
]

{ #category : #generated }
TGtPharoProgramNodeVisitor >> visitKeywordMessage: aKeywordMessage [
	^ self visitMessage: aKeywordMessage
]

{ #category : #generated }
TGtPharoProgramNodeVisitor >> visitLiteral: aLiteral [
	^ self visitValue: aLiteral
]

{ #category : #generated }
TGtPharoProgramNodeVisitor >> visitMessage: aMessage [
	^ self visitProgram: aMessage
]

{ #category : #generated }
TGtPharoProgramNodeVisitor >> visitMessageSend: aMessageSend [
	^ self visitValue: aMessageSend
]

{ #category : #generated }
TGtPharoProgramNodeVisitor >> visitMethod: aMethod [
	^ self visitProgram: aMethod
]

{ #category : #generated }
TGtPharoProgramNodeVisitor >> visitMethodPattern: aMethodPattern [
	^ self visitProgram: aMethodPattern
]

{ #category : #generated }
TGtPharoProgramNodeVisitor >> visitMethodSequence: aMethodSequence [
	^ self visitSequence: aMethodSequence
]

{ #category : #generated }
TGtPharoProgramNodeVisitor >> visitName: aName [
	^ self visitProgram: aName
]

{ #category : #generated }
TGtPharoProgramNodeVisitor >> visitNamedVariable: aNamedVariable [
	^ self visitVariable: aNamedVariable
]

{ #category : #generated }
TGtPharoProgramNodeVisitor >> visitNilLiteral: aNilLiteral [
	^ self visitLiteral: aNilLiteral
]

{ #category : #generated }
TGtPharoProgramNodeVisitor >> visitNothing: aNothing [
	^ self visitProgram: aNothing
]

{ #category : #generated }
TGtPharoProgramNodeVisitor >> visitNumberLiteral: aNumberLiteral [
	^ self visitLiteral: aNumberLiteral
]

{ #category : #generated }
TGtPharoProgramNodeVisitor >> visitPeriod: aPeriod [
	^ self visitProgram: aPeriod
]

{ #category : #generated }
TGtPharoProgramNodeVisitor >> visitPragma: aPragma [
	^ self visitProgram: aPragma
]

{ #category : #generated }
TGtPharoProgramNodeVisitor >> visitPragmaError: aPragmaError [
	^ self visitPragma: aPragmaError
]

{ #category : #generated }
TGtPharoProgramNodeVisitor >> visitProgram: aProgram [
	^ self visitSmaCCParseNode: aProgram
]

{ #category : #generated }
TGtPharoProgramNodeVisitor >> visitReturn: aReturn [
	^ self visitProgram: aReturn
]

{ #category : #generated }
TGtPharoProgramNodeVisitor >> visitSelfVariable: aSelfVariable [
	^ self visitVariable: aSelfVariable
]

{ #category : #generated }
TGtPharoProgramNodeVisitor >> visitSequence: aSequence [
	^ self visitProgram: aSequence
]

{ #category : #generated }
TGtPharoProgramNodeVisitor >> visitStringLiteral: aStringLiteral [
	^ self visitLiteral: aStringLiteral
]

{ #category : #generated }
TGtPharoProgramNodeVisitor >> visitSuperVariable: aSuperVariable [
	^ self visitVariable: aSuperVariable
]

{ #category : #generated }
TGtPharoProgramNodeVisitor >> visitSymbol: aSymbol [
	^ self visitProgram: aSymbol
]

{ #category : #generated }
TGtPharoProgramNodeVisitor >> visitSymbolLiteral: aSymbolLiteral [
	^ self visitLiteral: aSymbolLiteral
]

{ #category : #generated }
TGtPharoProgramNodeVisitor >> visitTemplatable: aTemplatable [
	^ self visitProgram: aTemplatable
]

{ #category : #generated }
TGtPharoProgramNodeVisitor >> visitTemplate: aTemplate [
	^ self visitProgram: aTemplate
]

{ #category : #generated }
TGtPharoProgramNodeVisitor >> visitTemplateKeyword: aTemplateKeyword [
	^ self visitTemplatable: aTemplateKeyword
]

{ #category : #generated }
TGtPharoProgramNodeVisitor >> visitTemplateName: aTemplateName [
	^ self visitTemplatable: aTemplateName
]

{ #category : #generated }
TGtPharoProgramNodeVisitor >> visitTemplateSymbol: aTemplateSymbol [
	^ self visitTemplatable: aTemplateSymbol
]

{ #category : #generated }
TGtPharoProgramNodeVisitor >> visitThisContextVariable: aThisContextVariable [
	^ self visitVariable: aThisContextVariable
]

{ #category : #generated }
TGtPharoProgramNodeVisitor >> visitUnaryMessage: anUnaryMessage [
	^ self visitMessage: anUnaryMessage
]

{ #category : #generated }
TGtPharoProgramNodeVisitor >> visitValue: aValue [
	^ self visitProgram: aValue
]

{ #category : #generated }
TGtPharoProgramNodeVisitor >> visitVariable: aVariable [
	^ self visitValue: aVariable
]
