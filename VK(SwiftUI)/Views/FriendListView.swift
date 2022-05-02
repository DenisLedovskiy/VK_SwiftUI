//
//  FriendListView.swift
//  VK(SwiftUI)
//
//  Created by Денис Ледовский on 28.04.2022.
//

import SwiftUI

struct FriendListView: View {

    var friends: [ViewDataCell] = FriendList.friends

    var body: some View {

        List(friends.sorted(by: { $0.name < $1.name }), id: \.id) { friend in
                NavigationLink(destination: GalleryView(gallery: friend), label: {
                    CellContentView(friends: friend)
                })
            }
            .navigationBarTitle("Друзья", displayMode: .inline)
    }
}

struct FriendListView_Previews: PreviewProvider {
    static var previews: some View {
        FriendListView()
    }
}
