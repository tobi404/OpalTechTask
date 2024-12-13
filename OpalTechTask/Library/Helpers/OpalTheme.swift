//
//  OpalTheme.swift
//  OpalTechTask
//
//  Created by Beka Demuradze on 14.12.24.
//

import SwiftUI

struct OpalTheme {
    let gradientStart: Color
    let gradientEnd: Color
    let meshGradient: MeshGradient
}

extension OpalTheme {
    static let defaultTheme = OpalTheme(
        gradientStart: .purple,
        gradientEnd: .blue,
        meshGradient: MeshGradient(
            width: 3,
            height: 3,
            points: [
                .init(0, 0),
                .init(0.5, 0),
                .init(1, 0),
                .init(0, 0.5),
                .init(0.5, 0.5),
                .init(1, 0.5),
                .init(0, 1),
                .init(0.5, 1),
                .init(1, 1)
            ],
            colors: [
                .opalIndigo,
                .opalViolet,
                .opalViolet,
                .opalViolet,
                .opalIndigo,
                .opalIndigo,
                .opalViolet,
                .opalIndigo,
                .opalIndigo,
                .opalViolet,
            ],
            background: .opalIndigo
        )
    )
}
