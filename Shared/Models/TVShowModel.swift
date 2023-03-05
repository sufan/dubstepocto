//
//  TVShowModel.swift
//  Potpourri
//
//  Created by sufan on 8/19/20.
//

struct TVShowModel: Decodable, Identifiable {
    let id: Int
    let name: String
    let type: String
    let language: String?
    let genres: [String]
    let status: String
    let runtime: Int?
    let premiered: String?
    let officialSite: String?
    let schedule: TVShowScheduleModel
    let rating: TVShowRatingModel
    let weight: Int
    let network: TVNetworkModel?
    let externals: TVShowExternalsModel
    let image: TVImageModel?
    let summary: String?
    let updated: Int
}
