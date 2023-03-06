//
//  PotpourriApp.swift
//  Shared
//
//  Created by sufan on 8/10/20.
//

import SwiftUI

@main
struct PotpourriApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

struct PotpourriApp_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
            ContentView()
                .environment(\.locale, .init(identifier: "en_GB"))
                .previewDevice("iPhone SE (2nd generation)")
                .preferredColorScheme(.dark)
        }
    }
}
