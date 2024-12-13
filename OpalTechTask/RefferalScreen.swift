//
//  RefferalScreen.swift
//  OpalTechTask
//
//  Created by Beka Demuradze on 13.12.24.
//

import SwiftUI

struct RefferalScreen: View {
    var body: some View {
        ScrollView {
            VStack(spacing: .opalLarge) {
                CardView()
                    .frame(minHeight: 184)
                
                Text("Give a friend unlimited access to Opal Pro, including unlimited schedules, app limits, deep focus, whitelisting and more")
                    .multilineTextAlignment(.center)
                    .font(.opalBody(.regular))
                    .foregroundStyle(.white)
                
                ReferedFriendsView()
//                    .frame(minHeight: 155)
                
                VStack(spacing: .opalSmall) {
                    Button("Add as a friend") {
                        
                    }
                    .buttonStyle(.bordered)
                    
                    Button("Share referal link") {
                        
                    }
                    .buttonStyle(.bordered)
                }
                
                LazyVStack {
                    ForEach(0..<10) { num in
                        RoundedRectangle(cornerRadius: 15.86)
                            .fill(Color.indigo)
                            .frame(minHeight: 133)
                    }
                }
            }
        }
        .contentMargins(.horizontal, 16)
        .background(.opalBackground)
    }
}

#Preview {
    RefferalScreen()
}
