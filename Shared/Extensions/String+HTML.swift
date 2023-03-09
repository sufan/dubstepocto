//
//  String+HTML.swift
//  Potpourri
//
//  Created by sufan on 3/6/23.
//

import Foundation
import SwiftUI

extension String {
    /**
     Retrieve the attributed version of the html string if possible.
     */
    var attributedHTML: NSAttributedString? {
        // The HTML importer should be called from a main thread.
        guard Thread.current.isMainThread else {
            return nil
        }

        let attributedHTML = try? NSAttributedString(data: Data(self.utf8),
                                                     options: [.documentType: NSAttributedString.DocumentType.html],
                                                     documentAttributes: nil)
        
        return attributedHTML
    }
}
