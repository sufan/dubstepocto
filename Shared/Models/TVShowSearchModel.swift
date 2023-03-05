//
//  TVShowSearchModel.swift
//  Potpourri
//
//  Created by sufan on 3/3/23.
//

import Foundation

struct TVShowSearchModel: Decodable, Identifiable {
    let id = UUID()
    let score: Double
    let show: TVShowModel?
    
    enum CodingKeys: CodingKey {
        case score
        case show
    }
}
