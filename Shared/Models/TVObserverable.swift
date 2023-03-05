//
//  TestStoreModel.swift
//  Potpourri
//
//  Created by sufan on 8/12/20.
//

import Alamofire
import SwiftUI

class TVObserverable: ObservableObject {
    enum Source {
        case server
        case preview
    }
    
    @Published var schedules = [TVScheduleModel]()
    
    private let apiPath = "/schedule"
    
    init(source: Source = .server) {
        switch source {
        case .server:
            fetchCharacters()
        case .preview:
            fetchPreview()
        }
    }
        
    private func fetchPreview() {
        self.schedules = testSchedules
    }
    
    private func fetchCharacters() {
        let endPoint = TVEndPoints().endPoint
        endPoint.path = TVEndPoints.schedulePath
        
        guard let url = endPoint.url?.absoluteString else {
            return
        }
        
        AF.request(url)
            .validate()
            .responseDecodable(of: [TVScheduleModel].self) { response in
                guard let schedules = response.value else {
                    debugPrint(response)
                    return
                }
                
                self.schedules = schedules
            }
    }
}
