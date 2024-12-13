//
//  ReferedFriendsView.swift
//  OpalTechTask
//
//  Created by Beka Demuradze on 13.12.24.
//

import SwiftUI

// TODO: Refactor components
struct ReferedFriendsView: View {
    @Environment(RefferalViewModel.self) var vm
    
    var progress: Double {
        let count = vm.nextReward?.friendCountToUnlock ?? 0
        return Double(vm.friends.count) / Double(count)
    }
    
    var canClaim: Bool {
        vm.friends.count >= (vm.nextReward?.friendCountToUnlock ?? 0)
    }
    
    var body: some View {
        GroupBox {
            HStack {
                Image(vm.nextReward?.imageName ?? "person")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 72, height: 72)
                    .clipShape(.rect(cornerRadius: 10))
                    .redacted(reason: vm.nextReward == nil ? .placeholder : [])
                
                VStack(alignment: .leading, spacing: 4) {
                    Text("Next Unlock:")
                        .font(.opalFootnote(.semibold))
                        .foregroundStyle(.opalSecondary)
                    
                    HStack {
                        Text(vm.nextReward?.title ?? "Reward title")
                            .font(.opalBody(.semibold))
                            .foregroundStyle(.opalPrimary)
                            .infiniteWidth()
                        
                        Text("\(vm.friends.count)/\(vm.nextReward?.friendCountToUnlock ?? 0)")
                            .foregroundStyle(.opalSecondary)
                            .font(.opalFootnote(.semibold))
                            .opacity(canClaim ? 0 : 1)
                    }
                    .redacted(reason: vm.nextReward == nil ? .placeholder : [])
                    
                    ProgressBar(progress: progress)
                        .padding(.top, 4)
                        .opacity(canClaim ? 0 : 1)
                }
                
                if
                    let nextReward = vm.nextReward,
                    canClaim
                {
                    ClaimButton(
                        action: vm.claimDidTapped,
                        reward: nextReward
                    )
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
                            .opacity(vm.friends.isEmpty ? 0 : 1)
                        
                        Text("\(vm.friends.count)")
                            .redacted(reason: vm.nextReward == nil ? .placeholder : [])
                            .font(.opalBody(.semibold))
                            .opacity(vm.friends.isEmpty ? 0 : 1)
                    }
                    
                    if !vm.friends.isEmpty {
                        FriendsStack(friends: vm.friends)
                            .padding(.leading, .opalTiny)
                    }
                }
                .animation(.smooth, value: vm.friends.isEmpty)
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
        .environment(RefferalViewModel())
}
