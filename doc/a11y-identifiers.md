#  Accessibility Identifiers

## Why?

Your test could use label or tag to search for a UI element.
So _why_ should you more rely on identifiers?

First, labels will not work properly with localization. 
_Do you really don't care to support single-language app?_

Tags are just numbers. Managing collision between views will quickly
be a nightmare. Just don't.

Using accessibility identifier is a nice way to implement reliable UI tests 
and also make sure your app will be more accessible.

> _Never_ forget to test for accessibility (a11y) to include a maximum
> number of users.

## What to do? 

Each element in the UI that must be manipulated by a UI test should have
a unique identifier for accessibility (_a11y_).

To define the accessibility identifier of a view you need to apply 
a dedicated modifier:

```swift
Toggle("Label for toggle", isOn: $toggleState)
  .accessibilityIdentifier("element-id")
```

This is something quite similar to HTML DOM identifier, except that
on iOS nothing really requires uniqueness of this identifier,
_but consider it's better to have a unique one_.

```html
<h1 id="main-title">...</h1>
```

## My implementation pattern

Identifiers are `String` values.

You _could_ hardcode values when calling the modifiers.
But this is not a good idea as _you will need to share those identifiers with test code_.

An easy implementation is to use a `String` enumeration to keep track of those ids.

To be able to share the enumeration between application and test target, I follow
a simple pattern:

> If I need to test _SomeView_ view then:
> 
> - I define all sub view identifiers in a _SomeViewA11y_ file as an enum,
> - File is include both in main target and UI-tests target


For a _SomeView_ class, the accessibility identifier enumeration will be
_SomeViewA11y_.

```swift
public enum SomeViewA11y: String {
  case element1 = "someView/element1"
  …
}
```

This pattern could certainly be improved, but this is not the scope of this example project.
