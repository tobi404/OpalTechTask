//
//  RefferalViewModel.swift
//  OpalTechTask
//
//  Created by Beka Demuradze on 13.12.24.
//

import SwiftUI

@Observable
final class RefferalViewModel {
    var friends = [FriendModel]()
    var rewards = [RewardModel]()
    var nextReward: RewardModel? = RewardModel.init(friendCountToUnlock: 5, title: "Title", description: "Description", imageName: "image", claimed: false)
        
    func onAppear() {
        Task {
            await loadData()
        }
    }
    
    func claimDidTapped(for reward: RewardModel) {
        for i in rewards.indices where rewards[i] == reward {
            rewards[i].claimed = true
        }
    }
}

private extension RefferalViewModel {
    func loadData() async {
        try? await Task.sleep(for: .seconds(1))
        
        friends = [
            FriendModel(profileImageName: "person"),
            FriendModel(profileImageName: "person"),
            FriendModel(profileImageName: "person")
        ]
        rewards = [
            RewardModel.init(
                friendCountToUnlock: 1,
                title: "Loyal Gem",
                description: "Unlock this special milestone",
                imageName: "reward1",
                claimed: true
            ),
            RewardModel.init(
                friendCountToUnlock: 3,
                title: "Soulful Gem",
                description: "Unlock this special milestone",
                imageName: "reward2",
                claimed: false
            ),
            RewardModel.init(
                friendCountToUnlock: 5,
                title: "1 Year of Opal Pro",
                description: "Unlock one whole year of Opal Pro for Free",
                imageName: "reward3",
                claimed: false
            ),
            RewardModel.init(
                friendCountToUnlock: 10,
                title: "Popular gem",
                description: "Unlock this special milestone",
                imageName: "reward4",
                claimed: false
            ),
            RewardModel.init(
                friendCountToUnlock: 20,
                title: "Special Gift",
                description: "Contact us to receive a special gift from the Opal Team",
                imageName: "reward5",
                claimed: false
            ),
            RewardModel.init(
                friendCountToUnlock: 100,
                title: "Mistery Gift",
                description: "Contact us to receive a life changing gift from Opal",
                imageName: "reward6",
                claimed: false
            )
        ]
    }
}
