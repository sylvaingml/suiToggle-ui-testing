//
//  ContentViewA11y.swift
//  suiToggle
//
//  Created by Sylvain on 09/02/2023.
//

import Foundation


/// Identifiers of UI elements in ``ContentView``.
///
/// > Note: Ensure this enum is part of both the app and the UI-tests target.
///
public enum ContentViewA11y: String {
  
  /// First toggle controlling the _pinned_ option.
  case pinToggle = "content/pin"
  
  /// Second toggle controling the _shared_ option.
  case sharedToggle = "content/shared"
  
}
