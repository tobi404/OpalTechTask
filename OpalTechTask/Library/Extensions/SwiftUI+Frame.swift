//
//  SwiftUI+Frame.swift
//  OpalTechTask
//
//  Created by Beka Demuradze on 13.12.24.
//

import SwiftUI

extension View {
    func infinite() -> some View {
        self
            .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
    
    func infiniteWidth(alignment: Alignment = .leading) -> some View {
        self
            .frame(maxWidth: .infinity, alignment: alignment)
    }
}
