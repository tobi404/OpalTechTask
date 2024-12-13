//
//  RefferalListener.swift
//  OpalTechTask
//
//  Created by Beka Demuradze on 14.12.24.
//

import SwiftUI

final class RefferalListener {
    var rewardsStream: AsyncStream<[RewardModel]> {
        AsyncStream { continuation in
            self.continuation = continuation
        }
    }
    
    private var continuation: AsyncStream<[RewardModel]>.Continuation?
        
    func startEmission() {
        Task {
            try? await Task.sleep(for: .seconds(1))
            
            continuation?.yield(
                [
                    RewardModel.init(
                        friendCountToUnlock: 1,
                        title: "Loyal Gem",
                        description: "Unlock this special milestone",
                        imageName: "reward1",
                        excludePremium: false,
                        claimed: true
                    ),
                    RewardModel.init(
                        friendCountToUnlock: 3,
                        title: "Soulful Gem",
                        description: "Unlock this special milestone",
                        imageName: "reward2",
                        excludePremium: false,
                        claimed: false
                    ),
                    RewardModel.init(
                        friendCountToUnlock: 5,
                        title: "1 Year of Opal Pro",
                        description: "Unlock one whole year of Opal Pro for Free",
                        imageName: "reward3", excludePremium: true,
                        claimed: false
                    )
                ]
            )
            
            try? await Task.sleep(for: .seconds(0.5))
            
            continuation?.yield(
                [
                    RewardModel.init(
                        friendCountToUnlock: 10,
                        title: "Popular gem",
                        description: "Unlock this special milestone",
                        imageName: "reward4",
                        excludePremium: false,
                        claimed: false
                    ),
                    RewardModel.init(
                        friendCountToUnlock: 20,
                        title: "Special Gift",
                        description: "Contact us to receive a special gift from the Opal Team",
                        imageName: "reward5",
                        excludePremium: false,
                        claimed: false
                    ),
                    RewardModel.init(
                        friendCountToUnlock: 100,
                        title: "Mistery Gift",
                        description: "Contact us to receive a life changing gift from Opal",
                        imageName: "reward6",
                        excludePremium: false,
                        claimed: false
                    )
                ]
            )
            
            finish()
        }
    }
    
    // Signal that no more values will be emitted
    private func finish() {
        continuation?.finish()
    }
}
