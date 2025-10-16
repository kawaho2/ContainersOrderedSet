"CTOrderedSet - map and select returning CTOrderedSet
File: CTOrderedSet-MapFilter.st
"

CTOrderedSet>>map: aBlock
    "Return a new CTOrderedSet containing block applied to each element, preserving first occurrence order of results."
    | result |
    result := CTOrderedSet new.
    self do: [:e | result add: (aBlock value: e) ].
    ^ result.

CTOrderedSet>>select: aBlock
    "Return a CTOrderedSet of elements that satisfy aBlock (preserve order)."
    | result |
    result := CTOrderedSet new.
    self do: [:e | (aBlock value: e) ifTrue: [ result add: e ] ].
    ^ result.
