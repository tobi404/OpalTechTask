//
//  RewardModel.swift
//  OpalTechTask
//
//  Created by Beka Demuradze on 13.12.24.
//

import Foundation

struct RewardModel: Identifiable {
    let id = UUID()
    let friendCountToUnlock: Int
    let title: String
    let description: String
    let imageName: String
    let excludePremium: Bool
    var claimed: Bool
}

extension RewardModel: Equatable {}
