//
//  ContentView.swift
//  Potpourri
//
//  Created by sufan on 8/10/20.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TestMenuView()
            .environmentObject(StoreData())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}