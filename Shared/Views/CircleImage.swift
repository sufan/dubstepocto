//
//  CircleImage.swift
//  Potpourri
//
//  Created by sufan on 8/11/20.
//

import SwiftUI

struct CircleImage: View {
    var imageName: String
    
    var body: some View {
        ImageView(imageName: imageName)
            .clipShape(Circle())
            .overlay(Circle().stroke(Color.white, lineWidth: 4))
            .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
    }
}

struct CircleImage_Previews: PreviewProvider {
    static var previews: some View {
        CircleImage(imageName: "Logo")
    }
}
