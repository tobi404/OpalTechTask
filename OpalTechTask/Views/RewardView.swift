//
//  RewardView.swift
//  OpalTechTask
//
//  Created by Beka Demuradze on 13.12.24.
//

import SwiftUI

enum RewardState {
    case unlocked
    case canRedeem
    case inProgress
}

struct RewardView: View {
    @State var rewardState: RewardState = .canRedeem
    
    var body: some View {
        HStack(spacing: .opalLarge) {
            RoundedRectangle(cornerRadius: 14)
                .fill(.indigo)
                .frame(width: 100, height: 100)
            
            VStack(alignment: .leading, spacing: .opalTiny) {
                Text("1 FRIEND")
                    .font(.opalCaption(.semibold))
                    .foregroundStyle(.opalPrimary)
                    .gradientMask()
                
                Text("Loyal Gem")
                    .font(.opalBody(.bold))
                    .foregroundStyle(.opalPrimary)
                
                Text("Unlock this special milestone")
                    .font(.opalFootnote(.medium))
                    .foregroundStyle(.opalSecondary)
                
                switch rewardState {
                case .unlocked, .canRedeem:
                    unlockButton
                        .padding(.top, .opalSmall)
                case .inProgress:
                    Rectangle()
                        .fill(.indigo)
                        .frame(height: 6)
                        .padding(.top, .opalSmall)
                }
            }
            .infiniteWidth()
        }
        .padding(.opalMedium)
        .overlay {
            RoundedRectangle(cornerRadius: 16)
                .stroke(lineWidth: 1)
                .foregroundStyle(.opalBorder)
        }
    }
    
    var unlockButton: some View {
        Button {
            rewardState = rewardState == .unlocked ? .canRedeem : .unlocked
        } label: {
            HStack(spacing: 2) {
                if rewardState == .unlocked {
                    Image(systemName: "checkmark")
                }
                
                Text(rewardState == .unlocked ? "Claimed" : "Claim")
            }
            .foregroundStyle(rewardState == .unlocked ? .gray : .black)
            .frame(minWidth: 68)
            .font(.opalFootnote(.regular))
            .padding(.vertical, .opalTiny)
        }
        .buttonStyle(.borderedProminent)
        .buttonBorderShape(.capsule)
        .tint(rewardState == .canRedeem ? .opalPrimary : .gray)
        .disabled(rewardState != .canRedeem)
    }
}

#Preview {
    RewardView()
        .padding()
        .infinite()
        .background(.opalBackground)
}

