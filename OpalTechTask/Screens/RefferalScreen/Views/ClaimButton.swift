//
//  ClaimButton.swift
//  OpalTechTask
//
//  Created by Beka Demuradze on 13.12.24.
//

import SwiftUI

struct ClaimButton: View {
    let action: ((RewardModel) -> Void)?
    let reward: RewardModel
    
    var body: some View {
        Button {
            action?(reward)
        } label: {
            HStack(spacing: 2) {
                if reward.claimed {
                    Image(systemName: "checkmark")
                }
                
                Text(reward.claimed ? "Claimed" : "Claim")
            }
            .foregroundStyle(reward.claimed ? .gray : .black)
            .frame(minWidth: 68)
            .font(.opalFootnote(.regular))
            .padding(.vertical, .opalTiny)
        }
        .buttonStyle(.borderedProminent)
        .buttonBorderShape(.capsule)
        .tint(reward.claimed ? .gray : .opalPrimary)
        .disabled(reward.claimed)
        .animation(.smooth, value: reward.claimed)
    }
}
