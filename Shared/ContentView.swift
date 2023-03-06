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
                    Text("MAIN_TABVIEW_TODAY")
                }
                        
            TabScheduleView(scheduleObservable: observable)
                .tabItem {
                    Image(systemName: "calendar")
                    Text("MAIN_TABVIEW_SCHEDULE")
                }
            
            TabSearchView()
                .tabItem {
                    Image(systemName: "magnifyingglass")
                    Text("MAIN_TABVIEW_SEARCH")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
            ContentView()
                .previewDevice("iPhone SE (3rd generation)")
                .environment(\.locale, .init(identifier: "en_GB"))
        }
    }
}
