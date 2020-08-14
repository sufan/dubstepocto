//
//  TestStoreModel.swift
//  Potpourri
//
//  Created by sufan on 8/12/20.
//

import SwiftUI
import Combine

final class StoreData: ObservableObject {
    @Published var showPopularOnly = false
    @Published var menu = testData
}
