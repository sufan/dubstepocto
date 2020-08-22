//
//  TVNetworkModel.swift
//  Potpourri
//
//  Created by sufan on 8/19/20.
//

struct TVNetworkModel: Decodable {
    let id: Int
    let name: String
    let country: TVCountryModel
}
