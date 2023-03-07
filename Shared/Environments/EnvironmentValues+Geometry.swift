//
//  EnvironmentValues+Geometry.swift
//  Potpourri
//
//  Created by sufan on 8/13/20.
//

import SwiftUI

struct GeometryKey: EnvironmentKey {
    static var defaultValue: CGSize = .zero
}

extension EnvironmentValues {
    var geometry: CGSize {
        get { self[GeometryKey.self] }
        set { self[GeometryKey.self] = newValue }
    }
}
