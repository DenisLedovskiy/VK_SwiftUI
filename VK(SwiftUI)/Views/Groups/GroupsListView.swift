//
//  GroupsView.swift
//  VK(SwiftUI)
//
//  Created by Денис Ледовский on 28.04.2022.
//

import SwiftUI

struct GroupsListView: View {

//    var groups: [ViewDataCell] = GroupList.groups
//    let coreDS: CoreDataService

    @ObservedObject var viewModel: GroupsViewFactory

    init(viewModel: GroupsViewFactory) {
        self.viewModel = viewModel
//        self.coreDS = coreDS
    }

    var body: some View {

        List(viewModel.groups.sorted(by: { $0.name < $1.name }), id: \.id) { group in
            CellContentView(data: group)
        }
//        .onAppear { viewModel.fetch() }
        .onAppear { viewModel.chooseLoad() }
        .navigationBarTitle("Группы", displayMode: .inline)
    }
}

struct GroupsView_Previews: PreviewProvider {
    static var previews: some View {
        GroupsListView(viewModel: GroupsViewFactory(api: GroupsAPI(), coreDS: CoreDataService(modelName: "ModelCoreData")))
    }
}
