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
            FriendListView()
                .tabItem {
                    Image(systemName: "phone")
                    Text("Друзья")
                }
            GroupsListView()
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
