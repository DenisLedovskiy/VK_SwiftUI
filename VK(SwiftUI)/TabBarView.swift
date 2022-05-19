//
//  TabBarView.swift
//  VK(SwiftUI)
//
//  Created by Денис Ледовский on 28.04.2022.
//

import SwiftUI

struct TabBarView: View {
    var body: some View {
        TabView {
            FriendListView(viewModel: FriendsViewFactory(api: FriendsAPI()))
                .tabItem {
                    Image(systemName: "phone")
                    Text("Друзья")
                }
            GroupsListView(viewModel: GroupsViewFactory(api: GroupsAPI(), coreDS: CoreDataService(modelName: "ModelCoreData")))
                .tabItem {
                    Image(systemName: "heart")
                    Text("Группы")
                }
            NewsView()
                .tabItem{
                    Image(systemName: "newspaper")
                    Text("Новости")
                }
        }
    }
}

struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView()
    }
}
