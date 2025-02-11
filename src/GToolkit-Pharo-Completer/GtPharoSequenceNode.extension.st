Extension { #name : #GtPharoSequenceNode }

{ #category : #'*GToolkit-Pharo-Completer' }
GtPharoSequenceNode >> completionActionsFor: aStrategy [
	| statementBefore periodIndex receiver |
	(rightBar notNil and: [ rightBar startPosition >= aStrategy index ])
		ifTrue: [ ^ #() ].
	statements
		do: [ :each | 
			(aStrategy index between: each startPosition and: each stopPosition)
				ifTrue: [ ^ each completionActionsFor: aStrategy ] ].
	aStrategy wasRequested
		ifFalse: [ ^ #() ].
	statementBefore := statements reversed
		detect: [ :each | aStrategy index > each stopPosition ]
		ifNone: [  ].
	statementBefore isNil
		ifTrue: [ ^ aStrategy variableCompletionActionsFor: self ].
	periodIndex := (1 to: periods size)
		detect: [ :i | (periods at: i) startPosition > aStrategy index ]
		ifNone: [  ].
	(periodIndex isNil
		or: [ periodIndex > 1
				and: [ statementBefore stopPosition
						< (periods at: periodIndex - 1) startPosition ] ])
		ifTrue: [ (periods isEmpty
				or: [ periods last startPosition < statementBefore stopPosition ])
				ifFalse: [ ^ aStrategy variableCompletionActionsFor: self ] ].
	receiver := statementBefore messageReceiver.
	^ (aStrategy
		selectorsForReceiver: (receiver guessType: aStrategy)
		matching: '')
		collect: [ :each | 
			receiver
				actionForSelector: each
				startingWith: ''
				at: aStrategy index
				needsParensKeywords: receiver parent needsParenthesisForKeyword ]
]
