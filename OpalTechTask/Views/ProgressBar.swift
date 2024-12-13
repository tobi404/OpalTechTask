//
//  ProgressBar.swift
//  OpalTechTask
//
//  Created by Beka Demuradze on 13.12.24.
//

import SwiftUI

struct ProgressBar: View {
    @State var progress: Double = 0
    private let progressToSet: Double
    
    init(progress: Double) {
        progressToSet = max(0, min(1, progress))
    }
    
    var body: some View {
        Rectangle()
            .fill(.secondary)
            .frame(maxHeight: 6)
            .overlay {
                GeometryReader { proxy in
                    Rectangle()
                        .frame(maxWidth: proxy.size.width * progress)
                        .clipShape(.capsule)
                        .gradientMask()
                }
            }
            .clipShape(.capsule)
            .animation(.smooth, value: progress)
            .onAppear {
                progress = progressToSet
            }
    }
}

#Preview {
    ProgressBar(progress: 20)
}
