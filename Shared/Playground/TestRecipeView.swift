//
//  RecipeView.swift
//  Potpourri
//
//  Created by sufan on 8/11/20.
//

import MapKit
import SDWebImageSwiftUI
import SwiftUI

struct TestRecipeView: View {
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
                    
                    HStack {
                        let hashValue = abs(show?.name.hash ?? 0)
                        ForEach(1..<(hashValue % 10)+1) { i in
                            let ingredientIndex = hashValue/(i*10) % unown.count
                            Image(systemName: unown[ingredientIndex])
                                .font(.headline)
                                .imageScale(.large)
                        }
                        Spacer()
                    }
                    .padding(.top)
                }
                .padding()
            }
        }
        .navigationTitle(show?.name ?? "")
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            TestRecipeView(show: testShow)
        }
    }
}
