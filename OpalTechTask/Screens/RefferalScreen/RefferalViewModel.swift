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
    var nextReward: RewardModel?
    
    private let refferalListener = RefferalListener()
    private var premiumUser = false
    
    func onAppear() {
        refferalListener.startEmission()
    }
    
    func viewTask() async {
        Task {
            await loadData()
        }
        await listenForRewards()
    }
    
    func claimDidTapped(for reward: RewardModel) {
        for i in rewards.indices where rewards[i] == reward {
            rewards[i].claimed = true
        }
        
        if nextReward == reward {
            nextReward?.claimed = true
        }
    }
}

private extension RefferalViewModel {
    func loadData() async {
        premiumUser = await isUserPremium()
        
        friends = await getFriends()
    }
    
    func isUserPremium() async -> Bool {
        try? await Task.sleep(for: .seconds(0.3))
        
        return true
    }
    
    func getFriends() async -> [FriendModel] {
        try? await Task.sleep(for: .seconds(0.2))
        
        return [
            FriendModel(profileImageName: "person"),
            FriendModel(profileImageName: "person"),
            FriendModel(profileImageName: "person")
        ]
    }
    
    func listenForRewards() async {
        for await rewards in refferalListener.rewardsStream {
            self.rewards.append(contentsOf: rewards)
            determineNextReward()
        }
    }
    
    func determineNextReward() {
        if premiumUser {
            rewards = rewards
                .filter {
                    $0.excludePremium == false
                }
        }
        
        for i in rewards.indices {
            let reward = rewards[i]
            
            if
                reward.claimed == false,
                reward.friendCountToUnlock <= friends.count
            {
                nextReward = reward
                break
            }
            
            if reward.friendCountToUnlock > friends.count {
                nextReward = reward
                break
            }
        }
    }
}
