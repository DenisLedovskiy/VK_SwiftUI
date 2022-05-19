//
//  FriendListView.swift
//  VK(SwiftUI)
//
//  Created by Денис Ледовский on 28.04.2022.
//

import SwiftUI

struct FriendListView: View {

//    var friends: [ViewDataCell] = FriendList.friends

    @ObservedObject var viewModel: FriendsViewFactory

    init(viewModel: FriendsViewFactory) {
        self.viewModel = viewModel
    }

    var body: some View {

        List(viewModel.friends.sorted(by: { $0.name < $1.name }), id: \.id) { friend in
            NavigationLink(destination: GalleryView(viewModel: GalleryViewFactory(friend: friend, api: PhotosAPI()))) {
                CellContentView(data: friend)
            }
        }
        .onAppear { viewModel.fetch() }
        .navigationBarTitle("Друзья", displayMode: .inline)
    }
}

struct FriendListView_Previews: PreviewProvider {
    static var previews: some View {
        FriendListView(viewModel: FriendsViewFactory(api: FriendsAPI()))
    }
}

//List(viewModel.friends.sorted(by: { $0.name < $1.name }), id: \.id) { friend in
//    NavigationLink(destination: GalleryView(friend: friend, api: PhotosAPI())), label: {
//        CellContentView(data: friend)
//    })
//}
