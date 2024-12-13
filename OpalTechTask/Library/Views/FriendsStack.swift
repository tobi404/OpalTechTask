//
//  FriendsStack.swift
//  OpalTechTask
//
//  Created by Beka Demuradze on 13.12.24.
//

import SwiftUI

struct FriendsStack: View {
    let friends: [FriendModel]
    @State var offset = 0
    
    var friendCount: Int {
        friends.prefix(3).count
    }
    
    var body: some View {
        ZStack {
            ForEach(Array(friends.prefix(3).enumerated()), id: \.offset) { index, friend in
                Image(friend.profileImageName)
                    .resizable()
                    .frame(width: 20, height: 20)
                    .clipShape(Circle())
                    .overlay {
                        Circle()
                            .stroke(lineWidth: 1)
                            .foregroundStyle(.white)
                    }
                    .offset(x: -CGFloat(index * offset))
            }
        }
        .frame(minWidth: 20 + CGFloat(friendCount * 8))
        .animation(.smooth, value: offset)
        .onAppear {
            offset = 8
        }
    }
}
