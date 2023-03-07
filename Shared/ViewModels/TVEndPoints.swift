//
//  TSDBEndPoints.swift
//  Potpourri
//
//  Created by sufan on 8/18/20.
//

import Foundation

protocol API {
    static var baseUrl: String { get }
}

extension API {
    var endPoint: NSURLComponents {
        let endPoint = NSURLComponents()
        endPoint.scheme = "https"
        endPoint.host = Self.baseUrl

        return endPoint
    }
}

struct TVEndPoints: API {
    static var baseUrl = "api.tvmaze.com"

    static let schedulePath = "/schedule"
    static let searchShowsPath = "/search/shows"
    static let singleSearchShowsPath = "/singlesearch/shows"
}
