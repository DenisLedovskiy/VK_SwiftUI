//
//  GrpupsViewFactory.swift
//  VK(SwiftUI)
//
//  Created by Денис Ледовский on 18.05.2022.
//

import SwiftUI
import CoreData

class GroupsViewFactory: ObservableObject {

    let coreDS: CoreDataService
    let api: GroupsService

    @Published var groups: [ViewDataCell] = []

    init(api: GroupsService, coreDS: CoreDataService) {
        self.api = api
        self.coreDS = coreDS
    }

    public func chooseLoad() {
        let groupsCoreData = coreDS.getAllGroups()
        if groupsCoreData.isEmpty {
            self.fetch()
        } else {
            self.loadFromCoreData()
        }
    }

    func fetch() {
        api.getGroups { [weak self] groups in
                 guard let self = self else { return }
            self.groups = self.fillGroupsArray(groups!)
             }
         }

    func loadFromCoreData() {
        let groupsCoreData = coreDS.getAllGroups()
        self.groups = groupsCoreData.map { $0.convertGroupsCoreData() }
    }

    func fillGroupsArray(_ groupsInitialResponse: GroupResponse) -> [ViewDataCell] {

        var groupsArray: [ViewDataCell] = []
        let groupsCount = groupsInitialResponse.response?.items.count
        let groups = groupsInitialResponse.response?.items

        for i in 0...groupsCount! - 1 {

            coreDS.saveGroup(name: (groups?[i].title)!,
                             imageUrl: (groups?[i].photo)!,
                             subscribes: "\(groups?[i].members_count.description ?? "--") подписчиков")

//            groupsArray.append(ViewDataCell(name: (groups?[i].title)!,
//                                            imageName: (groups?[i].photo)!,
//                                            status: "\(groups?[i].members_count.description ?? "--") подписчиков",
//                                            galleryId: 0))
        }
        let groupsCoreData = coreDS.getAllGroups()
        groupsArray = groupsCoreData.map { $0.convertGroupsCoreData() }
        return(groupsArray)
    }
}

