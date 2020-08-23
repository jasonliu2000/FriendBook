//
//  Bundle-decode.swift
//  FriendBook
//
//  Created by Jason Liu on 8/22/20.
//  Copyright © 2020 Jason Liu. All rights reserved.
//

import Foundation 

// see Project 8, Bundle-Decodable.swift
// I put decode() function as an extension of Bundle so that all views are able to use it (FriendView needs to use it for its Preview struct)
extension Bundle {
    func decode() -> [Friend] {
        // var "url" stores the file url "friends.json"
        guard let url = Bundle.main.url(forResource: "friends", withExtension: "json") else {
            fatalError("Failed to locate friends.json in bundle")
        }
        
        // since Codable works with the Data type, we should therefore convert JSON string to Data type first
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Failed to load friends.json from bundle")
        }
        
        let decoder = JSONDecoder()
        
        // here, we decode var "data" (which is of type Data) into type Friend (struct)
        guard let loaded = try? decoder.decode([Friend].self, from: data) else {
            fatalError("Failed to decode friends.json from bundle")
        }

        return loaded
    }
}
