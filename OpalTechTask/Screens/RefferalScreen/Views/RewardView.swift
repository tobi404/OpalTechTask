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
                    ClaimButton(action: vm.claimDidTapped, reward: reward)
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
}

#Preview {
    RewardView(reward: .init(friendCountToUnlock: 20, title: "Some title", description: "Some long description", imageName: "person", excludePremium: false, claimed: true))
        .padding()
        .infinite()
        .background(.opalBackground)
        .environment(RefferalViewModel())
}

