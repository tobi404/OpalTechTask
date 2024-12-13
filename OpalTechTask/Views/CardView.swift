//
//  CardView.swift
//  OpalTechTask
//
//  Created by Beka Demuradze on 13.12.24.
//

import SwiftUI

// TODO: - Theme coloring
struct CardView: View {
    var body: some View {
        VStack(spacing: .opalSmall) {
            Image(.logo)
                .resizable()
                .frame(width: 85.8, height: 40.52)
            
            Text("30-day Guest Pass")
                .font(.opalFootnote(.medium))
        }
        .foregroundStyle(.white)
        .infinite()
        .background(alignment: .center) {
            GeometryReader { proxy in
                HStack(alignment: .center) {
                    Image(.seal)
                        .resizable()
                        .scaledToFit()
                        .frame(width: proxy.size.width - 120, height: proxy.size.height + 32)
                        .offset(y: -24)
                        .blendMode(.multiply)
                        .opacity(0.55)
                }
                .infiniteWidth(alignment: .center)
            }
        }
        .background {
            MeshGradient(
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
                    .indigo,
                    .purple,
                    .purple,
                    .purple,
                    .indigo,
                    .indigo,
                    .purple,
                    .indigo,
                    .indigo,
                    .purple,
                ]
            )
        }
        .clipShape(.rect(cornerRadius: .opalCornerRadius))
        .overlay {
            RoundedRectangle(cornerRadius: .opalCornerRadius)
                .stroke(.white.opacity(0.5), lineWidth: 1)
        }
    }
}

#Preview {
    CardView()
        .frame(maxHeight: 184)
        .padding()
}
