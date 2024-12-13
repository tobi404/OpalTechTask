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
    let reward: RewardModel
    @Environment(RefferalViewModel.self) var vm
    
    var progressReached: Bool {
        vm.friends.count >= reward.friendCountToUnlock
    }
    
    var progressBarValue: Double {
        Double(vm.friends.count) / Double(reward.friendCountToUnlock)
    }
    
    var body: some View {
        HStack(spacing: .opalLarge) {
            Image(reward.imageName)
                .resizable()
                .scaledToFill()
                .background(.opalBorder)
                .frame(width: 100, height: 100)
                .clipShape(.rect(cornerRadius: 14))
            
            VStack(alignment: .leading, spacing: .opalTiny) {
                Text("^[\(reward.friendCountToUnlock) FRIEND](inflect: true)")
                    .font(.opalCaption(.semibold))
                    .foregroundStyle(.opalPrimary)
                    .gradientMask()
                
                Text(reward.title)
                    .font(.opalBody(.bold))
                    .foregroundStyle(.opalPrimary)
                
                Text(reward.description)
                    .font(.opalFootnote(.medium))
                    .foregroundStyle(.opalSecondary)
                
                if progressReached {
                    unlockButton
                        .padding(.top, .opalSmall)
                } else {
                    ProgressBar(progress: progressBarValue)
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
            vm.claimDidTapped(for: reward)
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

#Preview {
    RewardView(reward: .init(friendCountToUnlock: 20, title: "Some title", description: "Some long description", imageName: "person", claimed: true))
        .padding()
        .infinite()
        .background(.opalBackground)
        .environment(RefferalViewModel())
}

