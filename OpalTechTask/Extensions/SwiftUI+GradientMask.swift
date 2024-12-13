//
//  SwiftUI+GradientMask.swift
//  OpalTechTask
//
//  Created by Beka Demuradze on 13.12.24.
//

import SwiftUI

// TODO: Grab theme from environment
extension View {
    func gradientMask(
        _ gradient: Gradient = Gradient(colors: [.blue, .purple]),
        startPoint: UnitPoint = .leading,
        endPoint: UnitPoint = .trailing
    ) -> some View {
        self
            .overlay {
                LinearGradient(gradient: gradient, startPoint: startPoint, endPoint: endPoint)
            }
            .mask(self)
    }
}

