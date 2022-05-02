//
//  GroupsView.swift
//  VK(SwiftUI)
//
//  Created by Денис Ледовский on 28.04.2022.
//

import SwiftUI

struct GroupsListView: View {

    var groups: [ViewDataCell] = GroupList.groups

    var body: some View {

        List(groups.sorted(by: { $0.name < $1.name }), id: \.id) { group in
            CellContentView(friends: group)
        }
        .navigationBarTitle("Группы", displayMode: .inline)
    }
}

struct GroupsView_Previews: PreviewProvider {
    static var previews: some View {
        GroupsListView()
    }
}
