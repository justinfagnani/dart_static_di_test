dart_static_di_test
===================

A quick test of different styles of code generation for DI in Dart.

This project compares two style of code generation for a simplified DI
container.

### Map of Factory Closures

A Map of Type to factory closure and dependencies. To create an instance, DI
code looks up the factory and dependencies, recursively creates instances of
dependencies, then invokes the factory with Function.apply(). This is similar
to Angular's `di.dart`'s static generated code.

This style is used in `static_test.dart`

### Direct-calling Factory Methods

A set of factory instance methods that directly call factories of their
dependencies. This is similar to GIN and Dagger 2.0. In this case dart2js
can see the code paths that call constructors, tree-shake away unused
classes, and perform type inference through DI invoked constructors.

This style is used in `static_test_2.dart`

## How to Run

The easiest way is to select "Run a JavaScript" from the contextual menu's for
the HTML files in the Dart Editor.

## Results

Much of the results are dependent on how many and which bound classes are
instantiated in a particular app, how many dependencies they pull in, how many
method signatures match call sites, etc.

In this simple example the map-of-factories approach produces 5x the minified,
unchecked dart2js output, and instance creation is 500x slower, compared to the
factory-methods approach. By eliminating the dependencies of the unused bound
classes the map-of-factories approach **only** produces 2x the dart2js output.
