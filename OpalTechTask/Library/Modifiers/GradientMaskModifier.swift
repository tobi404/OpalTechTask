//
//  GradientMaskModifier.swift
//  OpalTechTask
//
//  Created by Beka Demuradze on 14.12.24.
//

import SwiftUI

struct GradientMaskModifier: ViewModifier {
    @Environment(\.theme) var theme

    func body(content: Content) -> some View {
        content
            .overlay {
                LinearGradient(
                    gradient: .init(
                        colors: [theme.gradientStart, theme.gradientEnd]
                    ),
                    startPoint: .leading,
                    endPoint: .trailing
                )
            }
            .mask(content)
    }
}

extension View {
    func gradientMask() -> some View {
        self
            .modifier(GradientMaskModifier())
    }
}
