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
    
    var body: some View {
        GroupBox {
            HStack {
                Image("person")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 72, height: 72)
                    .clipShape(.rect(cornerRadius: 10))
                
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
                    }
                    .redacted(reason: vm.nextReward == nil ? .placeholder : [])
                    
                    ProgressBar(progress: progress)
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
                        
                        Text("\(vm.friends.count)")
                            .font(.opalBody(.semibold))
                    }
                    
                    FriendsStack(friends: vm.friends)
                        .padding(.leading, .opalTiny)
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
        .environment(RefferalViewModel())
}
