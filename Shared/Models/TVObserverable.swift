//
//  TestStoreModel.swift
//  Potpourri
//
//  Created by sufan on 8/12/20.
//

import Alamofire
import SwiftUI

class TVObserverable: ObservableObject {
    @Published var schedules = [TVScheduleModel]()
    
    private let apiPath = "/schedule"
    
    init() {
        fetchCharacters()
    }
    
    func fetchCharacters() {
        AF.request(TVEndPoints.baseURL + apiPath)
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
