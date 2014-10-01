"
This class is a set of NFA states. It wraps an IdentitySet and keeps track of if any of its states is accepting.
"
Class {
	#name : #XMLNFAStateSet,
	#superclass : #Collection,
	#instVars : [
		'set',
		'isAccepting'
	],
	#category : #'XML-Parser-Validation-DFA'
}

{ #category : #comparing }
XMLNFAStateSet >> = anObject [
	^ self == anObject
		or: [self class == anObject class
			and: [set = anObject set]]
]

{ #category : #adding }
XMLNFAStateSet >> add: aState [
	isAccepting
		ifFalse: [isAccepting := aState isAccepting].

	^ set add: aState.
]

{ #category : #enumerating }
XMLNFAStateSet >> do: aBlock [
	set do: aBlock
]

{ #category : #comparing }
XMLNFAStateSet >> hash [
	^ set hash
]

{ #category : #testing }
XMLNFAStateSet >> includes: aState [
	^ set includes: aState
]

{ #category : #initialization }
XMLNFAStateSet >> initialize [
	super initialize.

	set := IdentitySet new.
	isAccepting := false.
]

{ #category : #testing }
XMLNFAStateSet >> isAccepting [
	^ isAccepting
]

{ #category : #removing }
XMLNFAStateSet >> remove: aState ifAbsent: anExceptionBlock [
	set
		remove: aState
		ifAbsent: [^ anExceptionBlock value].

	isAccepting
		ifTrue: [isAccepting := set anySatisfy: [:each | each isAccepting]].

	^ aState.
]

{ #category : #accessing }
XMLNFAStateSet >> set [
	^ set
]

{ #category : #accessing }
XMLNFAStateSet >> size [
	^ set size
]