//
//  ShowDetailsView.swift
//  Potpourri
//
//  Created by sufan on 9/1/20.
//

import SwiftUI

struct ShowDetailsView: View {
    @State private var zoomed = false
    var show: TVShowModel?
    
    var body: some View {
        ScrollView {
            if zoomed {
                ImageView(imageName: show?.image?.medium.httpsString ?? "")
                    .aspectRatio(contentMode: .fill)
                    .onTapGesture {
                        withAnimation {
                            zoomed.toggle()
                        }
                    }
            } else {
                VStack {
                    CircleImage(imageName: show?.image?.medium.httpsString ?? "")
                        .aspectRatio(contentMode: .fit)
                        .onTapGesture {
                            withAnimation {
                                zoomed.toggle()
                            }
                        }
                    
                    Text(show?.summary ?? "N/A")
                        .font(.body)
                }
                .padding()
            }
        }
        .navigationTitle(show?.name ?? "")
    }}

struct ShowDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ShowDetailsView(show: testShow)
        }
    }
}
