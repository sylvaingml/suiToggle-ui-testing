//
//  ContentViewTestProxy.swift
//  suiToggleUITests
//
//  Created by Sylvain on 09/02/2023.
//

import XCTest


struct ContentViewTestProxy {
  let app: XCUIApplication
  
  var pinToggle: XCUIElement {
    app.switches
      .element(matching: .switch, identifier: ContentViewA11y.pinToggle.rawValue)
  }
  
  var sharedToggle: XCUIElement {
    app.switches
      .element(matching: .switch, identifier: ContentViewA11y.sharedToggle.rawValue)
  }
}
