"CTOrderedSet - addFirst/addLast and move helpers
Place into src/ContainersOrderedSet/ as CTOrderedSet-Move.st
"

CTOrderedSet>>addFirst: anObject
    "Ensure uniqueness, then insert anObject as first element."
    (self includes: anObject) ifTrue: [ self remove: anObject ].
    | snapshot |
    snapshot := OrderedCollection new.
    snapshot add: anObject.
    self do: [:each | snapshot add: each ].
    "rebuild in-place"
    self removeAll.
    snapshot do: [:e | self add: e ].
    ^ self.

CTOrderedSet>>addLast: anObject
    "Equivalent to add: but explicit API exists for readability. Ensures uniqueness by removing first."
    (self includes: anObject) ifTrue: [ self remove: anObject ].
    self add: anObject.
    ^ self.

CTOrderedSet>>moveToFront: anObject
    "If present, move anObject to the front. If absent, add it to the front."
    (self includes: anObject) ifTrue: [ self remove: anObject ].
    ^ self addFirst: anObject.

CTOrderedSet>>moveToBack: anObject
    "If present, move anObject to the back. If absent, add to back."
    (self includes: anObject) ifTrue: [ self remove: anObject ].
    ^ self addLast: anObject.
