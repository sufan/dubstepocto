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
            
            TabTodayView(scheduleObservable: observable)
                .tabItem {
                    Image(systemName: "doc.text.image")
                    Text("Today")
                }
                        
            TabScheduleView(scheduleObservable: observable)
                .tabItem {
                    Image(systemName: "calendar")
                    Text("Schedule")
                }
            
            TabSearchView()
                .tabItem {
                    Image(systemName: "magnifyingglass")
                    Text("Search")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
