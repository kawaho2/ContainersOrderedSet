"CTOrderedSet iterator class and factory
File: CTOrderedSet-Iterator.st
"

Object subclass: #CTOrderedSetIterator
    instanceVariableNames: 'snapshot index'
    classVariableNames: ''
    package: 'ContainersOrderedSet-Iteration'.

CTOrderedSetIterator>>initializeFrom: anOrderedSet
    "Make a snapshot array so iterator remains stable while set mutates."
    snapshot := OrderedCollection new.
    anOrderedSet do: [:e | snapshot add: e ].
    index := 0.
    ^ self.

CTOrderedSetIterator>>hasNext
    ^ index < snapshot size.

CTOrderedSetIterator>>next
    (self hasNext) ifFalse: [ self error: 'No next element' ].
    index := index + 1.
    ^ snapshot at: index.

"Factory on CTOrderedSet"
CTOrderedSet>>iterator
    ^ (CTOrderedSetIterator new initializeFrom: self).
