//
//  ContentView.swift
//  suiToggle
//
//  Created by Sylvain on 09/02/2023.
//

import SwiftUI


/// Main view of the application.
///
/// This is the view to be tested.
///
/// It includes two toggles.
///
/// Our tests will have to check their initial state, change it and verify it
/// was updated.
///
struct ContentView: View {
  
  /// State for first _pinned_ toggle.
  @State private var pinned: Bool = false
  
  /// State for second _shared_ toggle.
  @State private var shared: Bool = true
  
  
  /// Body of this view.
  ///
  /// This is a simple list where each element is a toggle.
  /// 
  var body: some View {
    List {
      Toggle("Pin on top", isOn: $pinned)
        .accessibilityIdentifier(ContentViewA11y.pinToggle.rawValue)
      
      Toggle("Share this", isOn: $shared)
        .accessibilityIdentifier(ContentViewA11y.sharedToggle.rawValue)

    }
  }
}

#if DEBUG

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}

#endif

