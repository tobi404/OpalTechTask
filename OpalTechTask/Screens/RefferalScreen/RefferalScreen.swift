//
//  RefferalScreen.swift
//  OpalTechTask
//
//  Created by Beka Demuradze on 13.12.24.
//

import SwiftUI

struct RefferalScreen: View {
    @State var vm = RefferalViewModel()
    
    var body: some View {
        ScrollView {
            VStack(spacing: .opalLarge) {
                RoundedRectangle(cornerRadius: 2)
                    .frame(height: 4)
                    .frame(maxWidth: 40)
                    .foregroundStyle(.opalSecondary)
                    .blendMode(.overlay)
                
                CardView()
                    .frame(minHeight: 184)
                
                Text("Give a friend unlimited access to Opal Pro, including unlimited schedules, app limits, deep focus, whitelisting and more")
                    .multilineTextAlignment(.center)
                    .font(.opalBody(.regular))
                    .foregroundStyle(.white)
                
                ReferedFriendsView()
                
                VStack(spacing: .opalSmall) {
                    ShareLink(item: URL(string: "https://opal.so/")!) {
                        Label("Add Friends", systemImage: "person.crop.circle.badge.plus")
                            .infiniteWidth(alignment: .center)
                    }
                    
                    ShareLink(item: URL(string: "https://opal.so/")!) {
                        Label("Share Referral Link", systemImage: "square.and.arrow.up")
                            .infiniteWidth(alignment: .center)
                            .foregroundStyle(.black)
                    }
                    .tint(.white)
                }
                .buttonStyle(.borderedProminent)
                .buttonBorderShape(.capsule)
                
                LazyVStack {
                    ForEach(vm.rewards) { reward in
                        VStack {
                            RewardView(reward: reward)
                            
                            if reward != vm.rewards.last {
                                Image(systemName: "arrow.down")
                                    .foregroundStyle(.opalSecondary)
                                    .padding(.vertical, .opalSmall)
                            }
                        }
                    }
                }
            }
            .padding(.opalMedium)
            .background(alignment: .top) {
                Image(.gradientHalo)
                    .resizable()
                    .scaledToFit()
            }
        }
        .background(.opalBackground)
        .onAppear(perform: vm.onAppear)
        .environment(vm)
    }
}

#Preview {
    RefferalScreen()
}
