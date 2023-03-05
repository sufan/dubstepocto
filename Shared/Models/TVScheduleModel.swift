//
//  TVScheduleModel.swift
//  Potpourri
//
//  Created by sufan on 8/19/20.
//

import Foundation

struct TVScheduleModel: Decodable, Identifiable {
    let id: Int
    let name: String
    let season: Int
    let number: Int?
    let airdate: String
    let airtime: String
    let airstamp: String
    let runtime: Int?
    let show: TVShowModel?
}
