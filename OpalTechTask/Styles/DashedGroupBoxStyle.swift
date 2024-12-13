//
//  DashedGroupBoxStyle.swift
//  OpalTechTask
//
//  Created by Beka Demuradze on 13.12.24.
//

import SwiftUI

struct DashedGroupBoxStyle: GroupBoxStyle {
    func makeBody(configuration: Configuration) -> some View {
        VStack {
            VStack(
                alignment: .leading,
                spacing: .opalMedium
            ) {
                configuration.label
                
                Line()
                    .stroke(style: .init(lineWidth: 1, lineCap: .square, dash: [2, 3]))
                    .frame(maxHeight: 1)
                    .foregroundStyle(.opalBorder)
                
                configuration.content
            }
            .padding(.horizontal, 13)
            .padding(.vertical, 16)
        }
        .background {
            RoundedRectangle(cornerRadius: 17)
                .stroke(style: .init(lineWidth: 1, lineCap: .square, dash: [2, 3]))
                .foregroundStyle(.opalBorder)
        }
    }
}

extension GroupBoxStyle where Self == DashedGroupBoxStyle {
    static var dashedRoundedRectangle: DashedGroupBoxStyle {
        DashedGroupBoxStyle()
    }
}
