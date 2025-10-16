"CTOrderedSet - small usage examples
File: CTOrderedSet-TestsExamples.st
"

"Create and play"
| s1 s2 u i p popped it mapped filtered jsonStr restored |
s1 := CTOrderedSet new.
s1 add: 'Apple'; add: 'Banana'; add: 'Cherry'.
s1 add: 'Banana'. "ignored duplicate"
Transcript show: 's1: ', (s1 asArray printString); cr.

"move operations"
s1 moveToFront: 'Banana'.
Transcript show: 'after moveToFront Banana: ', (s1 asArray printString); cr.
s1 moveToBack: 'Apple'.
Transcript show: 'after moveToBack Apple: ', (s1 asArray printString); cr.

"peek / pop"
Transcript show: 'peek 2: ', (s1 peek: 2) printString; cr.
popped := s1 popFirst.
Transcript show: 'popped first: ', popped printString; cr.

"set ops"
s2 := CTOrderedSet new.
s2 add: 'Date'; s2 add: 'Banana'; s2 add: 'Elderberry'.
u := CTOrderedSet union: s1 with: s2.
Transcript show: 'union: ', (u asArray printString); cr.
i := CTOrderedSet intersection: s1 with: s2.
Transcript show: 'intersection: ', (i asArray printString); cr.
p := CTOrderedSet difference: s1 minus: s2.
Transcript show: 'difference: ', (p asArray printString); cr.

"map/select"
mapped := s1 map: [:x | x asUppercase].
Transcript show: 'mapped: ', (mapped asArray printString); cr.
filtered := s1 select: [:x | (x size > 5)].
Transcript show: 'filtered: ', (filtered asArray printString); cr.

"iterator"
it := s1 iterator.
[ it hasNext ] whileTrue: [ Transcript show: it next; cr ].

"JSON (if supported)"
jsonStr := s1 toJSON.
Transcript show: 'jsonStr: ', jsonStr; cr.
restored := CTOrderedSet fromJSON: jsonStr.
Transcript show: 'restored: ', (restored asArray printString); cr.
