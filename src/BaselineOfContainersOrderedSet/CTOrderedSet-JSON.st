"CTOrderedSet - JSON persistence (lightweight)
File: CTOrderedSet-JSON.st
"

CTOrderedSet>>toJSON
    "Return a JSON string representing the ordered elements array.
    Uses 'asJson' if present in image, otherwise returns a printed array string."
    | arr |
    arr := OrderedCollection new.
    self do: [:e | arr add: e ].
    (arr respondsTo: #asJson) ifTrue: [ ^ arr asJson ].
    ^ arr printString.

CTOrderedSet class>>fromJSON: jsonString
    "Create a CTOrderedSet from JSON representing an array of elements.
    If the image doesn't have a JSON parser, try 'readable' printstring fallback using Compiler evaluate."
    | arr result |
    (Smalltalk at: #JSON ifAbsent: [ nil ]) ifNotNil: [
        arr := (JSON readFrom: (String streamContents: [:s | s nextPutAll: jsonString ])).
        result := self new.
        (arr isKindOf: Array or: [ arr isKindOf: OrderedCollection ]) ifTrue: [ arr do: [:e | result add: e ] ].
        ^ result ].
    "Fallback: attempt to evaluate string to collection (only safe for trusted data)"
    [ arr := Compiler evaluate: jsonString ] on: Error do: [:ex | ^ self new ].
    result := self new.
    arr do: [:e | result add: e ].
    ^ result.
