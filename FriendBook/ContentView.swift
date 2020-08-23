//
//  ContentView.swift
//  FriendBook
//
//  Created by Jason Liu on 8/16/20.
//  Copyright © 2020 Jason Liu. All rights reserved.
//

import SwiftUI



struct ContentView: View {
    let friendsList = Bundle.main.decode()
    
    var body: some View {
        NavigationView {
            // don't need to put in "\.self" argument for parameter "id" in List because each object in the list "friends" already conforms to Identifiable https://www.hackingwithswift.com/books/ios-swiftui/why-does-self-work-for-foreach
            List(friendsList) { friend in
                NavigationLink(destination: FriendView(friend: friend, friendsList: self.friendsList)) {
                    VStack(alignment: .leading) {
                        Text("\(friend.name)")
                        .font(.headline)
                        
                        Text("\(friend.isActiveString)")
                            .foregroundColor(friend.isActive ? .green : .red)
                    }
                }
            }
        .navigationBarTitle("Directory")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
