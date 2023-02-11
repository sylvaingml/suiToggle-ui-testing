//
//  ContentViewTestProxy.swift
//  suiToggleUITests
//
//  Created by Sylvain on 09/02/2023.
//

import XCTest


/// Proxy class for the ``ContentView`` view.
///
/// This is a facade object to manipulate a real view from our test
/// using only element queries and element API.
///
/// > Note: Even if we use enum from the app target, we do not need to
/// > import them as these are part of both targets.
///
public struct ContentViewTestProxy {
  
  /// The main view proxy needs the current app instance
  let app: XCUIApplication
  
  /// Element for UI tests referencing the _pinned_ toggle.
  var pinToggle: XCUIElement {
    app.switches
      .element(matching: .switch, identifier: ContentViewA11y.pinToggle.rawValue)
  }
  
  /// Element for UI tests referencing the _shared_ toggle.
  var sharedToggle: XCUIElement {
    app.switches
      .element(matching: .switch, identifier: ContentViewA11y.sharedToggle.rawValue)
  }
}
