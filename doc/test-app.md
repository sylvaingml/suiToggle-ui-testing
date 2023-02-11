#  Simple Test App


This project uses a tiny `SwiftUI` application that expose
a single view with two `Toggle`.

![The application after launch][appui]

The application is composed of two classes:

- `SuiToggleApp` is the entry point of the app
- `ContentView` is the view that includes two `Toggle` views.


[appui]: img/SuiToggleApp@3x.png "Test app UI on launch" height=20rem


## Test Goals

For this example I implement two kind of tests:

1. checking the state of toggle
2. interacting with toggle and verify that is was updated

