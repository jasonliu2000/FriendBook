//
//  Friends.swift
//  FriendBook
//
//  Created by Jason Liu on 8/17/20.
//  Copyright © 2020 Jason Liu. All rights reserved.
//

import Foundation

struct Friend: Codable, Identifiable {
    let id: String
    let isActive: Bool
    let name: String
    let age: Int
    let company: String
    let email: String
    let address: String
    let about: String
    let registered: String
    let tags: [String]
    
    let friends: [MutualFriend]
    struct MutualFriend: Codable {
        let id: String
        let name: String
    }
    
    var isActiveString: String {
        return isActive ? "Active" : "Inactive"
    }
}
