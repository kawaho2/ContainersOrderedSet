# Containers-OrderedSet

![Pharo Version](https://img.shields.io/badge/Pharo-10+-blue)
[![License: MIT](https://img.shields.io/badge/License-MIT-green.svg)](LICENSE)

A `CTOrderedSet` is a collection that combines the properties of a `Set` and an `OrderedCollection`. It maintains the order of elements while ensuring that there are no duplicates, similar to a `Set`. This makes it a useful data structure when you need to keep track of the order in which items were added, while also enforcing uniqueness.

### Key Features
- **Maintains Insertion Order**: Elements are stored in the order they were added.
- **Ensures Uniqueness**: No duplicate elements are allowed.
- **Indexed Access**: Elements can be accessed by their index, similar to an array.
- **Rich API**: Combines methods from both `Set` and `OrderedCollection`, allowing for flexible usage.
- **Developer Productivity**: Simplifies code by eliminating the need for manual duplicate checks and order management.

## Installation
To install `CTOrderedSet`, go to the Playground in your [Pharo](https://pharo.org/) image and execute the following Metacello script (select it and press Do-it button or `Ctrl+D`):

```Smalltalk
Metacello new
  baseline: 'ContainersOrderedSet';
  repository: 'github://pharo-containers/Containers-OrderedSet/src';
  load.
```

## How to depend on it?

If you want to add a dependency on OrderedSet to your project, include the following lines into your baseline:

```Smalltalk
spec
  baseline: 'ContainersOrderedSet'
  with: [ spec repository: 'github://pharo-containers/Containers-OrderedSet/src' ].
```

To read more about baselines and Metacello, check out the [Baselines](https://github.com/pharo-open-documentation/pharo-wiki/blob/master/General/Baselines.md) article on [Pharo Wiki](https://github.com/pharo-open-documentation/pharo-wiki).

## How to use it?
You can create an `OrderedSet` and use it like this:
```smalltalk
| orderedSet |
orderedSet := CTOrderedSet new.
orderedSet add: 'Apple'.
orderedSet add: 'Banana'.
orderedSet add: 'Apple'.  "This will not add a duplicate"
orderedSet add: 'Cherry'.
orderedSet do: [ :each | Transcript show: each; cr ].
```
This will output:
```
Apple
Banana
Cherry
```

### Real World Use Case: Blog Tag Management
Let's explore a comprehensive example that demonstrates the power of `OrderedSet` in a real-world scenario - managing tags for a blog post. This example illustrates how to maintain order, ensure uniqueness, and perform efficient operations on tags.

```smalltalk
"Blog post tag management - Maintain order, Ensure uniqueness"

"Traditional approach with OrderedCollection - problematic"
blogTags := OrderedCollection new.
blogTags 
    add: 'Programming'; 
    add: 'Pharo'; 
    add: 'Tutorial'; 
    add: 'Programming';  "Oops! Duplicate"
    add: 'Beginner';
    add: 'Pharo'.        "Another duplicate"
"Manual cleanup required - inefficient and error-prone"
blogTags := blogTags asSet asOrderedCollection.  "Loses order!"
"Result: Unpredictable order, Manual management needed"

"OrderedSet approach - Elegant and Automatic"
blogTags := CTOrderedSet new.
blogTags 
    add: 'Programming'; 
    add: 'Pharo'; 
    add: 'Tutorial'; 
    add: 'Programming';  "Automatically ignored - No duplicate"
    add: 'Beginner';
    add: 'Pharo'.        "Automatically ignored - No duplicate"

"Result: #('Programming' 'Pharo' 'Tutorial' 'Beginner') - Perfect order, No duplicates"

"Adding tags from user input or external sources"
userInputTags := #('Advanced' 'Programming' 'Smalltalk' 'Tutorial').
blogTags addAll: userInputTags.
"Result: #('Programming' 'Pharo' 'Tutorial' 'Beginner' 'Advanced' 'Smalltalk') - Maintains order, no duplicates"
"Notice: Duplicates automatically filtered, new tags appended in order"

blogTags includes: 'Pharo'. "Returns: True"
blogTags includes: 'JavaScript'. "Returns: False"

firstTag := blogTags first. "Access first tag - 'Programming'"
lastTag := blogTags last.   "Access last tag - 'Smalltalk'" 
thirdTag := blogTags at: 3. "Access third tag - 'Tutorial'"
```

### Comparison with Alternatives

| Feature | OrderedCollection | Set | CTOrderedSet |
|---------|------------------|-----|-------------|
| Maintains order | Yes | No | Yes |
| Prevents duplicates | No | Yes | Yes |
| Indexed access | Yes | No | Yes |
| Manual Duplicate Check | Required | Not Required | Not Required |

## Contributing

This is part of the Pharo Containers project. Feel free to contribute by implementing additional methods, improving tests, or enhancing documentation.