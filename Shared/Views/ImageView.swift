//
//  ImageView.swift
//  Potpourri
//
//  Created by sufan on 8/12/20.
//

import SDWebImageSwiftUI
import SwiftUI

struct ImageView: View {
    var imageName: String?
    
    var body: some View {
        if let imageName {
            if UIImage(named: imageName) != nil {
                Image(imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            } else if UIImage(systemName: imageName) != nil {
                Image(systemName: imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            } else {
                WebImage(url: URL(string: imageName))
                    .resizable()
                    .placeholder(Image(systemName: "photo"))
                    .aspectRatio(contentMode: .fit)
                    .transition(.fade(duration: 0.5))
            }
        }
    }
}

struct ImageView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ImageView(imageName: "https://github.githubassets.com/images/modules/logos_page/GitHub-Mark.png")
            ImageView(imageName: "Logo")
            ImageView(imageName: "photo")
            ImageView(imageName: "@")
        }
    }
}
