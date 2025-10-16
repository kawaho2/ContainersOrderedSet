"CTOrderedSet - pop helpers
File: CTOrderedSet-Pop.st
"

CTOrderedSet>>popFirst
    "Remove and return first element or nil if empty."
    self isEmpty ifTrue: [ ^ nil ].
    | v |
    v := self first.
    self remove: v.
    ^ v.

CTOrderedSet>>popLast
    "Remove and return last element or nil if empty."
    self isEmpty ifTrue: [ ^ nil ].
    | v |
    v := self last.
    self remove: v.
    ^ v.

CTOrderedSet>>popWhile: aBlock
    "Pop elements from front while aBlock value: first returns true. Return collection of popped items."
    | popped |
    popped := OrderedCollection new.
    [ (self notEmpty) and: [ aBlock value: (self first) ] ] whileTrue: [
        popped add: (self popFirst) ].
    ^ popped.
