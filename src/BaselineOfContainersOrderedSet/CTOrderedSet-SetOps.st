"CTOrderedSet - set operations (returning CTOrderedSet)
File: CTOrderedSet-SetOps.st
"

CTOrderedSet class>>union: aSet with: bSet
    "Return a new CTOrderedSet containing elements of aSet followed by new elements from bSet preserving first occurrence order."
    | result |
    result := self new.
    aSet do: [:e | result add: e ].
    bSet do: [:e | (result includes: e) ifFalse: [ result add: e ] ].
    ^ result.

CTOrderedSet class>>intersection: aSet with: bSet
    "Return new CTOrderedSet containing elements present in both, in the order they appear in aSet."
    | result |
    result := self new.
    aSet do: [:e | (bSet includes: e) ifTrue: [ result add: e ] ].
    ^ result.

CTOrderedSet class>>difference: aSet minus: bSet
    "Return new CTOrderedSet containing elements in aSet that are not in bSet (preserve aSet order)."
    | result |
    result := self new.
    aSet do: [:e | (bSet includes: e) ifFalse: [ result add: e ] ].
    ^ result.
