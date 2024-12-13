//
//  ReferedFriendsView.swift
//  OpalTechTask
//
//  Created by Beka Demuradze on 13.12.24.
//

import SwiftUI

// TODO: Refactor components
struct ReferedFriendsView: View {
    var body: some View {
        GroupBox {
            HStack {
                RoundedRectangle(cornerRadius: 10)
                    .fill(.indigo)
                    .frame(width: 72, height: 72)
                
                VStack(alignment: .leading, spacing: 4) {
                    Text("Next Unlock:")
                        .font(.opalFootnote(.semibold))
                        .foregroundStyle(.opalSecondary)
                    
                    HStack {
                        Text("1 Year of Opal Pro")
                            .font(.opalBody(.semibold))
                            .foregroundStyle(.opalPrimary)
                            .infiniteWidth()
                        
                        Text("4/5")
                            .foregroundStyle(.opalSecondary)
                            .font(.opalFootnote(.semibold))
                    }
                    
                    ProgressBar(progress: 0.3)
                        .padding(.top, 4)
                }
            }
        } label: {
            HStack {
                Text("Refered Friends:")
                    .font(.opalBody(.semibold))
                    .infiniteWidth()
                
                HStack(spacing: 6) {
                    
                    HStack(spacing: 2) {
                        Image(systemName: "person.fill")
                            .font(.footnote)
                        
                        Text("3")
                            .font(.opalBody(.semibold))
                    }
                    
                    Circle()
                        .frame(maxWidth: 24, maxHeight: 24)
                }
            }
            .foregroundStyle(.opalPrimary)
        }
        .groupBoxStyle(.dashedRoundedRectangle)
    }
}

#Preview {
    ReferedFriendsView()
        .padding()
        .infinite()
        .background(.opalBackground)
}
