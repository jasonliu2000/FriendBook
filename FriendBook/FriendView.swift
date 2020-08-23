//
//  FriendView.swift
//  FriendBook
//
//  Created by Jason Liu on 8/22/20.
//  Copyright © 2020 Jason Liu. All rights reserved.
//

import SwiftUI

struct FriendView: View {
    let profile: Friend
    let friendsList: [Friend]
    let mutualFriends: [Friend]
    
    init(friend: Friend, friendsList: [Friend]) {
        self.profile = friend
        self.friendsList = friendsList
        var matches = [Friend]()
        
        for mutualFriend in profile.friends {
            if let match = friendsList.first(where: {$0.id == mutualFriend.id}) {
                matches.append(match)
            } else {
                fatalError("Missing \(mutualFriend.name)")
            }
        }
        
        self.mutualFriends = matches
    }
    
    var body: some View {
        ScrollView(.vertical) {
            VStack(alignment: .leading, spacing: 30) {
                Text("\(profile.isActiveString)")
                .foregroundColor(profile.isActive ? .green : .red)
                
                VStack(alignment: .leading) {
                    Text("About")
                    .font(.headline)
                    
                    Text("Age: \(profile.age)")
                    Text("Company: \(profile.company)")
                    Text("Email: \(profile.email)")
                    Text("Address: \(profile.address)")
                }
                
                VStack(alignment: .leading) {
                    Text("Description")
                    .font(.headline)
                        
                    Text("\(profile.about)")
                        //.padding([.horizontal])
                }
                
                
                VStack(alignment: .leading) {
                    Text("Misc.")
                    .font(.headline)
                    
                    Text("Registered: \(profile.registered)")
                    Text("Tags")
                }
                
                VStack(alignment: .leading) {
                    Text("Mutual Friends")
                    .font(.headline)
                                    
                    ForEach(mutualFriends) { mutualFriend in
                        NavigationLink(destination: FriendView(friend: mutualFriend, friendsList: self.friendsList)) {
                            VStack(alignment: .leading) {
                                HStack {
                                    Text("\(mutualFriend.name)")
                                    .font(.headline)
                                }
                                
                                Text("\(mutualFriend.isActiveString)")
                                    .foregroundColor(mutualFriend.isActive ? .green : .red)
                            }
                        }
                        .padding(.top, 10)
                    }
                }
                
            }
            .padding([.horizontal])
            
            
            
                
            .navigationBarTitle("\(profile.name)") // doesn't show up in Preview because modifier is supposed to be used with NavigationView?
        }
    }
}


struct FriendView_Previews: PreviewProvider {
    static let friends = Bundle.main.decode()
    
    static var previews: some View {
        FriendView(friend: friends[0], friendsList: friends) // this is a static preview so the var "friends" must also be static (hence the static prefix when declaring it in this struct)
    }
}
