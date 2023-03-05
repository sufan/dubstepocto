//
//  String+Date.swift
//  Potpourri
//
//  Created by sufan on 3/3/23.
//

import Foundation

extension String {
    /**
     Convert a string into Date.
     */
    var date: Date? {
        let types: NSTextCheckingResult.CheckingType = [.date]
        let detector = try? NSDataDetector(types: types.rawValue)
        
        guard let result = detector?.firstMatch(in: self, range: NSRange(0..<count))?.date else {
            return nil
        }
        
        return result
    }
}
