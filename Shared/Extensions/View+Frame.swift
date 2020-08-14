//
//  View+Frame.swift
//  Potpourri
//
//  Created by sufan on 8/13/20.
//

import AVFoundation
import SwiftUI

extension View {
    func aspectFrame(width: CGFloat? = nil, height: CGFloat? = nil, aspectRatio: CGSize = .one) -> some View {
        let insideRect = CGRect(x: 0, y: 0, width: width ?? CGFloat.greatestFiniteMagnitude, height: height ?? CGFloat.greatestFiniteMagnitude)
        let aspectRect = AVMakeRect(aspectRatio: aspectRatio, insideRect: insideRect)
        
        return frame(width: aspectRect.width, height: aspectRect.height)
    }
}
