//
//  String+HTTPS.swift
//  Potpourri
//
//  Created by sufan on 8/19/20.
//

import Foundation

extension String {
    /**
     Provide a string with "https" scheme if possible.
     */
    var httpsString: String {
        guard let url = URL(string: self) else { return self }
        
        var components = URLComponents(url: url, resolvingAgainstBaseURL: false)
        components?.scheme = "https"

        return components?.url?.absoluteString ?? self
    }
}
