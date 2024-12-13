//
//  OpalThemeEnvironment.swift
//  OpalTechTask
//
//  Created by Beka Demuradze on 14.12.24.
//

import SwiftUI

private struct ThemeKey: EnvironmentKey {
    static let defaultValue: OpalTheme = .defaultTheme
}

extension EnvironmentValues {
    var theme: OpalTheme {
        get { self[ThemeKey.self] }
        set { self[ThemeKey.self] = newValue }
    }
}
