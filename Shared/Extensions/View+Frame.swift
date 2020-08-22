//
//  View+Frame.swift
//  Potpourri
//
//  Created by sufan on 8/13/20.
//

import AVFoundation
import SwiftUI

extension View {
    /**
     Positions this view within an invisible scaled frame that maintains the specified aspect ratio within a bounding rectangle.
     
     - Parameters:
        - width: The width of the bounding rectangle.  If width is nil, the resulting view assumes the greatest finite width.
        - height: The height of the bounding rectangle.  If width is nil, the resulting view assumes the greatest finite height.
        - aspectRatio: The aspect ratio to maintain.
     */
    func aspectFrame(width: CGFloat? = nil, height: CGFloat? = nil, aspectRatio: CGSize = .one) -> some View {
        guard width != nil || height != nil else {
            return frame(width: 0, height: 0)
        }
        
        let insideRect = CGRect(x: 0, y: 0, width: width ?? CGFloat.greatestFiniteMagnitude, height: height ?? CGFloat.greatestFiniteMagnitude)
        let aspectRect = AVMakeRect(aspectRatio: aspectRatio, insideRect: insideRect)
        
        return frame(width: aspectRect.width, height: aspectRect.height)
    }
}
