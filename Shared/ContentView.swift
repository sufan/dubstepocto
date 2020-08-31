//
//  ContentView.swift
//  Potpourri
//
//  Created by sufan on 8/10/20.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            let observable = TVObserverable()
            TestLazyView(scheduleObservable: observable)
                .tabItem {
                    Image(systemName: "square.stack.3d.up")
                    Text("Stack")
                }
                        
            TestGridView(scheduleObservable: observable)
                .tabItem {
                    Image(systemName: "square.grid.2x2")
                    Text("Grid")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
