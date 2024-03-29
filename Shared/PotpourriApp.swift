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
            GeometryReader(content: { geometry in
                ContentView()
                    .environment(\.geometry, geometry.size)
            })
        }
    }
}

struct PotpourriApp_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
            ContentView()
                .previewDevice("iPhone SE (3rd generation)")
                .environment(\.locale, .init(identifier: "en_GB"))
        }
    }
}
