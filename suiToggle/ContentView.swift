//
//  ContentView.swift
//  suiToggle
//
//  Created by Sylvain on 09/02/2023.
//

import SwiftUI

struct ContentView: View {
  
  
  @State private var pinned: Bool = false
  @State private var shared: Bool = true
  
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

