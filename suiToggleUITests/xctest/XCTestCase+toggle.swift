//
//  XCTestCase+toggle.swift
//  suiToggleUITests
//
//  Created by Sylvain on 09/02/2023.
//

import XCTest

extension XCTestCase {
  
  // MARK: Predicates to apply on elements
  
  
  /// Check if an element is in selected state
  static let selectedPredicate = NSPredicate(format: "self.selected == true")
  
  /// Check if an element is in unselected state
  static let notSelectedPredicate = NSPredicate(format: "self.selected == false")
  
  /// Check if an element's value is "1"
  static let switchIsOnPredicate = NSPredicate(format: "value == '1'")
  
  /// Check if an element's value is "0"
  static let switchIsOffPredicate = NSPredicate(format: "value == '0'")
  
  
  // MARK: Checks and actions on toggle/switch widgets
  
  
  /// Wait until the toggle/switch state is _on_.
  ///
  /// This will internally wait for an expectation.
  ///
  /// Your test will fail if the element state is not update to _on_ in the
  /// given time internal limit.
  ///
  /// - Parameters:
  ///   - element: Toggle or Switch element to check.
  ///   - timeOut: Maximum duration to wait for state change.
  ///
  public func waitForSwitchToBeOn(_ element: XCUIElement, timeOut: TimeInterval) {
    let expectation = expectation(for: XCTestCase.switchIsOnPredicate, evaluatedWith: element)
    
    wait(for: [expectation], timeout: timeOut)
  }
  

  /// Wait until the toggle/switch state is _off_.
  ///
  /// This will internally wait for an expectation.
  ///
  /// Your test will fail if the element state is not update to _on_ in the
  /// given time internal limit.
  ///
  /// - Parameters:
  ///   - element: Toggle or Switch element to check.
  ///   - timeOut: Maximum duration to wait for state change.
  ///
  public func waitForSwitchToBeOff(_ element: XCUIElement, timeOut: TimeInterval) {
    let expectation = expectation(for: XCTestCase.switchIsOffPredicate, evaluatedWith: element)
    
    wait(for: [expectation], timeout: timeOut)
  }
    

  /// Verify if a switch is in _on_ state.
  ///
  /// This is checking the switch's value.
  ///
  /// - Parameter toggle: Toggle/Switch to be checked
  ///
  public func checkToggleIsOn(_ toggle: XCUIElement) {
    return verifyToggle(toggle, value: "1")
  }
  

  /// Verify if a switch is in _off_ state.
  ///
  /// This is checking the switch's value.
  ///
  /// - Parameter toggle: Toggle/Switch to be checked
  ///
  public func checkToggleIsOff(_ toggle: XCUIElement) {
    return verifyToggle(toggle, value: "0")
  }
  
  
  /// Change the state of toggle/switch from _off_ to _on_
  ///
  /// Assuming that a toggle is in _off_ state, this action will
  /// change to _on_ and wait until state is updated.
  ///
  /// Test will fail if the toggle/switch final state is not _on_ as expected.
  ///
  /// - Parameter toggle: Toggle or Switch element
  ///
  public func turnSwitchOn(_ toggle: XCUIElement) {
    let whereToTap = tapCoordinate(for: toggle, descendantType: .switch)
    
    // Required initial tap inside the switch,
    // otherwise taping the inner switch will be ignored
    toggle.tap()
    whereToTap.tap()
    
    waitForSwitchToBeOn(toggle, timeOut: 5)
  }
  

  /// Change the state of toggle/switch from _on_ to _off_
  ///
  /// Assuming that a toggle is in _on_ state, this action will
  /// change to _off_ and wait until state is updated.
  ///
  /// Test will fail if the toggle/switch final state is not _on_ as expected.
  ///
  /// - Parameter toggle: Toggle or Switch element
  ///
  public func turnSwitchOff(_ toggle: XCUIElement) {
    let whereToTap = tapCoordinate(for: toggle, descendantType: .switch)
    
    // Required initial tap inside the switch,
    // otherwise taping the inner switch will be ignored
    toggle.tap()
    whereToTap.tap()
    
    waitForSwitchToBeOff(toggle, timeOut: 5)
  }
  
  // MARK: Internal utilities for Toggle/Switches
  
  func verifyToggle(_ toggle: XCUIElement, value expected: String) {
    guard let value = toggle.value as? String
    else {
      let elementInfo = XCTAttachment(string: toggle.debugDescription)
      var issue = XCTIssue(type: .assertionFailure,
                           compactDescription: "Value of element `\(toggle.identifier)` is not a String")
      issue.add(elementInfo)
      return
    }
    
    XCTAssertEqual(expected, value, "Element of type \(toggle.elementType) has not expected value.")
  }
  
  
  // MARK: Geometry utilities
  
  
  /// Build coordinates to the center of an element's first descendant of a given type.
  ///
  /// - Parameters:
  ///   - element: Container element.
  ///   - descendantType: Type of element that we are searching.
  ///
  /// - Returns: A coordinate object to the center of the first matching descendant.
  ///
  public func tapCoordinate(for element: XCUIElement,
                            descendantType: XCUIElement.ElementType) -> XCUICoordinate {
    let descendant = element.descendants(matching: descendantType).firstMatch
    let center = descendant.coordinate(withNormalizedOffset: CGVectorMake(0.5, 0.5))
    return center
  }
  
  
}

