#  UI Tests for Toggle on iOS/iPadOS

This project shows how to implement UI tests that will interact with toggle components on iOS and iPadOS.

Indeed, simply using `tap()` on a switch or toggle `XCUIElement` will not do a lot.

This is because the tap point will interact with the center of the view, which is most of the time empty or the textual label.

![togggle widget]

To make thing work I implemented functions as `XCTestCase` extensions to be able to find the proper tapping point at switch center, _interact_ with it, and check the toggle state.

[togggle widget]: doc/img/togglesTap@3x.png "Taping the center of a toggle does nothing"

