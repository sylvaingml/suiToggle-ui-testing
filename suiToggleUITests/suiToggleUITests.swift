//
//  suiToggleUITests.swift
//  suiToggleUITests
//
//  Created by Sylvain on 09/02/2023.
//

import XCTest

final class suiToggleUITests: XCTestCase {
  
  var app: XCUIApplication?
  
  
  // MARK: Lifecycle
  
  
  override func setUpWithError() throws {
    continueAfterFailure = false
    
    app = XCUIApplication()
    app?.launch()
  }
  
  override func tearDownWithError() throws {
    app?.terminate()
  }
  
  
  // MARK: Tests
  
  
  func testPinInitialState() throws {
    let contentViewProxy = ContentViewTestProxy(app: app!)
    
    checkToggleIsOff(contentViewProxy.pinToggle)
  }
  
  func testSharedInitialState() throws {
    let contentViewProxy = ContentViewTestProxy(app: app!)
    
    checkToggleIsOn(contentViewProxy.sharedToggle)
  }

  func testTogglePinToOn() throws {
    let contentViewProxy = ContentViewTestProxy(app: app!)
    
    waitForSwitchToBeOff(contentViewProxy.pinToggle, timeOut: 5)
    turnSwitchOn(contentViewProxy.pinToggle)
  }
  
  func testToggleSharedToOff() throws {
    let contentViewProxy = ContentViewTestProxy(app: app!)
    
    waitForSwitchToBeOn(contentViewProxy.sharedToggle, timeOut: 5)
    turnSwitchOff(contentViewProxy.sharedToggle)
  }

}
