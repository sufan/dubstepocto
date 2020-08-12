//
//  ContentView.swift
//  Potpourri
//
//  Created by sufan on 8/10/20.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var store = Restaurant()

    var body: some View {
        TestMenuView(store: store)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        TestMenuView(store: testStore)
    }
}
